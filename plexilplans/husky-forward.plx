<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="plexilplans/husky-forward.ple">
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
   <Node NodeType="NodeList" epx="Sequence" LineNo="20" ColNo="1">
      <NodeId>All</NodeId>
      <VariableDeclarations>
         <DeclareVariable LineNo="19" ColNo="1">
            <Name>startingYaw</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="20" ColNo="1">
            <Name>finalYPos</Name>
            <Type>Real</Type>
         </DeclareVariable>
         <DeclareVariable LineNo="21" ColNo="1">
            <Name>finalXPos</Name>
            <Type>Real</Type>
         </DeclareVariable>
      </VariableDeclarations>
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
            <Node NodeType="NodeList" epx="Sequence" LineNo="24" ColNo="1">
               <NodeId>Sequence__0</NodeId>
               <InvariantCondition>
                  <NOT>
                     <OR>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">ForwardHor</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">ForwardHor</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">UpdateCoord</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">UpdateCoord</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">UTurn</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">UTurn</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">ForwardVer</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">ForwardVer</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                        <AND>
                           <EQInternal>
                              <NodeOutcomeVariable>
                                 <NodeRef dir="child">EndMessage</NodeRef>
                              </NodeOutcomeVariable>
                              <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                           </EQInternal>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="child">EndMessage</NodeRef>
                              </NodeStateVariable>
                              <NodeStateValue>FINISHED</NodeStateValue>
                           </EQInternal>
                        </AND>
                     </OR>
                  </NOT>
               </InvariantCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="Command" LineNo="28" ColNo="3">
                        <NodeId>ForwardHor</NodeId>
                        <StartCondition>
                           <LT>
                              <LookupOnChange>
                                 <Name>
                                    <StringValue>XPosition</StringValue>
                                 </Name>
                              </LookupOnChange>
                              <IntegerValue>6</IntegerValue>
                           </LT>
                        </StartCondition>
                        <RepeatCondition>
                           <LT>
                              <LookupOnChange>
                                 <Name>
                                    <StringValue>XPosition</StringValue>
                                 </Name>
                              </LookupOnChange>
                              <IntegerValue>6</IntegerValue>
                           </LT>
                        </RepeatCondition>
                        <NodeBody>
                           <Command>
                              <Name>
                                 <StringValue>RequestLinearVelocity</StringValue>
                              </Name>
                              <Arguments LineNo="29" ColNo="25">
                                 <RealValue>1</RealValue>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="34" ColNo="3">
                        <NodeId>UpdateCoord</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">ForwardHor</NodeRef>
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
                              <Node NodeType="Assignment" LineNo="34" ColNo="3">
                                 <NodeId>ASSIGNMENT__2</NodeId>
                                 <NodeBody>
                                    <Assignment>
                                       <RealVariable>finalXPos</RealVariable>
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
                              <Node NodeType="Assignment" LineNo="35" ColNo="3">
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
                                       <RealVariable>finalYPos</RealVariable>
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
                              <Node NodeType="Assignment" LineNo="36" ColNo="3">
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
                           </NodeList>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="40" ColNo="3">
                        <NodeId>UTurn</NodeId>
                        <StartCondition>
                           <AND>
                              <EQInternal>
                                 <NodeStateVariable>
                                    <NodeRef dir="sibling">UpdateCoord</NodeRef>
                                 </NodeStateVariable>
                                 <NodeStateValue>FINISHED</NodeStateValue>
                              </EQInternal>
                              <NOT>
                                 <AND>
                                    <GT>
                                       <LookupOnChange>
                                          <Name>
                                             <StringValue>Yaw</StringValue>
                                          </Name>
                                       </LookupOnChange>
                                       <ADD LineNo="40" ColNo="37">
                                          <RealVariable>startingYaw</RealVariable>
                                          <RealValue>1.5</RealValue>
                                       </ADD>
                                    </GT>
                                    <LT>
                                       <LookupOnChange>
                                          <Name>
                                             <StringValue>Yaw</StringValue>
                                          </Name>
                                       </LookupOnChange>
                                       <ADD LineNo="40" ColNo="72">
                                          <RealVariable>startingYaw</RealVariable>
                                          <RealValue>1.56</RealValue>
                                       </ADD>
                                    </LT>
                                 </AND>
                              </NOT>
                           </AND>
                        </StartCondition>
                        <RepeatCondition>
                           <NOT>
                              <AND>
                                 <GT>
                                    <LookupOnChange>
                                       <Name>
                                          <StringValue>Yaw</StringValue>
                                       </Name>
                                    </LookupOnChange>
                                    <ADD LineNo="41" ColNo="38">
                                       <RealVariable>startingYaw</RealVariable>
                                       <RealValue>1.5</RealValue>
                                    </ADD>
                                 </GT>
                                 <LT>
                                    <LookupOnChange>
                                       <Name>
                                          <StringValue>Yaw</StringValue>
                                       </Name>
                                    </LookupOnChange>
                                    <ADD LineNo="41" ColNo="73">
                                       <RealVariable>startingYaw</RealVariable>
                                       <RealValue>1.56</RealValue>
                                    </ADD>
                                 </LT>
                              </AND>
                           </NOT>
                        </RepeatCondition>
                        <InvariantCondition>
                           <NOT>
                              <OR>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__5</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__5</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__6</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__6</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Command" LineNo="41" ColNo="3">
                                 <NodeId>COMMAND__5</NodeId>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="42" ColNo="10">
                                          <StringValue>Yaw:</StringValue>
                                          <LookupNow>
                                             <Name>
                                                <StringValue>Yaw</StringValue>
                                             </Name>
                                          </LookupNow>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Command" LineNo="42" ColNo="3">
                                 <NodeId>COMMAND__6</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">COMMAND__5</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>RequestAngularVelocity</StringValue>
                                       </Name>
                                       <Arguments LineNo="43" ColNo="26">
                                          <RealValue>0.2</RealValue>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                           </NodeList>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="49" ColNo="3">
                        <NodeId>ForwardVer</NodeId>
                        <StartCondition>
                           <AND>
                              <EQInternal>
                                 <NodeStateVariable>
                                    <NodeRef dir="sibling">UTurn</NodeRef>
                                 </NodeStateVariable>
                                 <NodeStateValue>FINISHED</NodeStateValue>
                              </EQInternal>
                              <LT>
                                 <LookupOnChange>
                                    <Name>
                                       <StringValue>YPosition</StringValue>
                                    </Name>
                                 </LookupOnChange>
                                 <ADD LineNo="48" ColNo="38">
                                    <RealVariable>finalYPos</RealVariable>
                                    <IntegerValue>6</IntegerValue>
                                 </ADD>
                              </LT>
                           </AND>
                        </StartCondition>
                        <RepeatCondition>
                           <LT>
                              <LookupOnChange>
                                 <Name>
                                    <StringValue>YPosition</StringValue>
                                 </Name>
                              </LookupOnChange>
                              <ADD LineNo="49" ColNo="39">
                                 <RealVariable>finalYPos</RealVariable>
                                 <IntegerValue>6</IntegerValue>
                              </ADD>
                           </LT>
                        </RepeatCondition>
                        <NodeBody>
                           <Command>
                              <Name>
                                 <StringValue>RequestLinearVelocity</StringValue>
                              </Name>
                              <Arguments LineNo="50" ColNo="25">
                                 <RealValue>1</RealValue>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="55" ColNo="3">
                        <NodeId>EndMessage</NodeId>
                        <StartCondition>
                           <EQInternal>
                              <NodeStateVariable>
                                 <NodeRef dir="sibling">ForwardVer</NodeRef>
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
                              <Node NodeType="Command" LineNo="54" ColNo="3">
                                 <NodeId>COMMAND__8</NodeId>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="55" ColNo="10">
                                          <StringValue>done!</StringValue>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Command" LineNo="55" ColNo="3">
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
                                          <StringValue>RequestLinearVelocity</StringValue>
                                       </Name>
                                       <Arguments LineNo="56" ColNo="25">
                                          <RealValue>0</RealValue>
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