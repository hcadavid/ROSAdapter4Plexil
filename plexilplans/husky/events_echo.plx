<?xml version="1.0" encoding="UTF-8"?>
<PlexilPlan xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:tr="extended-plexil-translator"
            FileName="events_echo.ple">
   <GlobalDeclarations LineNo="3" ColNo="0">
      <CommandDeclaration LineNo="3" ColNo="0">
         <Name>Rotate</Name>
         <Parameter>
            <Type>Integer</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="5" ColNo="0">
         <Name>Move</Name>
         <Parameter>
            <Type>Integer</Type>
         </Parameter>
      </CommandDeclaration>
      <CommandDeclaration LineNo="7" ColNo="0">
         <Name>pprint</Name>
      </CommandDeclaration>
   </GlobalDeclarations>
   <Node NodeType="NodeList" epx="Concurrence" LineNo="20" ColNo="1">
      <NodeId>BasicTest</NodeId>
      <NodeBody>
         <NodeList>
            <Node NodeType="Command" LineNo="22" ColNo="3">
               <NodeId>LVEvent</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>LinearVelocity</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>10</IntegerValue>
                  </GT>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="23" ColNo="10">
                        <StringValue>lv updated</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
            <Node NodeType="Command" LineNo="26" ColNo="3">
               <NodeId>XEvent</NodeId>
               <StartCondition>
                  <GT>
                     <LookupOnChange>
                        <Name>
                           <StringValue>LinearVelocity</StringValue>
                        </Name>
                     </LookupOnChange>
                     <IntegerValue>20</IntegerValue>
                  </GT>
               </StartCondition>
               <NodeBody>
                  <Command>
                     <Name>
                        <StringValue>pprint</StringValue>
                     </Name>
                     <Arguments LineNo="27" ColNo="10">
                        <StringValue>x updated</StringValue>
                     </Arguments>
                  </Command>
               </NodeBody>
            </Node>
         </NodeList>
      </NodeBody>
   </Node>
</PlexilPlan>