

#include "ECIRobotAdapter.hh"

#include "subscriber.hh"
#include "ECIRobotSystemHandler.hh"

#include "AdapterConfiguration.hh"
#include "AdapterFactory.hh"
#include "AdapterExecInterface.hh"
#include "Debug.hh"
#include "StateCacheEntry.hh"

#include <iostream>

using std::cout;
using std::cerr;
using std::endl;
using std::map;
using std::string;
using std::vector;
using std::copy;


///////////////////////////// Conveniences //////////////////////////////////

// A preamble for error messages.
static string error = "Error in ECIRobotAdapter: ";

// A prettier name for the "unknown" value.
static Value Unknown;

// A localized handle on the adapter, which allows a
// decoupling between the sample system and adapter.
static ECIRobotAdapter * Adapter;

// An empty argument vector.
static vector<Value> EmptyArgs;


///////////////////////////// State support //////////////////////////////////

// Queries the system for the value of a state and its arguments.
//
static Value fetch (const string& state_name, const vector<Value>& args)
{
  debugMsg("ECIRobotAdapter:fetch",
           "Fetch called on " << state_name << " with " << args.size() << " args");
  Value retval;

  // NOTE: A more streamlined approach to dispatching on state name
  // would be nice.

  if (state_name == "Size") retval = getSize();
  else if (state_name == "Speed") retval = getSpeed();
  else if (state_name == "Color") retval = getColor();
  else if (state_name == "at") {
    switch (args.size()) {
    case 0:
      retval = at ();
      break;
    case 1: {
      std::string s;
      args[0].getValue(s);
      retval = at (s); 
      break;
    }
    case 2: {
      int32_t arg0 = 0, arg1 = 0;
      args[0].getValue(arg0);
      args[1].getValue(arg1);
      retval = at (arg0, arg1);
      break;
    }
    default: {
      cerr << error << "invalid lookup of 'at'" << endl;
      retval = Unknown;
    }
    }
  }
  else {
    cerr << error << "invalid state: " << state_name << endl;
    retval = Unknown;
  }

  debugMsg("ECIRobotAdapter:fetch", "Fetch returning " << retval);
  return retval;
}


// The 'receive' functions are the subscribers for system state updates.  They
// receive the name of the state whose value has changed in the system.  Then
// they propagate the state's new value to the executive.

static void propagate (const State& state, const vector<Value>& value)
{
  Adapter->propagateValueChange (state, value);
}

static State createState (const string& state_name, const vector<Value>& value)
{
  State state(state_name, value.size());
  if (value.size() > 0)
  {
    for(size_t i=0; i<value.size();i++)
    {
      state.setParameter(i, value[i]);
    }
  }
  return state;
}

static void receive (const string& state_name, int val)
{
  propagate (createState(state_name, EmptyArgs),
             vector<Value> (1, val));
}

static void receive (const string& state_name, float val)
{
  propagate (createState(state_name, EmptyArgs),
             vector<Value> (1, val));
}

static void receive (const string& state_name, const string& val)
{
  propagate (createState(state_name, EmptyArgs),
             vector<Value> (1, val));
}

static void receive (const string& state_name, bool val, const string& arg)
{
  propagate (createState(state_name, vector<Value> (1, arg)),
             vector<Value> (1, val));
}

static void receive (const string& state_name, bool val, int arg1, int arg2)
{
  vector<Value> vec;
  vec.push_back (arg1);
  vec.push_back (arg2);
  propagate (createState(state_name, vec), vector<Value> (1, val));
}


///////////////////////////// Member functions //////////////////////////////////


ECIRobotAdapter::ECIRobotAdapter(AdapterExecInterface& execInterface,
                             const pugi::xml_node& configXml) :
    InterfaceAdapter(execInterface, configXml)
{
  debugMsg("ECIRobotAdapter", " created.");
}

bool ECIRobotAdapter::initialize()
{
  g_configuration->defaultRegisterAdapter(this);
  Adapter = this;
  setSubscriberInt (receive);
  setSubscriberReal (receive);
  setSubscriberString (receive);
  setSubscriberBoolString (receive);
  setSubscriberBoolIntInt (receive);
  debugMsg("ECIRobotAdapter", " initialized.");
  
  startThread();
  
  
  return true;
}

