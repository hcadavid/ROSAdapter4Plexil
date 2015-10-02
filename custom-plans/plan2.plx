<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="plan2.ple">
   <GlobalDeclarations LineNo="2" ColNo="0">
      <CommandDeclaration LineNo="2" ColNo="0">
         <Name>TakePicture</Name>
      </CommandDeclaration>
      <CommandDeclaration LineNo="3" ColNo="0">
         <Name>Move</Name>
         <Parameter>
            <Type>Integer</Type>
         </Parameter>
      </CommandDeclaration>
   </GlobalDeclarations>
   <Node NodeType="NodeList" epx="Sequence" LineNo="6" ColNo="8">
      <NodeId>Example</NodeId>
      <VariableDeclarations>
         <DeclareVariable LineNo="5" ColNo="8">
            <Name>x</Name>
            <Type>Integer</Type>
            <InitialValue>
               <IntegerValue>0</IntegerValue>
            </InitialValue>
         </DeclareVariable>
      </VariableDeclarations>
      <InvariantCondition>
         <NOT>
            <AND>
               <EQInternal>
                  <NodeOutcomeVariable>
                     <NodeRef dir="child">NodeTwo</NodeRef>
                  </NodeOutcomeVariable>
                  <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
               </EQInternal>
               <EQInternal>
                  <NodeStateVariable>
                     <NodeRef dir="child">NodeTwo</NodeRef>
                  </NodeStateVariable>
                  <NodeStateValue>FINISHED</NodeStateValue>
               </EQInternal>
            </AND>
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="NodeList" epx="Sequence" LineNo="9" ColNo="12">
               <NodeId>NodeTwo</NodeId>
               <StartCondition>
                  <EQNumeric>
                     <LookupOnChange>
                        <Name>
                           <StringValue>WheelStuck</StringValue>
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
                              <NodeRef dir="child">SynchronousCommand__0</NodeRef>
                           </NodeOutcomeVariable>
                           <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                        </EQInternal>
                        <EQInternal>
                           <NodeStateVariable>
                              <NodeRef dir="child">SynchronousCommand__0</NodeRef>
                           </NodeStateVariable>
                           <NodeStateValue>FINISHED</NodeStateValue>
                        </EQInternal>
                     </AND>
                  </NOT>
               </InvariantCondition>
               <NodeBody>
                  <NodeList>
                     <Node NodeType="NodeList" epx="SynchronousCommand" LineNo="10" ColNo="12">
                        <NodeId>SynchronousCommand__0</NodeId>
                        <NodeBody>
                           <NodeList>
                              <Node NodeType="NodeList" epx="aux">
                                 <NodeId>ep2cp_SynchronousCommandAux</NodeId>
                                 <VariableDeclarations>
                                    <DeclareVariable>
                                       <Name>ep2cp_return</Name>
                                       <Type>Integer</Type>
                                    </DeclareVariable>
                                 </VariableDeclarations>
                                 <NodeBody>
                                    <NodeList>
                                       <Node NodeType="Command" epx="aux">
                                          <NodeId>ep2cp_SynchronousCommandCommand</NodeId>
                                          <EndCondition>
                                             <IsKnown>
                                                <IntegerVariable>ep2cp_return</IntegerVariable>
                                             </IsKnown>
                                          </EndCondition>
                                          <NodeBody>
                                             <Command>
                                                <IntegerVariable>ep2cp_return</IntegerVariable>
                                                <Name>
                                                   <StringValue>Move</StringValue>
                                                </Name>
                                                <Arguments LineNo="10" ColNo="38">
                                                   <IntegerValue>1</IntegerValue>
                                                </Arguments>
                                             </Command>
                                          </NodeBody>
                                       </Node>
                                       <Node NodeType="Assignment" epx="aux">
                                          <NodeId>ep2cp_SynchronousCommandAssignment</NodeId>
                                          <StartCondition>
                                             <EQInternal>
                                                <NodeStateVariable>
                                                   <NodeRef dir="sibling">ep2cp_SynchronousCommandCommand</NodeRef>
                                                </NodeStateVariable>
                                                <NodeStateValue>FINISHED</NodeStateValue>
                                             </EQInternal>
                                          </StartCondition>
                                          <NodeBody>
                                             <Assignment>
                                                <IntegerVariable>x</IntegerVariable>
                                                <NumericRHS>
                                                   <IntegerVariable>ep2cp_return</IntegerVariable>
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
         </NodeList>
      </NodeBody>
   </Node>
</PlexilPlan>