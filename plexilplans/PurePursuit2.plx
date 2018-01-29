<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="PurePursuit2.ple">
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
      <CommandDeclaration LineNo="17" ColNo="5">
         <Name>distance</Name>
         <Return>
            <Name>_return_0</Name>
            <Type>Real</Type>
         </Return>
         <Parameter>
            <Name>x1</Name>
            <Type>Real</Type>
         </Parameter>
         <Parameter>
            <Name>y1</Name>
            <Type>Real</Type>
         </Parameter>
         <Parameter>
            <Name>x2</Name>
            <Type>Real</Type>
         </Parameter>
         <Parameter>
            <Name>y2</Name>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="18" ColNo="5">
         <Name>sin</Name>
         <Return>
            <Name>_return_0</Name>
            <Type>Real</Type>
         </Return>
         <Parameter>
            <Name>rad</Name>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="19" ColNo="5">
         <Name>cos</Name>
         <Return>
            <Name>_return_0</Name>
            <Type>Real</Type>
         </Return>
         <Parameter>
            <Name>rad</Name>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
   </GlobalDeclarations>
   <Node NodeType="NodeList" epx="Sequence" LineNo="25" ColNo="1">
      <NodeId>PurePursuit</NodeId>
      <VariableDeclarations>
         <DeclareVariable LineNo="24" ColNo="1">
            <Name>AXIS_DISPLACEMENT_DELTA</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0.01</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="25" ColNo="1">
            <Name>LOOK_AHEAD_DISTANCE</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0.5</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="26" ColNo="1">
            <Name>WAYPOINT_MIN_DISTANCE</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0.3</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="27" ColNo="1">
            <Name>sim_xp</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="28" ColNo="1">
            <Name>sim_yp</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="29" ColNo="1">
            <Name>yaw</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="30" ColNo="1">
            <Name>top_speed</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0.5</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="32" ColNo="1">
            <Name>WAY_POINTS_COUNT</Name>
            <Type>Integer</Type>
            <InitialValue>
               <IntegerValue>4</IntegerValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareArray LineNo="33" ColNo="1">
            <Name>wayPointsXCoord</Name>
            <Type>Real</Type>
            <MaxSize>4</MaxSize>
            <InitialValue>
               <RealValue>-4</RealValue>
               <RealValue>4</RealValue>
               <RealValue>4</RealValue>
               <RealValue>-4</RealValue>
            </InitialValue>
         </DeclareArray>
         <DeclareArray LineNo="34" ColNo="1">
            <Name>wayPointsYCoord</Name>
            <Type>Real</Type>
            <MaxSize>4</MaxSize>
            <InitialValue>
               <RealValue>4</RealValue>
               <RealValue>4</RealValue>
               <RealValue>-4</RealValue>
               <RealValue>-4</RealValue>
            </InitialValue>
         </DeclareArray>
         <DeclareVariable LineNo="36" ColNo="1">
            <Name>wayPointIndex</Name>
            <Type>Integer</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="38" ColNo="1">
            <Name>currentWayPointCoordX</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="39" ColNo="1">
            <Name>currentWayPointCoordY</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="41" ColNo="1">
            <Name>previousWayPointCoordX</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="42" ColNo="1">
            <Name>previousWayPointCoordY</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="45" ColNo="1">
            <Name>lookAheadTargetCoordX</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="46" ColNo="1">
            <Name>lookAheadTargetCoordY</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="48" ColNo="1">
            <Name>originTargetVectorsCrossProduct</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="53" ColNo="1">
            <Name>distanceToCurrentWayPoint</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="55" ColNo="1">
            <Name>goal</Name>
            <Type>Boolean</Type>
            <InitialValue>
               <BooleanValue>false</BooleanValue>
            </InitialValue>
         </DeclareVariable>
      </VariableDeclarations>
      <InvariantCondition>
         <NOT>
            <OR>
               <AND>
                  <EQInternal>
                     <NodeOutcomeVariable>
                        <NodeRef dir="child">InitialContext</NodeRef>
                     </NodeOutcomeVariable>
                     <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                  </EQInternal>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="child">InitialContext</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </AND>
               <AND>
                  <EQInternal>
                     <NodeOutcomeVariable>
                        <NodeRef dir="child">Concurrence__10</NodeRef>
                     </NodeOutcomeVariable>
                     <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                  </EQInternal>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="child">Concurrence__10</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </AND>
            </OR>
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="NodeList" epx="Sequence" LineNo="61" ColNo="2">
               <NodeId>InitialContext</NodeId>
               <InvariantCondition>
                  <NOT>
                     <OR>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">ASSIGNMENT__0</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">ASSIGNMENT__0</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
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
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">ASSIGNMENT__5</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">ASSIGNMENT__5</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">ASSIGNMENT__6</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">ASSIGNMENT__6</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">ASSIGNMENT__7</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">ASSIGNMENT__7</NodeRef>
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
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">COMMAND__9</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">COMMAND__9</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                     </OR>
                  </NOT>
               </InvariantCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="Assignment" LineNo="61" ColNo="2">
                        <NodeId>ASSIGNMENT__0</NodeId>
                        <NodeBody>
                           <Assignment>
                              <RealVariable>sim_xp</RealVariable>
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
                     <Node NodeType="Assignment" LineNo="62" ColNo="2">
                        <NodeId>ASSIGNMENT__1</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">ASSIGNMENT__0</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <Assignment>
                              <RealVariable>sim_yp</RealVariable>
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
                     <Node NodeType="Assignment" LineNo="64" ColNo="2">
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
                              <IntegerVariable>wayPointIndex</IntegerVariable>
                              <NumericRHS>
                                 <IntegerValue>0</IntegerValue>
                              </NumericRHS>
                           </Assignment>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Assignment" LineNo="66" ColNo="2">
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
                              <RealVariable>previousWayPointCoordX</RealVariable>
                              <NumericRHS>
                                 <RealVariable>sim_xp</RealVariable>
                              </NumericRHS>
                           </Assignment>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Assignment" LineNo="67" ColNo="2">
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
                              <RealVariable>previousWayPointCoordY</RealVariable>
                              <NumericRHS>
                                 <RealVariable>sim_yp</RealVariable>
                              </NumericRHS>
                           </Assignment>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Assignment" LineNo="69" ColNo="2">
                        <NodeId>ASSIGNMENT__5</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">ASSIGNMENT__4</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <Assignment>
                              <RealVariable>currentWayPointCoordX</RealVariable>
                              <NumericRHS>
                                 <ArrayElement>
                                    <Name>wayPointsXCoord</Name>
                                    <Index>
                                       <IntegerValue>0</IntegerValue>
                                    </Index>
                                 </ArrayElement>
                              </NumericRHS>
                           </Assignment>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Assignment" LineNo="70" ColNo="2">
                        <NodeId>ASSIGNMENT__6</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">ASSIGNMENT__5</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <Assignment>
                              <RealVariable>currentWayPointCoordY</RealVariable>
                              <NumericRHS>
                                 <ArrayElement>
                                    <Name>wayPointsYCoord</Name>
                                    <Index>
                                       <IntegerValue>0</IntegerValue>
                                    </Index>
                                 </ArrayElement>
                              </NumericRHS>
                           </Assignment>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="71" ColNo="30">
                        <NodeId>ASSIGNMENT__7</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">ASSIGNMENT__6</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <Command>
                              <RealVariable>distanceToCurrentWayPoint</RealVariable>
                              <Name>
                                 <StringValue>distance</StringValue>
                              </Name>
                              <Arguments LineNo="72" ColNo="39">
                                 <RealVariable>sim_xp</RealVariable>
                                 <RealVariable>sim_yp</RealVariable>
                                 <RealVariable>currentWayPointCoordX</RealVariable>
                                 <RealVariable>currentWayPointCoordY</RealVariable>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="73" ColNo="2">
                        <NodeId>COMMAND__8</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">ASSIGNMENT__7</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <Command>
                              <Name>
                                 <StringValue>pprint</StringValue>
                              </Name>
                              <Arguments LineNo="74" ColNo="9">
                                 <StringValue>xini:</StringValue>
                                 <RealVariable>sim_xp</RealVariable>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="74" ColNo="2">
                        <NodeId>COMMAND__9</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">COMMAND__8</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <Command>
                              <Name>
                                 <StringValue>pprint</StringValue>
                              </Name>
                              <Arguments LineNo="75" ColNo="9">
                                 <StringValue>yini:</StringValue>
                                 <RealVariable>sim_yp</RealVariable>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                  </NodeList>
               </NodeBody>
            </Node>
            <Node NodeType="NodeList" epx="Concurrence" LineNo="78" ColNo="1">
               <NodeId>Concurrence__10</NodeId>
               <StartCondition>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="sibling">InitialContext</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </StartCondition>
               <EndCondition>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeId>Stop</NodeId>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </EndCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="Command" LineNo="83" ColNo="3">
                        <NodeId>Accelerate</NodeId>
                        <RepeatCondition>
                           <AND>
                              <NOT>
                                 <BooleanVariable>goal</BooleanVariable>
                              </NOT>
                              <LT>
                                 <LookupOnChange>
                                    <Name>
                                       <StringValue>LinearVelocity</StringValue>
                                    </Name>
                                 </LookupOnChange>
                                 <RealVariable>top_speed</RealVariable>
                              </LT>
                           </AND>
                        </RepeatCondition>
                        <NodeBody>
                           <Command>
                              <Name>
                                 <StringValue>RequestLinearVelocity</StringValue>
                              </Name>
                              <Arguments LineNo="84" ColNo="25">
                                 <RealValue>0.1</RealValue>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="89" ColNo="3">
                        <NodeId>Stop</NodeId>
                        <StartCondition>
                           <BooleanVariable>goal</BooleanVariable>
                        </StartCondition>
                        <RepeatCondition>
                           <GT>
                              <LookupOnChange>
                                 <Name>
                                    <StringValue>LinearVelocity</StringValue>
                                 </Name>
                              </LookupOnChange>
                              <IntegerValue>0</IntegerValue>
                           </GT>
                        </RepeatCondition>
                        <NodeBody>
                           <Command>
                              <Name>
                                 <StringValue>RequestLinearVelocity</StringValue>
                              </Name>
                              <Arguments LineNo="90" ColNo="25">
                                 <RealValue>0</RealValue>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="95" ColNo="3">
                        <NodeId>UpdateLookAheadAndWayPoint</NodeId>
                        <StartCondition>
                           <OR>
                              <GT>
                                 <ABS LineNo="95" ColNo="9">
                                    <SUB LineNo="95" ColNo="30">
                                       <LookupOnChange>
                                          <Name>
                                             <StringValue>XPosition</StringValue>
                                          </Name>
                                       </LookupOnChange>
                                       <RealVariable>sim_xp</RealVariable>
                                    </SUB>
                                 </ABS>
                                 <RealVariable>AXIS_DISPLACEMENT_DELTA</RealVariable>
                              </GT>
                              <GT>
                                 <ABS LineNo="95" ColNo="66">
                                    <SUB LineNo="95" ColNo="87">
                                       <LookupOnChange>
                                          <Name>
                                             <StringValue>YPosition</StringValue>
                                          </Name>
                                       </LookupOnChange>
                                       <RealVariable>sim_yp</RealVariable>
                                    </SUB>
                                 </ABS>
                                 <RealVariable>AXIS_DISPLACEMENT_DELTA</RealVariable>
                              </GT>
                           </OR>
                        </StartCondition>
                        <RepeatCondition>
                           <NOT>
                              <BooleanVariable>goal</BooleanVariable>
                           </NOT>
                        </RepeatCondition>
                        <InvariantCondition>
                           <NOT>
                              <AND>
                                 <EQInternal>
                                    <NodeOutcomeVariable>
                                       <NodeRef dir="child">Sequence__13</NodeRef>
                                    </NodeOutcomeVariable>
                                    <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                 </EQInternal>
                                 <EQInternal>
                                    <NodeStateVariable>
                                       <NodeRef dir="child">Sequence__13</NodeRef>
                                    </NodeStateVariable>
                                    <NodeStateValue>FINISHED</NodeStateValue>
                                 </EQInternal>
                              </AND>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="NodeList" epx="Sequence" LineNo="98" ColNo="3">
                                 <NodeId>Sequence__13</NodeId>
                                 <InvariantCondition>
                                    <NOT>
                                       <OR>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">PositionUpdate</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">PositionUpdate</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">LookAheadUpdate</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">LookAheadUpdate</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">HeadingEvaluation</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">HeadingEvaluation</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">WayPointUpdate</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">WayPointUpdate</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                       </OR>
                                    </NOT>
                                 </InvariantCondition>
                                 <NodeBody>
                                    <NodeList>
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="102" ColNo="5">
                                          <NodeId>PositionUpdate</NodeId>
                                          <InvariantCondition>
                                             <NOT>
                                                <OR>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__14</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__14</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__15</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__15</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__16</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__16</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">COMMAND__17</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">COMMAND__17</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">COMMAND__18</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">COMMAND__18</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                </OR>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="Assignment" LineNo="102" ColNo="5">
                                                   <NodeId>ASSIGNMENT__14</NodeId>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>sim_xp</RealVariable>
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
                                                <Node NodeType="Assignment" LineNo="103" ColNo="5">
                                                   <NodeId>ASSIGNMENT__15</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__14</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>sim_yp</RealVariable>
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
                                                <Node NodeType="Assignment" LineNo="104" ColNo="5">
                                                   <NodeId>ASSIGNMENT__16</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__15</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>yaw</RealVariable>
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
                                                <Node NodeType="Command" LineNo="105" ColNo="5">
                                                   <NodeId>COMMAND__17</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__16</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Command>
                                                         <Name>
                                                            <StringValue>pprint</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="106" ColNo="12">
                                                            <StringValue>x:</StringValue>
                                                            <RealVariable>sim_xp</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="106" ColNo="5">
                                                   <NodeId>COMMAND__18</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">COMMAND__17</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Command>
                                                         <Name>
                                                            <StringValue>pprint</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="107" ColNo="12">
                                                            <StringValue>y:</StringValue>
                                                            <RealVariable>sim_yp</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                             </NodeList>
                                          </NodeBody>
                                       </Node>
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="114" ColNo="5">
                                          <NodeId>LookAheadUpdate</NodeId>
                                          <VariableDeclarations>
                                             <DeclareVariable LineNo="113" ColNo="5">
                                                <Name>wayPointsDistance</Name>
                                                <Type>Real</Type>
                                                <InitialValue>
                                                   <RealValue>0</RealValue>
                                                </InitialValue>
                                             </DeclareVariable>
                                             <DeclareVariable LineNo="114" ColNo="5">
                                                <Name>wayPointRatio</Name>
                                                <Type>Real</Type>
                                                <InitialValue>
                                                   <RealValue>0</RealValue>
                                                </InitialValue>
                                             </DeclareVariable>
                                          </VariableDeclarations>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">PositionUpdate</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </StartCondition>
                                          <InvariantCondition>
                                             <NOT>
                                                <OR>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__19</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__19</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__20</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__20</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__21</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__21</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">if__22</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">if__22</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__24</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__24</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__25</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__25</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                </OR>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="Command" LineNo="116" ColNo="25">
                                                   <NodeId>ASSIGNMENT__19</NodeId>
                                                   <NodeBody>
                                                      <Command>
                                                         <RealVariable>wayPointsDistance</RealVariable>
                                                         <Name>
                                                            <StringValue>distance</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="117" ColNo="34">
                                                            <RealVariable>currentWayPointCoordX</RealVariable>
                                                            <RealVariable>currentWayPointCoordY</RealVariable>
                                                            <RealVariable>previousWayPointCoordX</RealVariable>
                                                            <RealVariable>previousWayPointCoordY</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="117" ColNo="33">
                                                   <NodeId>ASSIGNMENT__20</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__19</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Command>
                                                         <RealVariable>distanceToCurrentWayPoint</RealVariable>
                                                         <Name>
                                                            <StringValue>distance</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="118" ColNo="42">
                                                            <RealVariable>sim_xp</RealVariable>
                                                            <RealVariable>sim_yp</RealVariable>
                                                            <RealVariable>currentWayPointCoordX</RealVariable>
                                                            <RealVariable>currentWayPointCoordY</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="120" ColNo="5">
                                                   <NodeId>ASSIGNMENT__21</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__20</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>wayPointRatio</RealVariable>
                                                         <NumericRHS>
                                                            <DIV LineNo="120" ColNo="91">
                                                               <ADD LineNo="120" ColNo="68">
                                                                  <SUB LineNo="120" ColNo="40">
                                                                     <RealVariable>wayPointsDistance</RealVariable>
                                                                     <RealVariable>distanceToCurrentWayPoint</RealVariable>
                                                                  </SUB>
                                                                  <RealVariable>LOOK_AHEAD_DISTANCE</RealVariable>
                                                               </ADD>
                                                               <RealVariable>wayPointsDistance</RealVariable>
                                                            </DIV>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="NodeList" epx="If" LineNo="122" ColNo="5">
                                                   <NodeId>if__22</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__21</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <NodeList>
                                                         <Node NodeType="Empty" epx="Condition">
                                                            <NodeId>ep2cp_IfTest</NodeId>
                                                            <PostCondition>
                                                               <GT>
                                                                  <RealVariable>wayPointRatio</RealVariable>
                                                                  <RealValue>1.0</RealValue>
                                                               </GT>
                                                            </PostCondition>
                                                         </Node>
                                                         <Node NodeType="Assignment" epx="Then" LineNo="123" ColNo="6">
                                                            <NodeId>ASSIGNMENT__23</NodeId>
                                                            <StartCondition>
                                                               <EQInternal>
                                                                  <NodeOutcomeVariable>
                                                                     <NodeRef dir="sibling">ep2cp_IfTest</NodeRef>
                                                                  </NodeOutcomeVariable>
                                                                  <NodeOutcomeValue>SUCCESS</NodeOutcomeValue>
                                                               </EQInternal>
                                                            </StartCondition>
                                                            <SkipCondition>
                                                               <EQInternal>
                                                                  <NodeFailureVariable>
                                                                     <NodeRef dir="sibling">ep2cp_IfTest</NodeRef>
                                                                  </NodeFailureVariable>
                                                                  <NodeFailureValue>POST_CONDITION_FAILED</NodeFailureValue>
                                                               </EQInternal>
                                                            </SkipCondition>
                                                            <NodeBody>
                                                               <Assignment>
                                                                  <RealVariable>wayPointRatio</RealVariable>
                                                                  <NumericRHS>
                                                                     <RealValue>1.0</RealValue>
                                                                  </NumericRHS>
                                                               </Assignment>
                                                            </NodeBody>
                                                         </Node>
                                                      </NodeList>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="126" ColNo="5">
                                                   <NodeId>ASSIGNMENT__24</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">if__22</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>lookAheadTargetCoordX</RealVariable>
                                                         <NumericRHS>
                                                            <ADD LineNo="126" ColNo="52">
                                                               <RealVariable>previousWayPointCoordX</RealVariable>
                                                               <MUL LineNo="126" ColNo="67">
                                                                  <RealVariable>wayPointRatio</RealVariable>
                                                                  <SUB LineNo="126" ColNo="90">
                                                                     <RealVariable>currentWayPointCoordX</RealVariable>
                                                                     <RealVariable>previousWayPointCoordX</RealVariable>
                                                                  </SUB>
                                                               </MUL>
                                                            </ADD>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="127" ColNo="5">
                                                   <NodeId>ASSIGNMENT__25</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__24</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>lookAheadTargetCoordY</RealVariable>
                                                         <NumericRHS>
                                                            <ADD LineNo="127" ColNo="52">
                                                               <RealVariable>previousWayPointCoordY</RealVariable>
                                                               <MUL LineNo="127" ColNo="67">
                                                                  <RealVariable>wayPointRatio</RealVariable>
                                                                  <SUB LineNo="127" ColNo="90">
                                                                     <RealVariable>currentWayPointCoordY</RealVariable>
                                                                     <RealVariable>previousWayPointCoordY</RealVariable>
                                                                  </SUB>
                                                               </MUL>
                                                            </ADD>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                             </NodeList>
                                          </NodeBody>
                                       </Node>
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="133" ColNo="5">
                                          <NodeId>HeadingEvaluation</NodeId>
                                          <VariableDeclarations>
                                             <DeclareVariable LineNo="132" ColNo="5">
                                                <Name>cdir</Name>
                                                <Type>Real</Type>
                                             </DeclareVariable>
                                             <DeclareVariable LineNo="132" ColNo="5">
                                                <Name>sdir</Name>
                                                <Type>Real</Type>
                                             </DeclareVariable>
                                             <DeclareVariable LineNo="132" ColNo="5">
                                                <Name>distanceToCurrentGoal</Name>
                                                <Type>Real</Type>
                                             </DeclareVariable>
                                          </VariableDeclarations>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">LookAheadUpdate</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </StartCondition>
                                          <InvariantCondition>
                                             <NOT>
                                                <OR>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__26</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__26</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__27</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__27</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__28</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__28</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__29</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__29</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">COMMAND__30</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">COMMAND__30</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                </OR>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="Command" LineNo="134" ColNo="29">
                                                   <NodeId>ASSIGNMENT__26</NodeId>
                                                   <NodeBody>
                                                      <Command>
                                                         <RealVariable>distanceToCurrentGoal</RealVariable>
                                                         <Name>
                                                            <StringValue>distance</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="135" ColNo="38">
                                                            <RealVariable>sim_xp</RealVariable>
                                                            <RealVariable>sim_yp</RealVariable>
                                                            <RealVariable>lookAheadTargetCoordX</RealVariable>
                                                            <RealVariable>lookAheadTargetCoordY</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="136" ColNo="10">
                                                   <NodeId>ASSIGNMENT__27</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__26</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Command>
                                                         <RealVariable>cdir</RealVariable>
                                                         <Name>
                                                            <StringValue>cos</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="137" ColNo="14">
                                                            <RealVariable>yaw</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="137" ColNo="10">
                                                   <NodeId>ASSIGNMENT__28</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__27</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Command>
                                                         <RealVariable>sdir</RealVariable>
                                                         <Name>
                                                            <StringValue>sin</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="138" ColNo="14">
                                                            <RealVariable>yaw</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="140" ColNo="5">
                                                   <NodeId>ASSIGNMENT__29</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__28</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>originTargetVectorsCrossProduct</RealVariable>
                                                         <NumericRHS>
                                                            <DIV LineNo="140" ColNo="114">
                                                               <SUB LineNo="140" ColNo="76">
                                                                  <MUL LineNo="140" ColNo="44">
                                                                     <RealVariable>sdir</RealVariable>
                                                                     <SUB LineNo="140" ColNo="52">
                                                                        <RealVariable>sim_xp</RealVariable>
                                                                        <RealVariable>lookAheadTargetCoordX</RealVariable>
                                                                     </SUB>
                                                                  </MUL>
                                                                  <MUL LineNo="140" ColNo="82">
                                                                     <RealVariable>cdir</RealVariable>
                                                                     <SUB LineNo="140" ColNo="90">
                                                                        <RealVariable>sim_yp</RealVariable>
                                                                        <RealVariable>lookAheadTargetCoordY</RealVariable>
                                                                     </SUB>
                                                                  </MUL>
                                                               </SUB>
                                                               <RealVariable>distanceToCurrentGoal</RealVariable>
                                                            </DIV>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="141" ColNo="5">
                                                   <NodeId>COMMAND__30</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__29</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Command>
                                                         <Name>
                                                            <StringValue>pprint</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="142" ColNo="12">
                                                            <StringValue>goal dist:</StringValue>
                                                            <RealVariable>distanceToCurrentGoal</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                             </NodeList>
                                          </NodeBody>
                                       </Node>
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="148" ColNo="5">
                                          <NodeId>WayPointUpdate</NodeId>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">HeadingEvaluation</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </StartCondition>
                                          <InvariantCondition>
                                             <NOT>
                                                <OR>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__31</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__31</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">if__32</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">if__32</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                </OR>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="Command" LineNo="147" ColNo="33">
                                                   <NodeId>ASSIGNMENT__31</NodeId>
                                                   <NodeBody>
                                                      <Command>
                                                         <RealVariable>distanceToCurrentWayPoint</RealVariable>
                                                         <Name>
                                                            <StringValue>distance</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="148" ColNo="42">
                                                            <RealVariable>sim_xp</RealVariable>
                                                            <RealVariable>sim_yp</RealVariable>
                                                            <RealVariable>currentWayPointCoordX</RealVariable>
                                                            <RealVariable>currentWayPointCoordY</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="NodeList" epx="If" LineNo="151" ColNo="5">
                                                   <NodeId>if__32</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__31</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <NodeList>
                                                         <Node NodeType="Empty" epx="Condition">
                                                            <NodeId>ep2cp_IfTest</NodeId>
                                                            <PostCondition>
                                                               <LT>
                                                                  <RealVariable>distanceToCurrentWayPoint</RealVariable>
                                                                  <RealVariable>WAYPOINT_MIN_DISTANCE</RealVariable>
                                                               </LT>
                                                            </PostCondition>
                                                         </Node>
                                                         <Node NodeType="NodeList" epx="Then" LineNo="154" ColNo="6">
                                                            <NodeId>BLOCK__33</NodeId>
                                                            <InvariantCondition>
                                                               <NOT>
                                                                  <OR>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">COMMAND__34</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">COMMAND__34</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </AND>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">ASSIGNMENT__35</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">ASSIGNMENT__35</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </AND>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">if__36</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">if__36</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </AND>
                                                                  </OR>
                                                               </NOT>
                                                            </InvariantCondition>
                                                            <StartCondition>
                                                               <EQInternal>
                                                                  <NodeOutcomeVariable>
                                                                     <NodeRef dir="sibling">ep2cp_IfTest</NodeRef>
                                                                  </NodeOutcomeVariable>
                                                                  <NodeOutcomeValue>SUCCESS</NodeOutcomeValue>
                                                               </EQInternal>
                                                            </StartCondition>
                                                            <SkipCondition>
                                                               <EQInternal>
                                                                  <NodeFailureVariable>
                                                                     <NodeRef dir="sibling">ep2cp_IfTest</NodeRef>
                                                                  </NodeFailureVariable>
                                                                  <NodeFailureValue>POST_CONDITION_FAILED</NodeFailureValue>
                                                               </EQInternal>
                                                            </SkipCondition>
                                                            <NodeBody>
                                                               <NodeList>
                                                                  <Node NodeType="Command" LineNo="153" ColNo="6">
                                                                     <NodeId>COMMAND__34</NodeId>
                                                                     <NodeBody>
                                                                        <Command>
                                                                           <Name>
                                                                              <StringValue>pprint</StringValue>
                                                                           </Name>
                                                                           <Arguments LineNo="154" ColNo="13">
                                                                              <StringValue>UPDATING WAYPOINT</StringValue>
                                                                           </Arguments>
                                                                        </Command>
                                                                     </NodeBody>
                                                                  </Node>
                                                                  <Node NodeType="Assignment" LineNo="155" ColNo="6">
                                                                     <NodeId>ASSIGNMENT__35</NodeId>
                                                                     <StartCondition>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="sibling">COMMAND__34</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </StartCondition>
                                                                     <NodeBody>
                                                                        <Assignment>
                                                                           <IntegerVariable>wayPointIndex</IntegerVariable>
                                                                           <NumericRHS>
                                                                              <ADD LineNo="155" ColNo="33">
                                                                                 <IntegerVariable>wayPointIndex</IntegerVariable>
                                                                                 <IntegerValue>1</IntegerValue>
                                                                              </ADD>
                                                                           </NumericRHS>
                                                                        </Assignment>
                                                                     </NodeBody>
                                                                  </Node>
                                                                  <Node NodeType="NodeList" epx="If" LineNo="157" ColNo="6">
                                                                     <NodeId>if__36</NodeId>
                                                                     <StartCondition>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="sibling">ASSIGNMENT__35</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </StartCondition>
                                                                     <NodeBody>
                                                                        <NodeList>
                                                                           <Node NodeType="Empty" epx="Condition">
                                                                              <NodeId>ep2cp_IfTest</NodeId>
                                                                              <PostCondition>
                                                                                 <LT>
                                                                                    <IntegerVariable>wayPointIndex</IntegerVariable>
                                                                                    <IntegerVariable>WAY_POINTS_COUNT</IntegerVariable>
                                                                                 </LT>
                                                                              </PostCondition>
                                                                           </Node>
                                                                           <Node NodeType="NodeList" epx="Then" LineNo="159" ColNo="7">
                                                                              <NodeId>BLOCK__37</NodeId>
                                                                              <InvariantCondition>
                                                                                 <NOT>
                                                                                    <OR>
                                                                                       <AND>
                                                                                          <EQInternal>
                                                                                             <NodeOutcomeVariable>
                                                                                                <NodeRef dir="child">ASSIGNMENT__38</NodeRef>
                                                                                             </NodeOutcomeVariable>
                                                                                             <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                                          </EQInternal>
                                                                                          <EQInternal>
                                                                                             <NodeStateVariable>
                                                                                                <NodeRef dir="child">ASSIGNMENT__38</NodeRef>
                                                                                             </NodeStateVariable>
                                                                                             <NodeStateValue>FINISHED</NodeStateValue>
                                                                                          </EQInternal>
                                                                                       </AND>
                                                                                       <AND>
                                                                                          <EQInternal>
                                                                                             <NodeOutcomeVariable>
                                                                                                <NodeRef dir="child">ASSIGNMENT__39</NodeRef>
                                                                                             </NodeOutcomeVariable>
                                                                                             <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                                          </EQInternal>
                                                                                          <EQInternal>
                                                                                             <NodeStateVariable>
                                                                                                <NodeRef dir="child">ASSIGNMENT__39</NodeRef>
                                                                                             </NodeStateVariable>
                                                                                             <NodeStateValue>FINISHED</NodeStateValue>
                                                                                          </EQInternal>
                                                                                       </AND>
                                                                                       <AND>
                                                                                          <EQInternal>
                                                                                             <NodeOutcomeVariable>
                                                                                                <NodeRef dir="child">ASSIGNMENT__40</NodeRef>
                                                                                             </NodeOutcomeVariable>
                                                                                             <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                                          </EQInternal>
                                                                                          <EQInternal>
                                                                                             <NodeStateVariable>
                                                                                                <NodeRef dir="child">ASSIGNMENT__40</NodeRef>
                                                                                             </NodeStateVariable>
                                                                                             <NodeStateValue>FINISHED</NodeStateValue>
                                                                                          </EQInternal>
                                                                                       </AND>
                                                                                       <AND>
                                                                                          <EQInternal>
                                                                                             <NodeOutcomeVariable>
                                                                                                <NodeRef dir="child">ASSIGNMENT__41</NodeRef>
                                                                                             </NodeOutcomeVariable>
                                                                                             <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                                          </EQInternal>
                                                                                          <EQInternal>
                                                                                             <NodeStateVariable>
                                                                                                <NodeRef dir="child">ASSIGNMENT__41</NodeRef>
                                                                                             </NodeStateVariable>
                                                                                             <NodeStateValue>FINISHED</NodeStateValue>
                                                                                          </EQInternal>
                                                                                       </AND>
                                                                                    </OR>
                                                                                 </NOT>
                                                                              </InvariantCondition>
                                                                              <StartCondition>
                                                                                 <EQInternal>
                                                                                    <NodeOutcomeVariable>
                                                                                       <NodeRef dir="sibling">ep2cp_IfTest</NodeRef>
                                                                                    </NodeOutcomeVariable>
                                                                                    <NodeOutcomeValue>SUCCESS</NodeOutcomeValue>
                                                                                 </EQInternal>
                                                                              </StartCondition>
                                                                              <SkipCondition>
                                                                                 <EQInternal>
                                                                                    <NodeFailureVariable>
                                                                                       <NodeRef dir="sibling">ep2cp_IfTest</NodeRef>
                                                                                    </NodeFailureVariable>
                                                                                    <NodeFailureValue>POST_CONDITION_FAILED</NodeFailureValue>
                                                                                 </EQInternal>
                                                                              </SkipCondition>
                                                                              <NodeBody>
                                                                                 <NodeList>
                                                                                    <Node NodeType="Assignment" LineNo="159" ColNo="7">
                                                                                       <NodeId>ASSIGNMENT__38</NodeId>
                                                                                       <NodeBody>
                                                                                          <Assignment>
                                                                                             <RealVariable>previousWayPointCoordX</RealVariable>
                                                                                             <NumericRHS>
                                                                                                <RealVariable>currentWayPointCoordX</RealVariable>
                                                                                             </NumericRHS>
                                                                                          </Assignment>
                                                                                       </NodeBody>
                                                                                    </Node>
                                                                                    <Node NodeType="Assignment" LineNo="160" ColNo="7">
                                                                                       <NodeId>ASSIGNMENT__39</NodeId>
                                                                                       <StartCondition>
                                                                                          <EQInternal>
                                                                                             <NodeStateVariable>
                                                                                                <NodeRef dir="sibling">ASSIGNMENT__38</NodeRef>
                                                                                             </NodeStateVariable>
                                                                                             <NodeStateValue>FINISHED</NodeStateValue>
                                                                                          </EQInternal>
                                                                                       </StartCondition>
                                                                                       <NodeBody>
                                                                                          <Assignment>
                                                                                             <RealVariable>previousWayPointCoordY</RealVariable>
                                                                                             <NumericRHS>
                                                                                                <RealVariable>currentWayPointCoordY</RealVariable>
                                                                                             </NumericRHS>
                                                                                          </Assignment>
                                                                                       </NodeBody>
                                                                                    </Node>
                                                                                    <Node NodeType="Assignment" LineNo="162" ColNo="7">
                                                                                       <NodeId>ASSIGNMENT__40</NodeId>
                                                                                       <StartCondition>
                                                                                          <EQInternal>
                                                                                             <NodeStateVariable>
                                                                                                <NodeRef dir="sibling">ASSIGNMENT__39</NodeRef>
                                                                                             </NodeStateVariable>
                                                                                             <NodeStateValue>FINISHED</NodeStateValue>
                                                                                          </EQInternal>
                                                                                       </StartCondition>
                                                                                       <NodeBody>
                                                                                          <Assignment>
                                                                                             <RealVariable>currentWayPointCoordX</RealVariable>
                                                                                             <NumericRHS>
                                                                                                <ArrayElement>
                                                                                                   <Name>wayPointsXCoord</Name>
                                                                                                   <Index>
                                                                                                      <IntegerVariable>wayPointIndex</IntegerVariable>
                                                                                                   </Index>
                                                                                                </ArrayElement>
                                                                                             </NumericRHS>
                                                                                          </Assignment>
                                                                                       </NodeBody>
                                                                                    </Node>
                                                                                    <Node NodeType="Assignment" LineNo="163" ColNo="7">
                                                                                       <NodeId>ASSIGNMENT__41</NodeId>
                                                                                       <StartCondition>
                                                                                          <EQInternal>
                                                                                             <NodeStateVariable>
                                                                                                <NodeRef dir="sibling">ASSIGNMENT__40</NodeRef>
                                                                                             </NodeStateVariable>
                                                                                             <NodeStateValue>FINISHED</NodeStateValue>
                                                                                          </EQInternal>
                                                                                       </StartCondition>
                                                                                       <NodeBody>
                                                                                          <Assignment>
                                                                                             <RealVariable>currentWayPointCoordY</RealVariable>
                                                                                             <NumericRHS>
                                                                                                <ArrayElement>
                                                                                                   <Name>wayPointsYCoord</Name>
                                                                                                   <Index>
                                                                                                      <IntegerVariable>wayPointIndex</IntegerVariable>
                                                                                                   </Index>
                                                                                                </ArrayElement>
                                                                                             </NumericRHS>
                                                                                          </Assignment>
                                                                                       </NodeBody>
                                                                                    </Node>
                                                                                 </NodeList>
                                                                              </NodeBody>
                                                                           </Node>
                                                                           <Node NodeType="Assignment" epx="Else" LineNo="168" ColNo="7">
                                                                              <NodeId>ASSIGNMENT__43</NodeId>
                                                                              <StartCondition>
                                                                                 <EQInternal>
                                                                                    <NodeFailureVariable>
                                                                                       <NodeRef dir="sibling">ep2cp_IfTest</NodeRef>
                                                                                    </NodeFailureVariable>
                                                                                    <NodeFailureValue>POST_CONDITION_FAILED</NodeFailureValue>
                                                                                 </EQInternal>
                                                                              </StartCondition>
                                                                              <SkipCondition>
                                                                                 <EQInternal>
                                                                                    <NodeOutcomeVariable>
                                                                                       <NodeRef dir="sibling">ep2cp_IfTest</NodeRef>
                                                                                    </NodeOutcomeVariable>
                                                                                    <NodeOutcomeValue>SUCCESS</NodeOutcomeValue>
                                                                                 </EQInternal>
                                                                              </SkipCondition>
                                                                              <NodeBody>
                                                                                 <Assignment>
                                                                                    <BooleanVariable>goal</BooleanVariable>
                                                                                    <BooleanRHS>
                                                                                       <BooleanValue>true</BooleanValue>
                                                                                    </BooleanRHS>
                                                                                 </Assignment>
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
                                    </NodeList>
                                 </NodeBody>
                              </Node>
                           </NodeList>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="186" ColNo="3">
                        <NodeId>TurnLeft</NodeId>
                        <StartCondition>
                           <LT>
                              <RealVariable>originTargetVectorsCrossProduct</RealVariable>
                              <RealValue>-0.1</RealValue>
                           </LT>
                        </StartCondition>
                        <RepeatCondition>
                           <NOT>
                              <BooleanVariable>goal</BooleanVariable>
                           </NOT>
                        </RepeatCondition>
                        <InvariantCondition>
                           <NOT>
                              <OR>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__44</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__44</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__45</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__45</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Command" LineNo="187" ColNo="3">
                                 <NodeId>COMMAND__44</NodeId>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>RequestAngularVelocity</StringValue>
                                       </Name>
                                       <Arguments LineNo="188" ColNo="27">
                                          <RealValue>-0.5</RealValue>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Command" LineNo="188" ColNo="3">
                                 <NodeId>COMMAND__45</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">COMMAND__44</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="189" ColNo="10">
                                          <StringValue>left</StringValue>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                           </NodeList>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="193" ColNo="3">
                        <NodeId>TurnRight</NodeId>
                        <StartCondition>
                           <GT>
                              <RealVariable>originTargetVectorsCrossProduct</RealVariable>
                              <RealValue>0.1</RealValue>
                           </GT>
                        </StartCondition>
                        <RepeatCondition>
                           <NOT>
                              <BooleanVariable>goal</BooleanVariable>
                           </NOT>
                        </RepeatCondition>
                        <InvariantCondition>
                           <NOT>
                              <OR>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__46</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__46</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__47</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__47</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Command" LineNo="194" ColNo="3">
                                 <NodeId>COMMAND__46</NodeId>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>RequestAngularVelocity</StringValue>
                                       </Name>
                                       <Arguments LineNo="195" ColNo="26">
                                          <RealValue>0.5</RealValue>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Command" LineNo="195" ColNo="3">
                                 <NodeId>COMMAND__47</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">COMMAND__46</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="196" ColNo="10">
                                          <StringValue>right</StringValue>
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
</PlexilPlan>