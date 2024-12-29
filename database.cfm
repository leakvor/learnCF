<cfquery name="user" datasource="BLOG">
SELECT * FROM users

</cfquery>
<cfdump var ="#user#">