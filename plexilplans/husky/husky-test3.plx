<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="husky-test3.ple">
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
   <Node NodeType="NodeList" epx="Sequence" LineNo="19" ColNo="4">
      <NodeId>All</NodeId>
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
      <EndCondition>
         <EQBoolean>
            <LookupOnChange>
               <Name>
                  <StringValue>abortPlan</StringValue>
               </Name>
            </LookupOnChange>
            <BooleanValue>true</BooleanValue>
         </EQBoolean>
      </EndCondition>
      <InvariantCondition>
         <NOT>
            <OR>
               <AND>
                  <EQInternal>
                     <NodeOutcomeVariable>
                        <NodeRef dir="child">COMMAND__0</NodeRef>
                     </NodeOutcomeVariable>
                     <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                  </EQInternal>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="child">COMMAND__0</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </AND>
               <AND>
                  <EQInternal>
                     <NodeOutcomeVariable>
                        <NodeRef dir="child">Concurrence__1</NodeRef>
                     </NodeOutcomeVariable>
                     <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                  </EQInternal>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="child">Concurrence__1</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </AND>
            </OR>
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="Command" LineNo="21" ColNo="4">
               <NodeId>COMMAND__0</NodeId>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="22" ColNo="11">
                        <StringValue>Starting</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
            <Node NodeType="NodeList" epx="Concurrence" LineNo="24" ColNo="4">
               <NodeId>Concurrence__1</NodeId>
               <VariableDeclarations>
                  <DeclareVariable LineNo="24" ColNo="8">
                     <Name>abortPlan</Name>
                     <Type>Boolean</Type>
                     <InitialValue>
                        <BooleanValue>false</BooleanValue>
                     </InitialValue>
                  </DeclareVariable>
               </VariableDeclarations>
               <StartCondition>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="sibling">COMMAND__0</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </StartCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="28" ColNo="12">
                        <NodeId>Stop</NodeId>
                        <StartCondition>
                           <EQNumeric>
                              <LookupOnChange>
                                 <Name>
                                    <StringValue>SafetyWarning</StringValue>
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
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Command" LineNo="28" ColNo="12">
                                 <NodeId>COMMAND__2</NodeId>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="29" ColNo="19">
                                          <StringValue>Aborting!</StringValue>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Assignment" LineNo="30" ColNo="12">
                                 <NodeId>ASSIGNMENT__3</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">COMMAND__2</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Assignment>
                                       <BooleanVariable>abortPlan</BooleanVariable>
                                       <BooleanRHS>
                                          <BooleanValue>true</BooleanValue>
                                       </BooleanRHS>
                                    </Assignment>
                                 </NodeBody>
                              </Node>
                           </NodeList>
                        </NodeBody>
                     </Node>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="35" ColNo="12">
                        <NodeId>XPTest</NodeId>
                        <VariableDeclarations>
                           <DeclareVariable LineNo="34" ColNo="12">
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
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Assignment" LineNo="38" ColNo="12">
                                 <NodeId>ASSIGNMENT__4</NodeId>
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
                              <Node NodeType="Command" LineNo="38" ColNo="12">
                                 <NodeId>COMMAND__5</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">ASSIGNMENT__4</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="39" ColNo="19">
                                          <StringValue>xp-ok:</StringValue>
                                          <RealVariable>curval</RealVariable>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                           </NodeList>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="45" ColNo="16">
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
                              <Arguments LineNo="46" ColNo="23">
                                 <StringValue>yp-ok</StringValue>
                              </Arguments>
                           </Command>
                        </NodeBody>
                     </Node>
                     <Node NodeType="Command" LineNo="51" ColNo="16">
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
                              <Arguments LineNo="52" ColNo="23">
                                 <StringValue>yaw-ok</StringValue>
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
</PlexilPlan>