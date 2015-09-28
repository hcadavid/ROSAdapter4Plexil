<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="plan2.ple">
   <Node NodeType="NodeList" epx="Sequence" LineNo="4" ColNo="4">
      <NodeId>Example</NodeId>
      <InvariantCondition>
         <NOT>
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
         </NOT>
      </InvariantCondition>
      <NodeBody>
         <NodeList>
            <Node NodeType="Empty" LineNo="5" ColNo="8">
               <NodeId>NodeOne</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>Speed</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>100</IntegerValue>
                  </GT>
               </StartCondition>
            </Node>
         </NodeList>
      </NodeBody>
   </Node>
</PlexilPlan>