<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="husky-square2.ple">
   <GlobalDeclarations LineNo="15" ColNo="0">
      <CommandDeclaration LineNo="15" ColNo="0">
         <Name>RequestLinearVelocity</Name>
         <Parameter>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="16" ColNo="0">
         <Name>RequestAngularVelocity</Name>
         <Parameter>
            <Type>Real</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="17" ColNo="0">
         <Name>pprint</Name>
      </CommandDeclaration>
   </GlobalDeclarations>
   <Node NodeType="NodeList" epx="Sequence" LineNo="21" ColNo="1">
      <NodeId>Rotate</NodeId>
      <VariableDeclarations>
         <DeclareVariable LineNo="20" ColNo="1">
            <Name>completeTurn</Name>
            <Type>Boolean</Type>
            <InitialValue>
               <BooleanValue>false</BooleanValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="21" ColNo="1">
            <Name>PI</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>3.1416</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="23" ColNo="1">
            <Name>initialYaw</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="25" ColNo="1">
            <Name>WIDTH</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>5</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="27" ColNo="1">
            <Name>goal</Name>
            <Type>Boolean</Type>
            <InitialValue>
               <BooleanValue>false</BooleanValue>
            </InitialValue>
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
                        <NodeRef dir="child">COMMAND__1</NodeRef>
                     </NodeOutcomeVariable>
                     <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                  </EQInternal>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="child">COMMAND__1</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </AND>
               <AND>
                  <EQInternal>
                     <NodeOutcomeVariable>
                        <NodeRef dir="child">for__2</NodeRef>
                     </NodeOutcomeVariable>
                     <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                  </EQInternal>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="child">for__2</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </AND>
            </OR>
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="Assignment" LineNo="34" ColNo="1">
               <NodeId>ASSIGNMENT__0</NodeId>
               <NodeBody>
                  <Assignment>
                     <RealVariable>initialYaw</RealVariable>
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
            <Node NodeType="Command" LineNo="35" ColNo="1">
               <NodeId>COMMAND__1</NodeId>
               <StartCondition>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="sibling">ASSIGNMENT__0</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="36" ColNo="8">
                        <StringValue>Original coords:</StringValue>
                        <LookupNow>
                           <Name>
                              <StringValue>XPosition</StringValue>
                           </Name>
                        </LookupNow>
                        <LookupNow>
                           <Name>
                              <StringValue>YPosition</StringValue>
                           </Name>
                        </LookupNow>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
            <Node NodeType="NodeList" epx="For" LineNo="40" ColNo="1">
               <NodeId>for__2</NodeId>
               <VariableDeclarations>
                  <DeclareVariable LineNo="39" ColNo="6">
                     <Name>i</Name>
                     <Type>Integer</Type>
                     <InitialValue>
                        <IntegerValue>0</IntegerValue>
                     </InitialValue>
                  </DeclareVariable>
               </VariableDeclarations>
               <StartCondition>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="sibling">COMMAND__1</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </StartCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="NodeList" epx="aux">
                        <NodeId>ep2cp_ForLoop</NodeId>
                        <RepeatCondition>
                           <LE>
                              <IntegerVariable>i</IntegerVariable>
                              <IntegerValue>4</IntegerValue>
                           </LE>
                        </RepeatCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="NodeList" epx="Sequence" LineNo="43" ColNo="2">
                                 <NodeId>BLOCK__3</NodeId>
                                 <InvariantCondition>
                                    <NOT>
                                       <OR>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">Move</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">Move</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">Stop</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">Stop</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                          <AND>
                                             <EQInternal>
                                                <NodeOutcomeVariable>
                                                   <NodeRef dir="child">Turn</NodeRef>
                                                </NodeOutcomeVariable>
                                                <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                             </EQInternal>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="child">Turn</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </AND>
                                       </OR>
                                    </NOT>
                                 </InvariantCondition>
                                 <NodeBody>
                                    <NodeList>
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="44" ColNo="3">
                                          <NodeId>Move</NodeId>
                                          <VariableDeclarations>
                                             <DeclareVariable LineNo="43" ColNo="3">
                                                <Name>currXPos</Name>
                                                <Type>Real</Type>
                                             </DeclareVariable>
                                             <DeclareVariable LineNo="43" ColNo="3">
                                                <Name>currYPos</Name>
                                                <Type>Real</Type>
                                             </DeclareVariable>
                                          </VariableDeclarations>
                                          <InvariantCondition>
                                             <NOT>
                                                <AND>
                                                   <EQInternal>
                                                      <NodeOutcomeVariable>
                                                         <NodeRef dir="child">Sequence__4</NodeRef>
                                                      </NodeOutcomeVariable>
                                                      <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                   </EQInternal>
                                                   <EQInternal>
                                                      <NodeStateVariable>
                                                         <NodeRef dir="child">Sequence__4</NodeRef>
                                                      </NodeStateVariable>
                                                      <NodeStateValue>FINISHED</NodeStateValue>
                                                   </EQInternal>
                                                </AND>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="NodeList" epx="Sequence" LineNo="46" ColNo="3">
                                                   <NodeId>Sequence__4</NodeId>
                                                   <InvariantCondition>
                                                      <NOT>
                                                         <OR>
                                                            <AND>
                                                               <EQInternal>
                                                                  <NodeOutcomeVariable>
                                                                     <NodeRef dir="child">UpdateOdom</NodeRef>
                                                                  </NodeOutcomeVariable>
                                                                  <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                               </EQInternal>
                                                               <EQInternal>
                                                                  <NodeStateVariable>
                                                                     <NodeRef dir="child">UpdateOdom</NodeRef>
                                                                  </NodeStateVariable>
                                                                  <NodeStateValue>FINISHED</NodeStateValue>
                                                               </EQInternal>
                                                            </AND>
                                                            <AND>
                                                               <EQInternal>
                                                                  <NodeOutcomeVariable>
                                                                     <NodeRef dir="child">MoveUntilDistanceReached</NodeRef>
                                                                  </NodeOutcomeVariable>
                                                                  <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                               </EQInternal>
                                                               <EQInternal>
                                                                  <NodeStateVariable>
                                                                     <NodeRef dir="child">MoveUntilDistanceReached</NodeRef>
                                                                  </NodeStateVariable>
                                                                  <NodeStateValue>FINISHED</NodeStateValue>
                                                               </EQInternal>
                                                            </AND>
                                                         </OR>
                                                      </NOT>
                                                   </InvariantCondition>
                                                   <NodeBody>
                                                      <NodeList>
                                                         <Node NodeType="NodeList" epx="Sequence" LineNo="48" ColNo="5">
                                                            <NodeId>UpdateOdom</NodeId>
                                                            <InvariantCondition>
                                                               <NOT>
                                                                  <OR>
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
                                                                  </OR>
                                                               </NOT>
                                                            </InvariantCondition>
                                                            <NodeBody>
                                                               <NodeList>
                                                                  <Node NodeType="Assignment" LineNo="48" ColNo="5">
                                                                     <NodeId>ASSIGNMENT__5</NodeId>
                                                                     <NodeBody>
                                                                        <Assignment>
                                                                           <RealVariable>currXPos</RealVariable>
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
                                                                  <Node NodeType="Assignment" LineNo="49" ColNo="5">
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
                                                                           <RealVariable>currYPos</RealVariable>
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
                                                               </NodeList>
                                                            </NodeBody>
                                                         </Node>
                                                         <Node NodeType="Command" LineNo="56" ColNo="5">
                                                            <NodeId>MoveUntilDistanceReached</NodeId>
                                                            <StartCondition>
                                                               <AND>
                                                                  <EQInternal>
                                                                     <NodeStateVariable>
                                                                        <NodeRef dir="sibling">UpdateOdom</NodeRef>
                                                                     </NodeStateVariable>
                                                                     <NodeStateValue>FINISHED</NodeStateValue>
                                                                  </EQInternal>
                                                                  <LT>
                                                                     <SQRT LineNo="52" ColNo="11">
                                                                        <ADD LineNo="52" ColNo="73">
                                                                           <MUL LineNo="52" ColNo="44">
                                                                              <SUB LineNo="52" ColNo="25">
                                                                                 <RealVariable>currXPos</RealVariable>
                                                                                 <LookupOnChange>
                                                                                    <Name>
                                                                                       <StringValue>XPosition</StringValue>
                                                                                    </Name>
                                                                                 </LookupOnChange>
                                                                              </SUB>
                                                                              <SUB LineNo="52" ColNo="54">
                                                                                 <RealVariable>currXPos</RealVariable>
                                                                                 <LookupOnChange>
                                                                                    <Name>
                                                                                       <StringValue>XPosition</StringValue>
                                                                                    </Name>
                                                                                 </LookupOnChange>
                                                                              </SUB>
                                                                           </MUL>
                                                                           <MUL LineNo="53" ColNo="37">
                                                                              <SUB LineNo="53" ColNo="18">
                                                                                 <RealVariable>currYPos</RealVariable>
                                                                                 <LookupOnChange>
                                                                                    <Name>
                                                                                       <StringValue>YPosition</StringValue>
                                                                                    </Name>
                                                                                 </LookupOnChange>
                                                                              </SUB>
                                                                              <SUB LineNo="53" ColNo="47">
                                                                                 <RealVariable>currYPos</RealVariable>
                                                                                 <LookupOnChange>
                                                                                    <Name>
                                                                                       <StringValue>YPosition</StringValue>
                                                                                    </Name>
                                                                                 </LookupOnChange>
                                                                              </SUB>
                                                                           </MUL>
                                                                        </ADD>
                                                                     </SQRT>
                                                                     <RealVariable>WIDTH</RealVariable>
                                                                  </LT>
                                                               </AND>
                                                            </StartCondition>
                                                            <RepeatCondition>
                                                               <LT>
                                                                  <SQRT LineNo="54" ColNo="12">
                                                                     <ADD LineNo="54" ColNo="74">
                                                                        <MUL LineNo="54" ColNo="45">
                                                                           <SUB LineNo="54" ColNo="26">
                                                                              <RealVariable>currXPos</RealVariable>
                                                                              <LookupOnChange>
                                                                                 <Name>
                                                                                    <StringValue>XPosition</StringValue>
                                                                                 </Name>
                                                                              </LookupOnChange>
                                                                           </SUB>
                                                                           <SUB LineNo="54" ColNo="55">
                                                                              <RealVariable>currXPos</RealVariable>
                                                                              <LookupOnChange>
                                                                                 <Name>
                                                                                    <StringValue>XPosition</StringValue>
                                                                                 </Name>
                                                                              </LookupOnChange>
                                                                           </SUB>
                                                                        </MUL>
                                                                        <MUL LineNo="55" ColNo="37">
                                                                           <SUB LineNo="55" ColNo="18">
                                                                              <RealVariable>currYPos</RealVariable>
                                                                              <LookupOnChange>
                                                                                 <Name>
                                                                                    <StringValue>YPosition</StringValue>
                                                                                 </Name>
                                                                              </LookupOnChange>
                                                                           </SUB>
                                                                           <SUB LineNo="55" ColNo="47">
                                                                              <RealVariable>currYPos</RealVariable>
                                                                              <LookupOnChange>
                                                                                 <Name>
                                                                                    <StringValue>YPosition</StringValue>
                                                                                 </Name>
                                                                              </LookupOnChange>
                                                                           </SUB>
                                                                        </MUL>
                                                                     </ADD>
                                                                  </SQRT>
                                                                  <RealVariable>WIDTH</RealVariable>
                                                               </LT>
                                                            </RepeatCondition>
                                                            <NodeBody>
                                                               <Command>
                                                                  <Name>
                                                                     <StringValue>RequestLinearVelocity</StringValue>
                                                                  </Name>
                                                                  <Arguments LineNo="57" ColNo="27">
                                                                     <RealValue>1</RealValue>
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
                                       <Node NodeType="Command" LineNo="65" ColNo="3">
                                          <NodeId>Stop</NodeId>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">Move</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </StartCondition>
                                          <NodeBody>
                                             <Command>
                                                <Name>
                                                   <StringValue>RequestAngularVelocity</StringValue>
                                                </Name>
                                                <Arguments LineNo="66" ColNo="26">
                                                   <RealValue>0</RealValue>
                                                </Arguments>
                                             </Command>
                                          </NodeBody>
                                       </Node>
                                       <Node NodeType="NodeList" epx="Sequence" LineNo="73" ColNo="3">
                                          <NodeId>Turn</NodeId>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">Stop</NodeRef>
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
                                                            <NodeRef dir="child">Concurrence__11</NodeRef>
                                                         </NodeOutcomeVariable>
                                                         <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                      </EQInternal>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="child">Concurrence__11</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </AND>
                                                </OR>
                                             </NOT>
                                          </InvariantCondition>
                                          <NodeBody>
                                             <NodeList>
                                                <Node NodeType="Assignment" LineNo="73" ColNo="3">
                                                   <NodeId>ASSIGNMENT__9</NodeId>
                                                   <NodeBody>
                                                      <Assignment>
                                                         <RealVariable>initialYaw</RealVariable>
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
                                                <Node NodeType="Assignment" LineNo="74" ColNo="3">
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
                                                         <BooleanVariable>completeTurn</BooleanVariable>
                                                         <BooleanRHS>
                                                            <BooleanValue>false</BooleanValue>
                                                         </BooleanRHS>
                                                      </Assignment>
                                                   </NodeBody>
                                                </Node>
                                                <Node NodeType="NodeList" epx="Concurrence" LineNo="76" ColNo="3">
                                                   <NodeId>Concurrence__11</NodeId>
                                                   <StartCondition>
                                                      <EQInternal>
                                                         <NodeStateVariable>
                                                            <NodeRef dir="sibling">ASSIGNMENT__10</NodeRef>
                                                         </NodeStateVariable>
                                                         <NodeStateValue>FINISHED</NodeStateValue>
                                                      </EQInternal>
                                                   </StartCondition>
                                                   <NodeBody>
                                                      <NodeList>
                                                         <Node NodeType="NodeList" epx="Sequence" LineNo="83" ColNo="5">
                                                            <NodeId>StaticTurn</NodeId>
                                                            <RepeatCondition>
                                                               <EQBoolean>
                                                                  <BooleanVariable>completeTurn</BooleanVariable>
                                                                  <BooleanValue>false</BooleanValue>
                                                               </EQBoolean>
                                                            </RepeatCondition>
                                                            <InvariantCondition>
                                                               <NOT>
                                                                  <OR>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">COMMAND__12</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">COMMAND__12</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </AND>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">COMMAND__13</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">COMMAND__13</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </AND>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">COMMAND__14</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">COMMAND__14</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </AND>
                                                                  </OR>
                                                               </NOT>
                                                            </InvariantCondition>
                                                            <NodeBody>
                                                               <NodeList>
                                                                  <Node NodeType="Command" LineNo="84" ColNo="5">
                                                                     <NodeId>COMMAND__12</NodeId>
                                                                     <NodeBody>
                                                                        <Command>
                                                                           <Name>
                                                                              <StringValue>RequestAngularVelocity</StringValue>
                                                                           </Name>
                                                                           <Arguments LineNo="85" ColNo="28">
                                                                              <RealValue>0.1</RealValue>
                                                                           </Arguments>
                                                                        </Command>
                                                                     </NodeBody>
                                                                  </Node>
                                                                  <Node NodeType="Command" LineNo="87" ColNo="5">
                                                                     <NodeId>COMMAND__13</NodeId>
                                                                     <StartCondition>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="sibling">COMMAND__12</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </StartCondition>
                                                                     <NodeBody>
                                                                        <Command>
                                                                           <Name>
                                                                              <StringValue>pprint</StringValue>
                                                                           </Name>
                                                                           <Arguments LineNo="88" ColNo="12">
                                                                              <StringValue>Angle </StringValue>
                                                                              <LookupNow>
                                                                                 <Name>
                                                                                    <StringValue>Yaw</StringValue>
                                                                                 </Name>
                                                                              </LookupNow>
                                                                              <LookupNow>
                                                                                 <Name>
                                                                                    <StringValue>Yaw</StringValue>
                                                                                 </Name>
                                                                              </LookupNow>
                                                                           </Arguments>
                                                                        </Command>
                                                                     </NodeBody>
                                                                  </Node>
                                                                  <Node NodeType="Command" LineNo="88" ColNo="5">
                                                                     <NodeId>COMMAND__14</NodeId>
                                                                     <StartCondition>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="sibling">COMMAND__13</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </StartCondition>
                                                                     <NodeBody>
                                                                        <Command>
                                                                           <Name>
                                                                              <StringValue>pprint</StringValue>
                                                                           </Name>
                                                                           <Arguments LineNo="89" ColNo="12">
                                                                              <StringValue>Diff </StringValue>
                                                                              <ABS LineNo="89" ColNo="20">
                                                                                 <SUB LineNo="89" ColNo="34">
                                                                                    <RealVariable>initialYaw</RealVariable>
                                                                                    <LookupNow>
                                                                                       <Name>
                                                                                          <StringValue>Yaw</StringValue>
                                                                                       </Name>
                                                                                    </LookupNow>
                                                                                 </SUB>
                                                                              </ABS>
                                                                           </Arguments>
                                                                        </Command>
                                                                     </NodeBody>
                                                                  </Node>
                                                               </NodeList>
                                                            </NodeBody>
                                                         </Node>
                                                         <Node NodeType="NodeList" epx="Sequence" LineNo="96" ColNo="5">
                                                            <NodeId>CompleteTurnCheck</NodeId>
                                                            <StartCondition>
                                                               <OR>
                                                                  <AND>
                                                                     <LE>
                                                                        <ABS LineNo="96" ColNo="13">
                                                                           <SUB LineNo="96" ColNo="27">
                                                                              <RealVariable>initialYaw</RealVariable>
                                                                              <LookupOnChange>
                                                                                 <Name>
                                                                                    <StringValue>Yaw</StringValue>
                                                                                 </Name>
                                                                              </LookupOnChange>
                                                                           </SUB>
                                                                        </ABS>
                                                                        <RealVariable>PI</RealVariable>
                                                                     </LE>
                                                                     <GE>
                                                                        <ABS LineNo="96" ColNo="50">
                                                                           <SUB LineNo="96" ColNo="64">
                                                                              <RealVariable>initialYaw</RealVariable>
                                                                              <LookupOnChange>
                                                                                 <Name>
                                                                                    <StringValue>Yaw</StringValue>
                                                                                 </Name>
                                                                              </LookupOnChange>
                                                                           </SUB>
                                                                        </ABS>
                                                                        <DIV LineNo="96" ColNo="81">
                                                                           <RealVariable>PI</RealVariable>
                                                                           <IntegerValue>2</IntegerValue>
                                                                        </DIV>
                                                                     </GE>
                                                                  </AND>
                                                                  <AND>
                                                                     <GT>
                                                                        <ABS LineNo="97" ColNo="10">
                                                                           <SUB LineNo="97" ColNo="24">
                                                                              <RealVariable>initialYaw</RealVariable>
                                                                              <LookupOnChange>
                                                                                 <Name>
                                                                                    <StringValue>Yaw</StringValue>
                                                                                 </Name>
                                                                              </LookupOnChange>
                                                                           </SUB>
                                                                        </ABS>
                                                                        <RealVariable>PI</RealVariable>
                                                                     </GT>
                                                                     <GE>
                                                                        <SUB LineNo="97" ColNo="51">
                                                                           <MUL LineNo="97" ColNo="48">
                                                                              <IntegerValue>2</IntegerValue>
                                                                              <RealVariable>PI</RealVariable>
                                                                           </MUL>
                                                                           <ABS LineNo="97" ColNo="52">
                                                                              <SUB LineNo="97" ColNo="66">
                                                                                 <RealVariable>initialYaw</RealVariable>
                                                                                 <LookupOnChange>
                                                                                    <Name>
                                                                                       <StringValue>Yaw</StringValue>
                                                                                    </Name>
                                                                                 </LookupOnChange>
                                                                              </SUB>
                                                                           </ABS>
                                                                        </SUB>
                                                                        <DIV LineNo="97" ColNo="84">
                                                                           <RealVariable>PI</RealVariable>
                                                                           <IntegerValue>2</IntegerValue>
                                                                        </DIV>
                                                                     </GE>
                                                                  </AND>
                                                               </OR>
                                                            </StartCondition>
                                                            <InvariantCondition>
                                                               <NOT>
                                                                  <OR>
                                                                     <AND>
                                                                        <EQInternal>
                                                                           <NodeOutcomeVariable>
                                                                              <NodeRef dir="child">COMMAND__15</NodeRef>
                                                                           </NodeOutcomeVariable>
                                                                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                                                        </EQInternal>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="child">COMMAND__15</NodeRef>
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
                                                                  </OR>
                                                               </NOT>
                                                            </InvariantCondition>
                                                            <NodeBody>
                                                               <NodeList>
                                                                  <Node NodeType="Command" LineNo="97" ColNo="5">
                                                                     <NodeId>COMMAND__15</NodeId>
                                                                     <NodeBody>
                                                                        <Command>
                                                                           <Name>
                                                                              <StringValue>pprint</StringValue>
                                                                           </Name>
                                                                           <Arguments LineNo="98" ColNo="12">
                                                                              <StringValue>Second turn complete!</StringValue>
                                                                           </Arguments>
                                                                        </Command>
                                                                     </NodeBody>
                                                                  </Node>
                                                                  <Node NodeType="Assignment" LineNo="99" ColNo="5">
                                                                     <NodeId>ASSIGNMENT__16</NodeId>
                                                                     <StartCondition>
                                                                        <EQInternal>
                                                                           <NodeStateVariable>
                                                                              <NodeRef dir="sibling">COMMAND__15</NodeRef>
                                                                           </NodeStateVariable>
                                                                           <NodeStateValue>FINISHED</NodeStateValue>
                                                                        </EQInternal>
                                                                     </StartCondition>
                                                                     <NodeBody>
                                                                        <Assignment>
                                                                           <BooleanVariable>completeTurn</BooleanVariable>
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
                              <Node NodeType="Assignment" epx="LoopVariableUpdate">
                                 <NodeId>ep2cp_ForLoopUpdater</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">BLOCK__3</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Assignment>
                                       <IntegerVariable>i</IntegerVariable>
                                       <NumericRHS>
                                          <ADD LineNo="40" ColNo="31">
                                             <IntegerVariable>i</IntegerVariable>
                                             <IntegerValue>1</IntegerValue>
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
</PlexilPlan>