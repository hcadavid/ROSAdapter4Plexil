<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="husky-e.ple">
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
   <Node NodeType="NodeList" epx="Sequence" LineNo="19" ColNo="1">
      <NodeId>BasicTest</NodeId>
      <InvariantCondition>
         <NOT>
            <AND>
               <EQInternal>
                  <NodeOutcomeVariable>
                     <NodeRef dir="child">XPosUpdateHandler</NodeRef>
                  </NodeOutcomeVariable>
                  <NodeOutcomeValue>FAILURE</NodeOutcomeValue>
               </EQInternal>
               <EQInternal>
                  <NodeStateVariable>
                     <NodeRef dir="child">XPosUpdateHandler</NodeRef>
                  </NodeStateVariable>
                  <NodeStateValue>FINISHED</NodeStateValue>
               </EQInternal>
            </AND>
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="Command" LineNo="20" ColNo="2">
               <NodeId>XPosUpdateHandler</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>XPosition</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>0</IntegerValue>
                  </GT>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="21" ColNo="9">
                        <StringValue>Event received</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
         </NodeList>
      </NodeBody>
   </Node>
</PlexilPlan>