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
   <Node NodeType="NodeList" epx="Sequence" LineNo="24" ColNo="1">
      <NodeId>All</NodeId>
      <VariableDeclarations>
         <DeclareVariable LineNo="23" ColNo="1">
            <Name>FOLLOW_DIST</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>50</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="24" ColNo="1">
            <Name>WP_DIST</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>30</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="25" ColNo="1">
            <Name>sim_xp</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="26" ColNo="1">
            <Name>sim_yp</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="27" ColNo="1">
            <Name>steer_xp</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="28" ColNo="1">
            <Name>steer_yp</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="29" ColNo="1">
            <Name>AXIS_DISPLACEMENT_DELTA</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0.01</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="31" ColNo="1">
            <Name>lookAheadDistance</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareArray LineNo="33" ColNo="1">
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
         <DeclareArray LineNo="34" ColNo="1">
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
         <DeclareVariable LineNo="36" ColNo="1">
            <Name>currentWayPointIndex</Name>
            <Type>Integer</Type>
            <InitialValue>
               <IntegerValue>1</IntegerValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="37" ColNo="1">
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
            <Node NodeType="NodeList" epx="Sequence" LineNo="41" ColNo="2">
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
                     <Node NodeType="Assignment" LineNo="41" ColNo="2">
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
                     <Node NodeType="Assignment" LineNo="42" ColNo="2">
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
                     <Node NodeType="Command" LineNo="42" ColNo="2">
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
                              <Arguments LineNo="43" ColNo="9">
                                 <StringValue>xini:</StringValue>
                                 <RealVariable>sim_xp</RealVariable>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="43" ColNo="2">
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
                              <Arguments LineNo="44" ColNo="9">
                                 <StringValue>yini:</StringValue>
                                 <RealVariable>sim_yp</RealVariable>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                  </NodeList>
               </NodeBody>
            </Node>
            <Node NodeType="NodeList" epx="Concurrence" LineNo="48" ColNo="1">
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
                     <Node NodeType="NodeList" epx="Sequence" LineNo="52" ColNo="3">
                        <NodeId>PositionUpdate</NodeId>
                        <VariableDeclarations>
                           <DeclareVariable LineNo="51" ColNo="3">
                              <Name>currentWayPointX</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="52" ColNo="3">
                              <Name>currentWayPointY</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="54" ColNo="3">
                              <Name>previousWayPointX</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="55" ColNo="3">
                              <Name>previousWayPointY</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="57" ColNo="3">
                              <Name>wpdist</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="59" ColNo="3">
                              <Name>cdist</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="61" ColNo="3">
                              <Name>wp_ratio</Name>
                              <Type>Real</Type>
                              <InitialValue>
                                 <RealValue>0</RealValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="63" ColNo="3">
                              <Name>moveToLeft</Name>
                              <Type>Boolean</Type>
                              <InitialValue>
                                 <BooleanValue>false</BooleanValue>
                              </InitialValue>
                           </DeclareVariable>
                           <DeclareVariable LineNo="64" ColNo="3">
                              <Name>moveToRight</Name>
                              <Type>Boolean</Type>
                              <InitialValue>
                                 <BooleanValue>false</BooleanValue>
                              </InitialValue>
                           </DeclareVariable>
                        </VariableDeclarations>
                        <StartCondition>
                           <OR>
                              <GT>
                                 <ABS LineNo="68" ColNo="9">
                                    <SUB LineNo="68" ColNo="30">
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
                                 <ABS LineNo="68" ColNo="66">
                                    <SUB LineNo="68" ColNo="87">
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
                              <Node NodeType="NodeList" epx="Sequence" LineNo="72" ColNo="3">
                                 <NodeId>Sequence__5</NodeId>
                                 <InvariantCondition>
                                    <NOT>
                                       <OR>
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
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">UpdateWayPoint</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">UpdateWayPoint</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">UpdateSteering</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">UpdateSteering</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                       </OR>
                                    </NOT>
                                 </InvariantCondition>
                                 <NodeBody>
                                    <NodeList>
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="74" ColNo="5">
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
                                                <Node NodeType="Assignment" LineNo="74" ColNo="5">
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
                                                <Node NodeType="Assignment" LineNo="75" ColNo="5">
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
                                                <Node NodeType="Assignment" LineNo="77" ColNo="5">
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
                                                <Node NodeType="Assignment" LineNo="78" ColNo="5">
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
                                                <Node NodeType="Assignment" LineNo="80" ColNo="5">
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
                                                <Node NodeType="Assignment" LineNo="81" ColNo="5">
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
                                                <Node NodeType="Command" LineNo="82" ColNo="14">
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
                                                         <Arguments LineNo="83" ColNo="23">
                                                            <RealVariable>currentWayPointX</RealVariable>
                                                            <RealVariable>currentWayPointY</RealVariable>
                                                            <RealVariable>previousWayPointX</RealVariable>
                                                            <RealVariable>previousWayPointY</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="84" ColNo="13">
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
                                                         <Arguments LineNo="85" ColNo="22">
                                                            <RealVariable>sim_xp</RealVariable>
                                                            <RealVariable>sim_yp</RealVariable>
                                                            <RealVariable>currentWayPointX</RealVariable>
                                                            <RealVariable>currentWayPointY</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="87" ColNo="5">
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
                                                            <DIV LineNo="87" ColNo="42">
                                                               <ADD LineNo="87" ColNo="29">
                                                                  <SUB LineNo="87" ColNo="23">
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
                                                <Node NodeType="NodeList" epx="If" LineNo="89" ColNo="5">
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
                                                         <Node NodeType="Assignment" epx="Then" LineNo="90" ColNo="7">
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
                                                <Node NodeType="Assignment" LineNo="93" ColNo="5">
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
                                                            <ADD LineNo="93" ColNo="33">
                                                               <RealVariable>currentWayPointX</RealVariable>
                                                               <MUL LineNo="93" ColNo="43">
                                                                  <RealVariable>wp_ratio</RealVariable>
                                                                  <SUB LineNo="93" ColNo="62">
                                                                     <RealVariable>currentWayPointX</RealVariable>
                                                                     <RealVariable>previousWayPointX</RealVariable>
                                                                  </SUB>
                                                               </MUL>
                                                            </ADD>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="94" ColNo="5">
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
                                                            <ADD LineNo="94" ColNo="33">
                                                               <RealVariable>currentWayPointY</RealVariable>
                                                               <MUL LineNo="94" ColNo="43">
                                                                  <RealVariable>wp_ratio</RealVariable>
                                                                  <SUB LineNo="94" ColNo="62">
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
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="99" ColNo="5">
                                          <NodeId>UpdateWayPoint</NodeId>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">UpdatePursuit</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </StartCondition>
                                          <InvariantCondition>
                                             <NOT>
                                                <AND>
                                                   <EQInternal>
                                                      <NodeOutcomeVariable>
                                                         <NodeRef dir="child">if__19</NodeRef>
                                                      </NodeOutcomeVariable>
                                                      <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                   </EQInternal>
                                                   <EQInternal>
                                                      <NodeStateVariable>
                                                         <NodeRef dir="child">if__19</NodeRef>
                                                      </NodeStateVariable>
                                                      <NodeStateValue>FINISHED</NodeStateValue>
                                                   </EQInternal>
                                                </AND>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="NodeList" epx="If" LineNo="99" ColNo="5">
                                                   <NodeId>if__19</NodeId>
                                                   <NodeBody>
                                                      <NodeList>
                                                         <Node NodeType="Empty" epx="Condition">
                                                            <NodeId>ep2cp_IfTest</NodeId>
                                                            <PostCondition>
                                                               <GT>
                                                                  <RealVariable>cdist</RealVariable>
                                                                  <RealVariable>WP_DIST</RealVariable>
                                                               </GT>
                                                            </PostCondition>
                                                         </Node>
                                                         <Node NodeType="NodeList" epx="Then" LineNo="101" ColNo="7">
                                                            <NodeId>BLOCK__20</NodeId>
                                                            <InvariantCondition>
                                                               <NOT>
                                                                  <OR>
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
                                                                  <Node NodeType="Assignment" LineNo="101" ColNo="7">
                                                                     <NodeId>ASSIGNMENT__21</NodeId>
                                                                     <NodeBody>
                                                                        <Assignment>
                                                                           <IntegerVariable>currentWayPointIndex</IntegerVariable>
                                                                           <NumericRHS>
                                                                              <ADD LineNo="101" ColNo="48">
                                                                                 <IntegerVariable>currentWayPointIndex</IntegerVariable>
                                                                                 <IntegerValue>1</IntegerValue>
                                                                              </ADD>
                                                                           </NumericRHS>
                                                                        </Assignment>
                                                                     </NodeBody>
                                                                  </Node>
                                                                  <Node NodeType="Command" LineNo="101" ColNo="7">
                                                                     <NodeId>COMMAND__22</NodeId>
                                                                     <StartCondition>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="sibling">ASSIGNMENT__21</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </StartCondition>
                                                                     <NodeBody>
                                                                        <Command>
                                                                           <Name>
                                                                              <StringValue>pprint</StringValue>
                                                                           </Name>
                                                                           <Arguments LineNo="102" ColNo="14">
                                                                              <StringValue>changing waypoint</StringValue>
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
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="111" ColNo="5">
                                          <NodeId>UpdateSteering</NodeId>
                                          <VariableDeclarations>
                                             <DeclareVariable LineNo="110" ColNo="5">
                                                <Name>cdir</Name>
                                                <Type>Real</Type>
                                                <InitialValue>
                                                   <RealValue>0</RealValue>
                                                </InitialValue>
                                             </DeclareVariable>
                                             <DeclareVariable LineNo="111" ColNo="5">
                                                <Name>sdir</Name>
                                                <Type>Real</Type>
                                                <InitialValue>
                                                   <RealValue>0</RealValue>
                                                </InitialValue>
                                             </DeclareVariable>
                                             <DeclareVariable LineNo="112" ColNo="5">
                                                <Name>xprod</Name>
                                                <Type>Real</Type>
                                                <InitialValue>
                                                   <RealValue>0</RealValue>
                                                </InitialValue>
                                             </DeclareVariable>
                                             <DeclareVariable LineNo="113" ColNo="5">
                                                <Name>currentYaw</Name>
                                                <Type>Real</Type>
                                                <InitialValue>
                                                   <RealValue>0</RealValue>
                                                </InitialValue>
                                             </DeclareVariable>
                                             <DeclareVariable LineNo="114" ColNo="5">
                                                <Name>yawCorrection</Name>
                                                <Type>Real</Type>
                                                <InitialValue>
                                                   <RealValue>0</RealValue>
                                                </InitialValue>
                                             </DeclareVariable>
                                          </VariableDeclarations>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">UpdateWayPoint</NodeRef>
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
                                                            <NodeRef dir="child">ASSIGNMENT__23</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">ASSIGNMENT__23</NodeRef>
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
                                                            <NodeRef dir="child">if__27</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">if__27</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                </OR>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="Assignment" LineNo="118" ColNo="5">
                                                   <NodeId>ASSIGNMENT__23</NodeId>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>currentYaw</RealVariable>
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
                                                <Node NodeType="Command" LineNo="119" ColNo="12">
                                                   <NodeId>ASSIGNMENT__24</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__23</NodeRef>
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
                                                         <Arguments LineNo="120" ColNo="16">
                                                            <RealVariable>currentYaw</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Command" LineNo="120" ColNo="12">
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
                                                      <Command>
                                                         <RealVariable>sdir</RealVariable>
                                                         <Name>
                                                            <StringValue>sin</StringValue>
                                                         </Name>
                                                         <Arguments LineNo="121" ColNo="16">
                                                            <RealVariable>currentYaw</RealVariable>
                                                         </Arguments>
                                                      </Command>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="Assignment" LineNo="123" ColNo="5">
                                                   <NodeId>ASSIGNMENT__26</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__25</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>xprod</RealVariable>
                                                         <NumericRHS>
                                                            <DIV LineNo="123" ColNo="62">
                                                               <SUB LineNo="123" ColNo="37">
                                                                  <MUL LineNo="123" ColNo="18">
                                                                     <RealVariable>sdir</RealVariable>
                                                                     <SUB LineNo="123" ColNo="26">
                                                                        <RealVariable>sim_xp</RealVariable>
                                                                        <RealVariable>steer_xp</RealVariable>
                                                                     </SUB>
                                                                  </MUL>
                                                                  <MUL LineNo="123" ColNo="43">
                                                                     <RealVariable>cdir</RealVariable>
                                                                     <SUB LineNo="123" ColNo="51">
                                                                        <RealVariable>sim_yp</RealVariable>
                                                                        <RealVariable>steer_yp</RealVariable>
                                                                     </SUB>
                                                                  </MUL>
                                                               </SUB>
                                                               <RealVariable>wpdist</RealVariable>
                                                            </DIV>
                                                         </NumericRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="NodeList" epx="If" LineNo="125" ColNo="5">
                                                   <NodeId>if__27</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__26</NodeRef>
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
                                                                  <RealVariable>xprod</RealVariable>
                                                                  <RealValue>-0.1</RealValue>
                                                               </LT>
                                                            </PostCondition>
                                                         </Node>
                                                         <Node NodeType="NodeList" epx="Then" LineNo="127" ColNo="6">
                                                            <NodeId>BLOCK__28</NodeId>
                                                            <InvariantCondition>
                                                               <NOT>
                                                                  <OR>
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
                                                                              <NodeRef dir="child">ASSIGNMENT__30</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">ASSIGNMENT__30</NodeRef>
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
                                                                  <Node NodeType="Assignment" LineNo="127" ColNo="6">
                                                                     <NodeId>ASSIGNMENT__29</NodeId>
                                                                     <NodeBody>
                                                                        <Assignment>
                                                                           <BooleanVariable>moveToLeft</BooleanVariable>
                                                                           <BooleanRHS>
                                                                              <BooleanValue>false</BooleanValue>
                                                                           </BooleanRHS>
                                                                        </Assignment>
                                                                     </NodeBody>
                                                                  </Node>
                                                                  <Node NodeType="Assignment" LineNo="128" ColNo="6">
                                                                     <NodeId>ASSIGNMENT__30</NodeId>
                                                                     <StartCondition>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="sibling">ASSIGNMENT__29</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </StartCondition>
                                                                     <NodeBody>
                                                                        <Assignment>
                                                                           <BooleanVariable>moveToRight</BooleanVariable>
                                                                           <BooleanRHS>
                                                                              <BooleanValue>true</BooleanValue>
                                                                           </BooleanRHS>
                                                                        </Assignment>
                                                                     </NodeBody>
                                                                  </Node>
                                                               </NodeList>
                                                            </NodeBody>
                                                         </Node>
                                                         <Node NodeType="NodeList" epx="Else" LineNo="133" ColNo="6">
                                                            <NodeId>BLOCK__31</NodeId>
                                                            <InvariantCondition>
                                                               <NOT>
                                                                  <OR>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">ASSIGNMENT__32</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">ASSIGNMENT__32</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </AND>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">ASSIGNMENT__33</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">ASSIGNMENT__33</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </AND>
                                                                  </OR>
                                                               </NOT>
                                                            </InvariantCondition>
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
                                                               <NodeList>
                                                                  <Node NodeType="Assignment" LineNo="133" ColNo="6">
                                                                     <NodeId>ASSIGNMENT__32</NodeId>
                                                                     <NodeBody>
                                                                        <Assignment>
                                                                           <BooleanVariable>moveToLeft</BooleanVariable>
                                                                           <BooleanRHS>
                                                                              <BooleanValue>true</BooleanValue>
                                                                           </BooleanRHS>
                                                                        </Assignment>
                                                                     </NodeBody>
                                                                  </Node>
                                                                  <Node NodeType="Assignment" LineNo="134" ColNo="6">
                                                                     <NodeId>ASSIGNMENT__33</NodeId>
                                                                     <StartCondition>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="sibling">ASSIGNMENT__32</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </StartCondition>
                                                                     <NodeBody>
                                                                        <Assignment>
                                                                           <BooleanVariable>moveToRight</BooleanVariable>
                                                                           <BooleanRHS>
                                                                              <BooleanValue>false</BooleanValue>
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
                     <Node NodeType="NodeList" epx="Sequence" LineNo="163" ColNo="3">
                        <NodeId>PositionEcho</NodeId>
                        <StartCondition>
                           <OR>
                              <GT>
                                 <ABS LineNo="163" ColNo="9">
                                    <SUB LineNo="163" ColNo="30">
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
                                 <ABS LineNo="163" ColNo="47">
                                    <SUB LineNo="163" ColNo="68">
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
                                          <NodeRef dir="child">ASSIGNMENT__34</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">ASSIGNMENT__34</NodeRef>
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
                                          <NodeRef dir="child">COMMAND__36</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__36</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__37</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__37</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Assignment" LineNo="165" ColNo="3">
                                 <NodeId>ASSIGNMENT__34</NodeId>
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
                              <Node NodeType="Assignment" LineNo="166" ColNo="3">
                                 <NodeId>ASSIGNMENT__35</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">ASSIGNMENT__34</NodeRef>
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
                              <Node NodeType="Command" LineNo="166" ColNo="3">
                                 <NodeId>COMMAND__36</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">ASSIGNMENT__35</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="167" ColNo="10">
                                          <StringValue>x:</StringValue>
                                          <RealVariable>sim_xp</RealVariable>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Command" LineNo="167" ColNo="3">
                                 <NodeId>COMMAND__37</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">COMMAND__36</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="168" ColNo="10">
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