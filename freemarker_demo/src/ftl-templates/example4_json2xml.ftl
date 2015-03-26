<#-- comment
<#list employees as emp>
	${emp.name}
</#list>
-->

<?xml version="1.0" encoding="UTF-8"?>
<#list employees as emp>
	<name>${emp.name}</name>
</#list>