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
   <Node NodeType="NodeList" epx="Sequence" LineNo="8" ColNo="8">
      <NodeId>Example</NodeId>
      <InvariantCondition>
         <NOT>
            <OR>
               <AND>
                  <EQInternal>
                     <NodeOutcomeVariable>
                        <NodeRef dir="child">NodeOne</NodeRef>
                     </NodeOutcomeVariable>
                     <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
                  </EQInternal>
                  <EQInternal>
                     <NodeStateVariable>
                        <NodeRef dir="child">NodeOne</NodeRef>
                     </NodeStateVariable>
                     <NodeStateValue>FINISHED</NodeStateValue>
                  </EQInternal>
               </AND>
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
            </OR>
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="Command" LineNo="9" ColNo="12">
               <NodeId>NodeOne</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>Temperature</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>100</IntegerValue>
                  </GT>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>TakePicture</StringValue>
                     </Name>
                  </Command>
               </NodeBody>
            </Node>
            <Node NodeType="Command" LineNo="13" ColNo="12">
               <NodeId>NodeTwo</NodeId>
               <StartCondition>
                  <AND>
                     <EQInternal>
                        <NodeStateVariable>
                           <NodeRef dir="sibling">NodeOne</NodeRef>
                        </NodeStateVariable>
                        <NodeStateValue>FINISHED</NodeStateValue>
                     </EQInternal>
                     <GT>
                        <LookupOnChange>
                           <Name>
                              <StringValue>Speed</StringValue>
                           </Name>
                        </LookupOnChange>
                        <IntegerValue>100</IntegerValue>
                     </GT>
                  </AND>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>Move</StringValue>
                     </Name>
                     <Arguments LineNo="14" ColNo="17">
                        <IntegerValue>1</IntegerValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
         </NodeList>
      </NodeBody>
   </Node>
</PlexilPlan>