<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="husky-rotating.ple">
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
      <NodeId>Rotate</NodeId>
      <VariableDeclarations>
         <DeclareVariable LineNo="19" ColNo="1">
            <Name>completeTurn</Name>
            <Type>Boolean</Type>
            <InitialValue>
               <BooleanValue>false</BooleanValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="20" ColNo="1">
            <Name>PI</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>3.1416</RealValue>
            </InitialValue>
         </DeclareVariable>
         <DeclareVariable LineNo="22" ColNo="1">
            <Name>initialYaw</Name>
            <Type>Real</Type>
            <InitialValue>
               <RealValue>0</RealValue>
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
            <Node NodeType="Assignment" LineNo="27" ColNo="1">
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
            <Node NodeType="NodeList" epx="Concurrence" LineNo="29" ColNo="1">
               <NodeId>Concurrence__1</NodeId>
               <StartCondition>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="sibling">ASSIGNMENT__0</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </StartCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="NodeList" epx="Sequence" LineNo="33" ColNo="3">
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
                                 <AND>
                                    <EQInternal>
                                       <NodeOutcomeVariable>
                                          <NodeRef dir="child">COMMAND__4</NodeRef>
                                       </NodeOutcomeVariable>
                                       <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                                    </EQInternal>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="child">COMMAND__4</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </AND>
                              </OR>
                           </NOT>
                        </InvariantCondition>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="Command" LineNo="34" ColNo="3">
                                 <NodeId>COMMAND__2</NodeId>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>RequestAngularVelocity</StringValue>
                                       </Name>
                                       <Arguments LineNo="35" ColNo="26">
                                          <RealValue>1</RealValue>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Command" LineNo="36" ColNo="3">
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
                                       <Arguments LineNo="37" ColNo="10">
                                          <StringValue>Angle </StringValue>
                                          <LookupNow>
                                             <Name>
                                                <StringValue>Yaw</StringValue>
                                             </Name>
                                          </LookupNow>
                                       </Arguments>
                                    </Command>
                                 </NodeBody>
                              </Node>
                              <Node NodeType="Command" LineNo="37" ColNo="3">
                                 <NodeId>COMMAND__4</NodeId>
                                 <StartCondition>
                                    <EQInternal>
                                       <NodeStateVariable>
                                          <NodeRef dir="sibling">COMMAND__3</NodeRef>
                                       </NodeStateVariable>
                                       <NodeStateValue>FINISHED</NodeStateValue>
                                    </EQInternal>
                                 </StartCondition>
                                 <NodeBody>
                                    <Command>
                                       <Name>
                                          <StringValue>pprint</StringValue>
                                       </Name>
                                       <Arguments LineNo="38" ColNo="10">
                                          <StringValue>Diff </StringValue>
                                          <ABS LineNo="38" ColNo="18">
                                             <SUB LineNo="38" ColNo="32">
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
                     <Node NodeType="Assignment" LineNo="48" ColNo="3">
                        <NodeId>CompleteTurnCheck</NodeId>
                        <StartCondition>
                           <OR>
                              <AND>
                                 <LE>
                                    <ABS LineNo="45" ColNo="11">
                                       <SUB LineNo="45" ColNo="25">
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
                                    <ABS LineNo="45" ColNo="48">
                                       <SUB LineNo="45" ColNo="62">
                                          <RealVariable>initialYaw</RealVariable>
                                          <LookupOnChange>
                                             <Name>
                                                <StringValue>Yaw</StringValue>
                                             </Name>
                                          </LookupOnChange>
                                       </SUB>
                                    </ABS>
                                    <DIV LineNo="45" ColNo="79">
                                       <RealVariable>PI</RealVariable>
                                       <IntegerValue>2</IntegerValue>
                                    </DIV>
                                 </GE>
                              </AND>
                              <AND>
                                 <GT>
                                    <ABS LineNo="46" ColNo="8">
                                       <SUB LineNo="46" ColNo="22">
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
                                    <SUB LineNo="46" ColNo="49">
                                       <MUL LineNo="46" ColNo="46">
                                          <IntegerValue>2</IntegerValue>
                                          <RealVariable>PI</RealVariable>
                                       </MUL>
                                       <ABS LineNo="46" ColNo="50">
                                          <SUB LineNo="46" ColNo="64">
                                             <RealVariable>initialYaw</RealVariable>
                                             <LookupOnChange>
                                                <Name>
                                                   <StringValue>Yaw</StringValue>
                                                </Name>
                                             </LookupOnChange>
                                          </SUB>
                                       </ABS>
                                    </SUB>
                                    <DIV LineNo="46" ColNo="82">
                                       <RealVariable>PI</RealVariable>
                                       <IntegerValue>2</IntegerValue>
                                    </DIV>
                                 </GE>
                              </AND>
                           </OR>
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
</PlexilPlan>