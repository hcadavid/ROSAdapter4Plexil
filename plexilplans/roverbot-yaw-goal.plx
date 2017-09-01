<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="roverbot-yaw-goal.ple">
   <GlobalDeclarations LineNo="14" ColNo="0">
      <CommandDeclaration LineNo="14" ColNo="0">
         <Name>RequestLinearVelocity</Name>
         <Parameter>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="15" ColNo="0">
         <Name>RequestAngularVelocity</Name>
         <Parameter>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="16" ColNo="0">
         <Name>pprint</Name>
      </CommandDeclaration>
   </GlobalDeclarations>
   <Node NodeType="NodeList" epx="Sequence" LineNo="20" ColNo="1">
      <NodeId>All</NodeId>
      <VariableDeclarations>
         <DeclareVariable LineNo="19" ColNo="1">
            <Name>startingYaw</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="20" ColNo="1">
            <Name>startingXPos</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="21" ColNo="1">
            <Name>startingYPos</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="23" ColNo="1">
            <Name>finalYPos</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="24" ColNo="1">
            <Name>finalXPos</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="25" ColNo="1">
            <Name>currXPos</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="25" ColNo="1">
            <Name>currYPos</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="27" ColNo="1">
            <Name>FIELD_WIDTH</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>4</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="28" ColNo="1">
            <Name>FIELD_HEIGHT</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>4</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="29" ColNo="1">
            <Name>TURN_YAW_DELTA</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0.1</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="30" ColNo="1">
            <Name>completeTurn</Name>
            <Type>Boolean</Type>
            <InitialValue>
               <BooleanValue>false</BooleanValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="31" ColNo="1">
            <Name>PI</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>3.1416</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="33" ColNo="1">
            <Name>targetYaw</Name>
            <Type>Real</Type>
         </DeclareVariable>
      </VariableDeclarations>
      <StartCondition>
         <EQNumeric>
            <LookupOnChange>
               <Name>
                  <StringValue>Ready</StringValue>
               </Name>
            </LookupOnChange>
            <IntegerValue>1</IntegerValue>
         </EQNumeric>
      </StartCondition>
      <InvariantCondition>
         <NOT>
            <AND>
               <EQInternal>
                  <NodeOutcomeVariable>
                     <NodeRef dir="child">Sequence__0</NodeRef>
                  </NodeOutcomeVariable>
                  <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
               </EQInternal>
               <EQInternal>
                  <NodeStateVariable>
                     <NodeRef dir="child">Sequence__0</NodeRef>
                  </NodeStateVariable>
                  <NodeStateValue>FINISHED</NodeStateValue>
               </EQInternal>
            </AND>
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="NodeList" epx="Sequence" LineNo="38" ColNo="1">
               <NodeId>Sequence__0</NodeId>
               <InvariantCondition>
                  <NOT>
                     <OR>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">InitialOdometryLookup</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">InitialOdometryLookup</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">Concurrence__5</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">Concurrence__5</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                     </OR>
                  </NOT>
               </InvariantCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="41" ColNo="3">
                        <NodeId>InitialOdometryLookup</NodeId>
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
                                          <NodeRef dir="child">ASSIGNMENT__2</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">ASSIGNMENT__2</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">ASSIGNMENT__3</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">ASSIGNMENT__3</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">ASSIGNMENT__4</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">ASSIGNMENT__4</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Assignment" LineNo="41" ColNo="3">
                                 <NodeId>ASSIGNMENT__1</NodeId>
                                 <NodeBody>
                                    <Assignment>
                                       <RealVariable>startingYaw</RealVariable>
                                       <NumericRHS>
                                          <LookupNow>
                                             <Name>
                                                <StringValue>Yaw</StringValue>
                                             </Name>
                                          </LookupNow>
                                       </NumericRHS>
                                    </Assignment>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Assignment" LineNo="42" ColNo="3">
                                 <NodeId>ASSIGNMENT__2</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">ASSIGNMENT__1</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Assignment>
                                       <RealVariable>startingXPos</RealVariable>
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
                              <Node NodeType="Assignment" LineNo="43" ColNo="3">
                                 <NodeId>ASSIGNMENT__3</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">ASSIGNMENT__2</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Assignment>
                                       <RealVariable>startingYPos</RealVariable>
                                       <NumericRHS>
                                          <LookupNow>
                                             <Name>
                                                <StringValue>YPosition</StringValue>
                                             </Name>
                                          </LookupNow>
                                       </NumericRHS>
                                    </Assignment>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Assignment" LineNo="44" ColNo="3">
                                 <NodeId>ASSIGNMENT__4</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">ASSIGNMENT__3</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Assignment>
                                       <RealVariable>targetYaw</RealVariable>
                                       <NumericRHS>
                                          <ADD LineNo="44" ColNo="24">
                                             <RealVariable>startingYaw</RealVariable>
                                             <DIV LineNo="44" ColNo="28">
                                                <RealVariable>PI</RealVariable>
                                                <IntegerValue>2</IntegerValue>
                                             </DIV>
                                          </ADD>
                                       </NumericRHS>
                                    </Assignment>
                                 </NodeBody>
                              </Node>
                           </NodeList>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Concurrence" LineNo="48" ColNo="2">
                        <NodeId>Concurrence__5</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">InitialOdometryLookup</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Command" LineNo="50" ColNo="4">
                                 <NodeId>Forward</NodeId>
                                 <RepeatCondition>
                                    <BooleanValue>true</BooleanValue>
                                 </RepeatCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>RequestLinearVelocity</StringValue>
                                       </Name>
                                       <Arguments LineNo="51" ColNo="26">
                                          <RealValue>0.5</RealValue>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="NodeList" epx="Sequence" LineNo="56" ColNo="4">
                                 <NodeId>Steer</NodeId>
                                 <RepeatCondition>
                                    <BooleanValue>true</BooleanValue>
                                 </RepeatCondition>
                                 <InvariantCondition>
                                    <NOT>
                                       <OR>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">COMMAND__7</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">COMMAND__7</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">COMMAND__8</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">COMMAND__8</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                       </OR>
                                    </NOT>
                                 </InvariantCondition>
                                 <NodeBody>
                                    <NodeList>
                                       <Node NodeType="Command" LineNo="56" ColNo="4">
                                          <NodeId>COMMAND__7</NodeId>
                                          <NodeBody>
                                             <Command>
                                                <Name>
                                                   <StringValue>RequestAngularVelocity</StringValue>
                                                </Name>
                                                <Arguments LineNo="57" ColNo="27">
                                                   <RealValue>1</RealValue>
                                                </Arguments>
                                             </Command>
                                          </NodeBody>
                                       </Node>
                                       <Node NodeType="Command" LineNo="57" ColNo="4">
                                          <NodeId>COMMAND__8</NodeId>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">COMMAND__7</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </StartCondition>
                                          <NodeBody>
                                             <Command>
                                                <Name>
                                                   <StringValue>pprint</StringValue>
                                                </Name>
                                                <Arguments LineNo="58" ColNo="11">
                                                   <StringValue>Yaw: </StringValue>
                                                   <LookupNow>
                                                      <Name>
                                                         <StringValue>Yaw</StringValue>
                                                      </Name>
                                                   </LookupNow>
                                                </Arguments>
                                             </Command>
                                          </NodeBody>
                                       </Node>
                                    </NodeList>
                                 </NodeBody>
                              </Node>
                           </NodeList>
                        </NodeBody>
                     </Node>
                  </NodeList>
               </NodeBody>
            </Node>
         </NodeList>
      </NodeBody>
   </Node>
</PlexilPlan>