bool ECIRobotAdapter::start()
{
  debugMsg("ECIRobotAdapter", " started.");
  return true;
}

bool ECIRobotAdapter::stop()
{
  debugMsg("ECIRobotAdapter", " stopped.");
  return true;
}

bool ECIRobotAdapter::reset()
{
  debugMsg("ECIRobotAdapter", " reset.");
  return true;
}

bool ECIRobotAdapter::shutdown()
{
  debugMsg("ECIRobotAdapter", " shut down.");
  return true;
}


// Sends a command (as invoked in a Plexil command node) to the system and sends
// the status, and return value if applicable, back to the executive.
//
void ECIRobotAdapter::executeCommand(Command *cmd)
{
  const string &name = cmd->getName();
  debugMsg("ECIRobotAdapter", "Received executeCommand for " << name);  

  Value retval = Unknown;
  vector<Value> argv(10);
  const vector<Value>& args = cmd->getArgValues();
  copy (args.begin(), args.end(), argv.begin());

  // NOTE: A more streamlined approach to dispatching on command type
  // would be nice.
  string s;
  int32_t i1 = 0, i2 = 0;
  double d = 0.0;

  if (name == "SetSize") {
    args[0].getValue(d);
    setSize(d);
  }
  else if (name == "SetSpeed") {
    args[0].getValue(i1);
    setSpeed (i1);
  }
  else if (name == "SetColor") {
    args[0].getValue(s);
    setColor (s);
  }
  else if (name == "Move") {
    args[0].getValue(s);
    args[1].getValue(i1);
    args[2].getValue(i2);
    move (s, i1, i2);
  }
  else if (name == "Hello") 
    hello ();
  else if (name == "Square") {
    args[0].getValue(i1);
    retval = square (i1);
  }
  else 
    cerr << error << "invalid command: " << name << endl;

  // This sends a command handle back to the executive.
  m_execInterface.handleCommandAck(cmd, COMMAND_SENT_TO_SYSTEM);
  // This sends the command's return value (if expected) to the executive.
  if (retval != Unknown)
    m_execInterface.handleCommandReturn(cmd, retval);
  m_execInterface.notifyOfExternalEvent();
}

void ECIRobotAdapter::lookupNow(State const &state, StateCacheEntry &entry)
{
  // This is the name of the state as given in the plan's LookupNow
  string const &name = state.name();
  const vector<Value>& args = state.parameters();
  entry.update(fetch(name, args));
}


void ECIRobotAdapter::subscribe(const State& state)
{
  cout << "**** SUBSCRIBING!!\n";
  debugMsg("ECIRobotAdapter:subscribe", " processing state "
           << state.name());
  m_subscribedStates.insert(state);
}


void ECIRobotAdapter::unsubscribe (const State& state)
{
  debugMsg("ECIRobotAdapter:subscribe", " from state "
           << state.name());
  m_subscribedStates.erase(state);
}

// Does nothing.
void ECIRobotAdapter::setThresholds (const State& state, double hi, double lo)
{
}

void ECIRobotAdapter::setThresholds (const State& state, int32_t hi, int32_t lo)
{
}


void ECIRobotAdapter::propagateValueChange (const State& state,
                                          const vector<Value>& vals) const
{
    cout << "**** Propagating value changes\n";
  if (!isStateSubscribed(state)){
    cout << "**** Value changes propagation failed\n";
      return; 
  }
  else{
      cout << "**** Value changes propagation success\n";
    m_execInterface.handleValueChange(state, vals.front());
    m_execInterface.notifyOfExternalEvent();      
  }
    
}


bool ECIRobotAdapter::isStateSubscribed(const State& state) const
{
  return m_subscribedStates.find(state) != m_subscribedStates.end();
}

// Necessary boilerplate
extern "C" {
  void initECIRobotAdapter() {
    REGISTER_ADAPTER(ECIRobotAdapter, "ECIRobotAdapter");
  }
}
