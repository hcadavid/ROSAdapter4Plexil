<?xml version="1.0" encoding="UTF-8"?><PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tr="extended-plexil-translator" FileName="timed-op2.ple"><GlobalDeclarations LineNo="2" ColNo="5"><StateDeclaration LineNo="2" ColNo="5"><Name>time</Name><Return><Name>_return_0</Name><Type>Date</Type></Return></StateDeclaration><CommandDeclaration LineNo="5" ColNo="0"><Name>TurnFrontWheels</Name><Parameter><Type>Integer</Type></Parameter></CommandDeclaration><CommandDeclaration LineNo="8" ColNo="0"><Name>TurnRearWheels</Name><Parameter><Type>Integer</Type></Parameter></CommandDeclaration><CommandDeclaration LineNo="11" ColNo="0"><Name>MoveForward</Name><Parameter><Type>Integer</Type></Parameter></CommandDeclaration><CommandDeclaration LineNo="14" ColNo="0"><Name>MoveBackward</Name><Parameter><Type>Integer</Type></Parameter></CommandDeclaration><CommandDeclaration LineNo="16" ColNo="0"><Name>MoveSprinklerToLeft</Name></CommandDeclaration><CommandDeclaration LineNo="18" ColNo="0"><Name>MoveSprinklerToRight</Name></CommandDeclaration><CommandDeclaration LineNo="20" ColNo="0"><Name>OpenSprinkler</Name></CommandDeclaration><CommandDeclaration LineNo="22" ColNo="0"><Name>CloseSprinkler</Name></CommandDeclaration><CommandDeclaration LineNo="25" ColNo="0"><Name>Stop</Name></CommandDeclaration><CommandDeclaration LineNo="27" ColNo="0"><Name>pprint</Name></CommandDeclaration></GlobalDeclarations><Node NodeType="NodeList" epx="Sequence" LineNo="33" ColNo="2"><NodeId>ObstacleAvoid</NodeId><VariableDeclarations><DeclareVariable LineNo="32" ColNo="2"><Name>steps</Name><Type>Integer</Type><InitialValue><IntegerValue>0</IntegerValue></InitialValue></DeclareVariable></VariableDeclarations><InvariantCondition><NOT><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">Concurrence__0</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">Concurrence__0</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND></NOT></InvariantCondition><NodeBody><NodeList><Node NodeType="NodeList" epx="Concurrence" LineNo="35" ColNo="2"><NodeId>Concurrence__0</NodeId><VariableDeclarations><DeclareVariable LineNo="36" ColNo="4"><Name>delay1</Name><Type>Real</Type><InitialValue><RealValue>3</RealValue></InitialValue></DeclareVariable><DeclareVariable LineNo="37" ColNo="4"><Name>tolerance</Name><Type>Real</Type><InitialValue><RealValue>0.1</RealValue></InitialValue></DeclareVariable><DeclareVariable LineNo="38" ColNo="4"><Name>currentAngle</Name><Type>Integer</Type><InitialValue><IntegerValue>0</IntegerValue></InitialValue></DeclareVariable><DeclareVariable LineNo="39" ColNo="4"><Name>timingComplete</Name><Type>Boolean</Type><InitialValue><BooleanValue>false</BooleanValue></InitialValue></DeclareVariable></VariableDeclarations><NodeBody><NodeList><Node NodeType="Command" LineNo="43" ColNo="8"><NodeId>StartMoving</NodeId><NodeBody><Command><Name><StringValue>MoveForward</StringValue></Name><Arguments LineNo="44" ColNo="20"><IntegerValue>30</IntegerValue></Arguments></Command></NodeBody></Node><Node NodeType="NodeList" epx="Sequence" LineNo="48" ColNo="8"><NodeId>TimedDistance</NodeId><RepeatCondition><BooleanValue>true</BooleanValue></RepeatCondition><InvariantCondition><NOT><OR><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">Wait__2</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">Wait__2</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">COMMAND__3</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">COMMAND__3</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">ASSIGNMENT__4</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">ASSIGNMENT__4</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND></OR></NOT></InvariantCondition><NodeBody><NodeList><Node NodeType="Empty" epx="Wait" LineNo="49" ColNo="8"><NodeId>Wait__2</NodeId><EndCondition><GE><LookupOnChange><Name><StringValue>time</StringValue></Name><Tolerance><RealVariable>tolerance</RealVariable></Tolerance></LookupOnChange><ADD><RealVariable>delay1</RealVariable><NodeTimepointValue><NodeId>Wait__2</NodeId><NodeStateValue>EXECUTING</NodeStateValue><Timepoint>START</Timepoint></NodeTimepointValue></ADD></GE></EndCondition></Node><Node NodeType="Command" LineNo="49" ColNo="8"><NodeId>COMMAND__3</NodeId><StartCondition><EQInternal><NodeStateVariable><NodeRef dir="sibling">Wait__2</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></StartCondition><NodeBody><Command><Name><StringValue>pprint</StringValue></Name><Arguments LineNo="50" ColNo="16"><StringValue>Time completed</StringValue></Arguments></Command></NodeBody></Node><Node NodeType="Assignment" LineNo="51" ColNo="8"><NodeId>ASSIGNMENT__4</NodeId><StartCondition><EQInternal><NodeStateVariable><NodeRef dir="sibling">COMMAND__3</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></StartCondition><NodeBody><Assignment><BooleanVariable>timingComplete</BooleanVariable><BooleanRHS><BooleanValue>true</BooleanValue></BooleanRHS></Assignment></NodeBody></Node></NodeList></NodeBody></Node><Node NodeType="NodeList" epx="Sequence" LineNo="55" ColNo="8"><NodeId>TurnWheelsS</NodeId><StartCondition><AND><BooleanVariable>timingComplete</BooleanVariable><EQNumeric><IntegerVariable>currentAngle</IntegerVariable><IntegerValue>30</IntegerValue></EQNumeric></AND></StartCondition><RepeatCondition><BooleanValue>true</BooleanValue></RepeatCondition><InvariantCondition><NOT><OR><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">ASSIGNMENT__5</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">ASSIGNMENT__5</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">COMMAND__6</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">COMMAND__6</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">ASSIGNMENT__7</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">ASSIGNMENT__7</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">COMMAND__8</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">COMMAND__8</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND></OR></NOT></InvariantCondition><NodeBody><NodeList><Node NodeType="Assignment" LineNo="57" ColNo="8"><NodeId>ASSIGNMENT__5</NodeId><NodeBody><Assignment><BooleanVariable>timingComplete</BooleanVariable><BooleanRHS><BooleanValue>false</BooleanValue></BooleanRHS></Assignment></NodeBody></Node><Node NodeType="Command" LineNo="57" ColNo="8"><NodeId>COMMAND__6</NodeId><StartCondition><EQInternal><NodeStateVariable><NodeRef dir="sibling">ASSIGNMENT__5</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></StartCondition><NodeBody><Command><Name><StringValue>TurnFrontWheels</StringValue></Name><Arguments LineNo="58" ColNo="24"><IntegerValue>0</IntegerValue></Arguments></Command></NodeBody></Node><Node NodeType="Assignment" LineNo="59" ColNo="8"><NodeId>ASSIGNMENT__7</NodeId><StartCondition><EQInternal><NodeStateVariable><NodeRef dir="sibling">COMMAND__6</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></StartCondition><NodeBody><Assignment><IntegerVariable>currentAngle</IntegerVariable><NumericRHS><IntegerValue>0</IntegerValue></NumericRHS></Assignment></NodeBody></Node><Node NodeType="Command" LineNo="59" ColNo="8"><NodeId>COMMAND__8</NodeId><StartCondition><EQInternal><NodeStateVariable><NodeRef dir="sibling">ASSIGNMENT__7</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></StartCondition><NodeBody><Command><Name><StringValue>OpenSprinkler</StringValue></Name></Command></NodeBody></Node></NodeList></NodeBody></Node><Node NodeType="NodeList" epx="Sequence" LineNo="64" ColNo="8"><NodeId>TurnWheelsL</NodeId><StartCondition><AND><BooleanVariable>timingComplete</BooleanVariable><EQNumeric><IntegerVariable>currentAngle</IntegerVariable><IntegerValue>0</IntegerValue></EQNumeric></AND></StartCondition><RepeatCondition><BooleanValue>true</BooleanValue></RepeatCondition><InvariantCondition><NOT><OR><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">ASSIGNMENT__9</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">ASSIGNMENT__9</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">COMMAND__10</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">COMMAND__10</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">ASSIGNMENT__11</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">ASSIGNMENT__11</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND><AND><EQInternal><NodeOutcomeVariable><NodeRef dir="child">COMMAND__12</NodeRef></NodeOutcomeVariable><NodeOutcomeValue>FAILURE</NodeOutcomeValue></EQInternal><EQInternal><NodeStateVariable><NodeRef dir="child">COMMAND__12</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></AND></OR></NOT></InvariantCondition><NodeBody><NodeList><Node NodeType="Assignment" LineNo="66" ColNo="8"><NodeId>ASSIGNMENT__9</NodeId><NodeBody><Assignment><BooleanVariable>timingComplete</BooleanVariable><BooleanRHS><BooleanValue>false</BooleanValue></BooleanRHS></Assignment></NodeBody></Node><Node NodeType="Command" LineNo="66" ColNo="8"><NodeId>COMMAND__10</NodeId><StartCondition><EQInternal><NodeStateVariable><NodeRef dir="sibling">ASSIGNMENT__9</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></StartCondition><NodeBody><Command><Name><StringValue>TurnFrontWheels</StringValue></Name><Arguments LineNo="67" ColNo="24"><IntegerValue>30</IntegerValue></Arguments></Command></NodeBody></Node><Node NodeType="Assignment" LineNo="68" ColNo="8"><NodeId>ASSIGNMENT__11</NodeId><StartCondition><EQInternal><NodeStateVariable><NodeRef dir="sibling">COMMAND__10</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></StartCondition><NodeBody><Assignment><IntegerVariable>currentAngle</IntegerVariable><NumericRHS><IntegerValue>30</IntegerValue></NumericRHS></Assignment></NodeBody></Node><Node NodeType="Command" LineNo="68" ColNo="8"><NodeId>COMMAND__12</NodeId><StartCondition><EQInternal><NodeStateVariable><NodeRef dir="sibling">ASSIGNMENT__11</NodeRef></NodeStateVariable><NodeStateValue>FINISHED</NodeStateValue></EQInternal></StartCondition><NodeBody><Command><Name><StringValue>OpenSprinkler</StringValue></Name></Command></NodeBody></Node></NodeList></NodeBody></Node></NodeList></NodeBody></Node></NodeList></NodeBody></Node></PlexilPlan>