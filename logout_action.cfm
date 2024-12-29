<cfset structDelete(session,'userLogined') />
<cflogout> 
    <!--<cfoutput>Authorized user: #getAuthUser()#</cfoutput>-->
<cflocation url="/">