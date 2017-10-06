<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="roverbot-test.ple">
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
   </GlobalDeclarations>
   <Node NodeType="NodeList" epx="Sequence" LineNo="22" ColNo="1">
      <NodeId>All</NodeId>
      <VariableDeclarations>
         <DeclareVariable LineNo="21" ColNo="1">
            <Name>FOLLOW_DIST</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>50</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="22" ColNo="1">
            <Name>sim_xp</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="23" ColNo="1">
            <Name>sim_yp</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="24" ColNo="1">
            <Name>steer_xp</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="25" ColNo="1">
            <Name>steer_yp</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="26" ColNo="1">
            <Name>AXIS_DISPLACEMENT_DELTA</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0.01</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="28" ColNo="1">
            <Name>lookAheadDistance</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareArray LineNo="30" ColNo="1">
            <Name>wayPointsX</Name>
            <Type>Integer</Type>
            <MaxSize>4</MaxSize>
            <InitialValue>
               <IntegerValue>1</IntegerValue>
               <IntegerValue>20</IntegerValue>
               <IntegerValue>30</IntegerValue>
               <IntegerValue>50</IntegerValue>
            </InitialValue>
         </DeclareArray>
         <DeclareArray LineNo="31" ColNo="1">
            <Name>wayPointsY</Name>
            <Type>Integer</Type>
            <MaxSize>4</MaxSize>
            <InitialValue>
               <IntegerValue>1</IntegerValue>
               <IntegerValue>20</IntegerValue>
               <IntegerValue>30</IntegerValue>
               <IntegerValue>50</IntegerValue>
            </InitialValue>
         </DeclareArray>
         <DeclareVariable LineNo="33" ColNo="1">
            <Name>currentWayPointIndex</Name>
            <Type>Integer</Type>
            <InitialValue>
               <IntegerValue>1</IntegerValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="34" ColNo="1">
            <Name>previousWayPointIndex</Name>
            <Type>Integer</Type>
            <InitialValue>
               <IntegerValue>0</IntegerValue>
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
                        <NodeRef dir="child">Concurrence__4</NodeRef>
                     </NodeOutcomeVariable>
                     <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                  </EQInternal>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="child">Concurrence__4</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </AND>
            </OR>
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="NodeList" epx="Sequence" LineNo="38" ColNo="2">
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
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">COMMAND__3</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">COMMAND__3</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                     </OR>
                  </NOT>
               </InvariantCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="Assignment" LineNo="38" ColNo="2">
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
                     <Node NodeType="Assignment" LineNo="39" ColNo="2">
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
                     <Node NodeType="Command" LineNo="39" ColNo="2">
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
                              <Arguments LineNo="40" ColNo="9">
                                 <StringValue>xini:</StringValue>
                                 <RealVariable>sim_xp</RealVariable>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="40" ColNo="2">
                        <NodeId>COMMAND__3</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">COMMAND__2</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </StartCondition>
                        <NodeBody>
                           <Command>
                              <Name>
                                 <StringValue>pprint</StringValue>
                              </Name>
                              <Arguments LineNo="41" ColNo="9">
                                 <StringValue>yini:</StringValue>
                                 <RealVariable>sim_yp</RealVariable>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                  </NodeList>
               </NodeBody>
            </Node>
            <Node NodeType="NodeList" epx="Concurrence" LineNo="45" ColNo="1">
               <NodeId>Concurrence__4</NodeId>
               <StartCondition>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="sibling">InitialContext</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </StartCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="49" ColNo="3">
                        <NodeId>PositionUpdate</NodeId>
                        <VariableDeclarations>
                           <DeclareVariable LineNo="48" ColNo="3">
                              <Name>currentWayPointX</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="49" ColNo="3">
                              <Name>currentWayPointY</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="51" ColNo="3">
                              <Name>previousWayPointX</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="52" ColNo="3">
                              <Name>previousWayPointY</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="54" ColNo="3">
                              <Name>wpdist</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="56" ColNo="3">
                              <Name>cdist</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="58" ColNo="3">
                              <Name>wp_ratio</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                        </VariableDeclarations>
                        <StartCondition>
                           <OR>
                              <GT>
                                 <ABS LineNo="62" ColNo="9">
                                    <SUB LineNo="62" ColNo="30">
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
                                 <ABS LineNo="62" ColNo="66">
                                    <SUB LineNo="62" ColNo="87">
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
                           <BooleanValue>true</BooleanValue>
                        </RepeatCondition>
                        <InvariantCondition>
                           <NOT>
                              <AND>
                                 <EQInternal>
                                    <NodeOutcomeVariable>
                                       <NodeRef dir="child">Sequence__5</NodeRef>
                                    </NodeOutcomeVariable>
                                    <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                 </EQInternal>
                                 <EQInternal>
                                    <NodeStateVariable>
                                       <NodeRef dir="child">Sequence__5</NodeRef>
                                    </NodeStateVariable>
                                    <NodeStateValue>FINISHED</NodeStateValue>
                                 </EQInternal>
                              </AND>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="NodeList" epx="Sequence" LineNo="66" ColNo="3">
                                 <NodeId>Sequence__5</NodeId>
                                 <InvariantCondition>
                                    <NOT>
                                       <AND>
                                          <EQInternal>
                                             <NodeOutcomeVariable>
                                                <NodeRef dir="child">UpdatePursuit</NodeRef>
                                             </NodeOutcomeVariable>
                                             <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                          </EQInternal>
                                          <EQInternal>
                                             <NodeStateVariable>
                                                <NodeRef dir="child">UpdatePursuit</NodeRef>
                                             </NodeStateVariable>
                                             <NodeStateValue>FINISHED</NodeStateValue>
                                          </EQInternal>
                                       </AND>
                                    </NOT>
                                 </InvariantCondition>
                                 <NodeBody>
                                    <NodeList>
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="68" ColNo="5">
                                          <NodeId>UpdatePursuit</NodeId>
                                          <InvariantCondition>
                                             <NOT>
                                                <OR>
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
                                                            <NodeRef dir="child">ASSIGNMENT__8</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__8</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__9</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__9</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__10</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__10</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__11</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__11</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__12</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__12</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__13</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__13</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
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
                                                            <NodeRef dir="child">if__15</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">if__15</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__17</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__17</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                   <AND>
                                                      <EQInternal>
                                                         <NodeOutcomeVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__18</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__18</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                </OR>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="Assignment" LineNo="68" ColNo="5">
                                                   <NodeId>ASSIGNMENT__6</NodeId>
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
                                                <Node NodeType="Assignment" LineNo="69" ColNo="5">
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
                                                <Node NodeType="Assignment" LineNo="71" ColNo="5">
                                                   <NodeId>ASSIGNMENT__8</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__7</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>currentWayPointX</RealVariable>
                                                         <NumericRHS>
                                                            <ArrayElement>
                                                               <Name>wayPointsX</Name>
                                                               <Index>
                                                                  <IntegerVariable>currentWayPointIndex</IntegerVariable>
                                                               </Index>
                                                            </ArrayElement>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="72" ColNo="5">
                                                   <NodeId>ASSIGNMENT__9</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__8</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>currentWayPointY</RealVariable>
                                                         <NumericRHS>
                                                            <ArrayElement>
                                                               <Name>wayPointsY</Name>
                                                               <Index>
                                                                  <IntegerVariable>currentWayPointIndex</IntegerVariable>
                                                               </Index>
                                                            </ArrayElement>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="74" ColNo="5">
                                                   <NodeId>ASSIGNMENT__10</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__9</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>previousWayPointX</RealVariable>
                                                         <NumericRHS>
                                                            <ArrayElement>
                                                               <Name>wayPointsX</Name>
                                                               <Index>
                                                                  <IntegerVariable>previousWayPointIndex</IntegerVariable>
                                                               </Index>
                                                            </ArrayElement>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="75" ColNo="5">
                                                   <NodeId>ASSIGNMENT__11</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__10</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>previousWayPointY</RealVariable>
                                                         <NumericRHS>
                                                            <ArrayElement>
                                                               <Name>wayPointsY</Name>
                                                               <Index>
                                                                  <IntegerVariable>previousWayPointIndex</IntegerVariable>
                                                               </Index>
                                                            </ArrayElement>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="76" ColNo="14">
                                                   <NodeId>ASSIGNMENT__12</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__11</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Command>
                                                         <RealVariable>wpdist</RealVariable>
                                                         <Name>
                                                            <StringValue>distance</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="77" ColNo="23">
                                                            <RealVariable>currentWayPointX</RealVariable>
                                                            <RealVariable>currentWayPointY</RealVariable>
                                                            <RealVariable>previousWayPointX</RealVariable>
                                                            <RealVariable>previousWayPointY</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="78" ColNo="13">
                                                   <NodeId>ASSIGNMENT__13</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__12</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Command>
                                                         <RealVariable>cdist</RealVariable>
                                                         <Name>
                                                            <StringValue>distance</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="79" ColNo="22">
                                                            <RealVariable>sim_xp</RealVariable>
                                                            <RealVariable>sim_yp</RealVariable>
                                                            <RealVariable>currentWayPointX</RealVariable>
                                                            <RealVariable>currentWayPointY</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="81" ColNo="5">
                                                   <NodeId>ASSIGNMENT__14</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__13</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>wp_ratio</RealVariable>
                                                         <NumericRHS>
                                                            <DIV LineNo="81" ColNo="42">
                                                               <ADD LineNo="81" ColNo="29">
                                                                  <SUB LineNo="81" ColNo="23">
                                                                     <RealVariable>wpdist</RealVariable>
                                                                     <RealVariable>cdist</RealVariable>
                                                                  </SUB>
                                                                  <RealVariable>FOLLOW_DIST</RealVariable>
                                                               </ADD>
                                                               <RealVariable>wpdist</RealVariable>
                                                            </DIV>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="NodeList" epx="If" LineNo="83" ColNo="5">
                                                   <NodeId>if__15</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__14</NodeRef>
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
                                                                  <RealVariable>wp_ratio</RealVariable>
                                                                  <RealValue>1.0</RealValue>
                                                               </GT>
                                                            </PostCondition>
                                                         </Node>
                                                         <Node NodeType="Assignment" epx="Then" LineNo="84" ColNo="7">
                                                            <NodeId>ASSIGNMENT__16</NodeId>
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
                                                                  <RealVariable>wp_ratio</RealVariable>
                                                                  <NumericRHS>
                                                                     <RealValue>1.0</RealValue>
                                                                  </NumericRHS>
                                                               </Assignment>
                                                            </NodeBody>
                                                         </Node>
                                                      </NodeList>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="87" ColNo="5">
                                                   <NodeId>ASSIGNMENT__17</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">if__15</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>steer_xp</RealVariable>
                                                         <NumericRHS>
                                                            <ADD LineNo="87" ColNo="33">
                                                               <RealVariable>currentWayPointX</RealVariable>
                                                               <MUL LineNo="87" ColNo="43">
                                                                  <RealVariable>wp_ratio</RealVariable>
                                                                  <SUB LineNo="87" ColNo="62">
                                                                     <RealVariable>currentWayPointX</RealVariable>
                                                                     <RealVariable>previousWayPointX</RealVariable>
                                                                  </SUB>
                                                               </MUL>
                                                            </ADD>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="88" ColNo="5">
                                                   <NodeId>ASSIGNMENT__18</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__17</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>steer_yp</RealVariable>
                                                         <NumericRHS>
                                                            <ADD LineNo="88" ColNo="33">
                                                               <RealVariable>currentWayPointY</RealVariable>
                                                               <MUL LineNo="88" ColNo="43">
                                                                  <RealVariable>wp_ratio</RealVariable>
                                                                  <SUB LineNo="88" ColNo="62">
                                                                     <RealVariable>currentWayPointY</RealVariable>
                                                                     <RealVariable>previousWayPointY</RealVariable>
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
                                    </NodeList>
                                 </NodeBody>
                              </Node>
                           </NodeList>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="117" ColNo="3">
                        <NodeId>PositionEcho</NodeId>
                        <StartCondition>
                           <OR>
                              <GT>
                                 <ABS LineNo="117" ColNo="9">
                                    <SUB LineNo="117" ColNo="30">
                                       <LookupOnChange>
                                          <Name>
                                             <StringValue>XPosition</StringValue>
                                          </Name>
                                       </LookupOnChange>
                                       <RealVariable>sim_xp</RealVariable>
                                    </SUB>
                                 </ABS>
                                 <RealValue>0.01</RealValue>
                              </GT>
                              <GT>
                                 <ABS LineNo="117" ColNo="47">
                                    <SUB LineNo="117" ColNo="68">
                                       <LookupOnChange>
                                          <Name>
                                             <StringValue>YPosition</StringValue>
                                          </Name>
                                       </LookupOnChange>
                                       <RealVariable>sim_yp</RealVariable>
                                    </SUB>
                                 </ABS>
                                 <RealValue>0.01</RealValue>
                              </GT>
                           </OR>
                        </StartCondition>
                        <RepeatCondition>
                           <BooleanValue>true</BooleanValue>
                        </RepeatCondition>
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
                                          <NodeRef dir="child">COMMAND__21</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__21</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__22</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__22</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Assignment" LineNo="119" ColNo="3">
                                 <NodeId>ASSIGNMENT__19</NodeId>
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
                              <Node NodeType="Assignment" LineNo="120" ColNo="3">
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
                              <Node NodeType="Command" LineNo="120" ColNo="3">
                                 <NodeId>COMMAND__21</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">ASSIGNMENT__20</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="121" ColNo="10">
                                          <StringValue>x:</StringValue>
                                          <RealVariable>sim_xp</RealVariable>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Command" LineNo="121" ColNo="3">
                                 <NodeId>COMMAND__22</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">COMMAND__21</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="122" ColNo="10">
                                          <StringValue>y:</StringValue>
                                          <RealVariable>sim_yp</RealVariable>
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