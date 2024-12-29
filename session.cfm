<cfif structKeyExists(URL, "test")>
    <cfset session.test = URL.test>
</cfif>

<cfif structKeyExists(URL, "delete")>
    <cfset structDelete(session, "test")>
</cfif>

<cfif structKeyExists(session, "test")>
    <cfoutput>#session.test#</cfoutput>
<cfelse>
    test key not foundin session
</cfif>

<a href="session.cfm">Reload</a> - 
<a href="session.cfm?test=ok">Set session</a> - 
<a href="session.cfm?delete">Remove session</a> 