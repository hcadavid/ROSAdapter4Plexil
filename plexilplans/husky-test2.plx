<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="husky-test2.ple">
   <GlobalDeclarations LineNo="12" ColNo="0">
      <CommandDeclaration LineNo="12" ColNo="0">
         <Name>RequestLinearVelocity</Name>
         <Parameter>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="13" ColNo="0">
         <Name>RequestAngularVelocity</Name>
         <Parameter>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="14" ColNo="0">
         <Name>pprint</Name>
      </CommandDeclaration>
   </GlobalDeclarations>
   <Node NodeType="NodeList" epx="Concurrence" LineNo="17" ColNo="4">
      <NodeId>All</NodeId>
      <NodeBody>
         <NodeList>
            <Node NodeType="NodeList" epx="Sequence" LineNo="20" ColNo="12">
               <NodeId>XPTest</NodeId>
               <VariableDeclarations>
                  <DeclareVariable LineNo="19" ColNo="12">
                     <Name>curval</Name>
                     <Type>Real</Type>
                  </DeclareVariable>
               </VariableDeclarations>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>XPosition</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>5</IntegerValue>
                  </GT>
               </StartCondition>
               <InvariantCondition>
                  <NOT>
                     <OR>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">ASSIGNMENT__1</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">ASSIGNMENT__1</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">COMMAND__2</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">COMMAND__2</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                     </OR>
                  </NOT>
               </InvariantCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="Assignment" LineNo="23" ColNo="12">
                        <NodeId>ASSIGNMENT__1</NodeId>
                        <NodeBody>
                           <Assignment>
                              <RealVariable>curval</RealVariable>
                              <NumericRHS>
                                 <LookupNow>
                                    <Name>
                                       <StringValue>XPosition</StringValue>
                                    </Name>
                                 </LookupNow>
                              </NumericRHS>
                           </Assignment>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="23" ColNo="12">
                        <NodeId>COMMAND__2</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">ASSIGNMENT__1</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <Command>
                              <Name>
                                 <StringValue>pprint</StringValue>
                              </Name>
                              <Arguments LineNo="24" ColNo="19">
                                 <StringValue>xp-ok:</StringValue>
                                 <RealVariable>curval</RealVariable>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                  </NodeList>
               </NodeBody>
            </Node>
            <Node NodeType="Command" LineNo="30" ColNo="16">
               <NodeId>YPTest</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>YPosition</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>5</IntegerValue>
                  </GT>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="31" ColNo="23">
                        <StringValue>yp-ok</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
            <Node NodeType="Command" LineNo="36" ColNo="16">
               <NodeId>YawPTest</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>Yaw</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>5</IntegerValue>
                  </GT>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="37" ColNo="23">
                        <StringValue>yaw-ok</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
            <Node NodeType="Command" LineNo="42" ColNo="16">
               <NodeId>LinearSTest</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>LinearVelocity</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>5</IntegerValue>
                  </GT>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="43" ColNo="23">
                        <StringValue>lv-ok</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
            <Node NodeType="Command" LineNo="48" ColNo="16">
               <NodeId>AngularVTest</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>AngularVelocity</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>5</IntegerValue>
                  </GT>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="49" ColNo="23">
                        <StringValue>av-ok</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
         </NodeList>
      </NodeBody>
   </Node>
</PlexilPlan>