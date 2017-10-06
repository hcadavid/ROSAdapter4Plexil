<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="test.ple">
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
   <Node NodeType="NodeList" epx="If" LineNo="23" ColNo="1">
      <NodeId>All</NodeId>
      <NodeBody>
         <NodeList>
            <Node NodeType="Empty" epx="Condition">
               <NodeId>ep2cp_IfTest</NodeId>
               <PostCondition>
                  <GT>
                     <IntegerValue>1</IntegerValue>
                     <IntegerValue>10</IntegerValue>
                  </GT>
               </PostCondition>
            </Node>
            <Node NodeType="Command" epx="Then" LineNo="23" ColNo="3">
               <NodeId>COMMAND__1</NodeId>
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
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="24" ColNo="10">
                        <StringValue>1</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
            <Node NodeType="Command" epx="Else" LineNo="25" ColNo="3">
               <NodeId>COMMAND__2</NodeId>
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
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="26" ColNo="10">
                        <StringValue>2</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
         </NodeList>
      </NodeBody>
   </Node>
</PlexilPlan>