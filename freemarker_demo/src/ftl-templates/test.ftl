<#assign x = "plain">
1. ${x}  <#-- we see the plain var. here -->
<@test/>
6. ${x}  <#-- the value of plain var. was not changed -->
<#list ["loop"] as x>
    7. ${x}  <#-- now the loop var. hides the plain var. -->
    <#assign x = "plain2"> <#-- replace the plain var, hiding does not mater here -->
    8. ${x}  <#-- it still hides the plain var. -->
</#list>
9. ${x}  <#-- the new value of plain var. -->

<#macro test>
  2. ${x}  <#-- we still see the plain var. here -->
  <#local x = "local">
  3. ${x}  <#-- now the local var. hides it -->
  <#list ["loop"] as x>
    4. ${x}  <#-- now the loop var. hides the local var. -->
  </#list>
  5. ${x}  <#-- now we see the local var. again -->
</#macro>  