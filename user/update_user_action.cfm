<cfif Trim(form.firstName) NEQ "" && Trim(form.lastName) NEQ "" && Trim(form.username) NEQ "" && Trim(form.password) NEQ "">
    <cfset passwordHashed = hash(form.password) />
    <cfquery name="UpdateUser" datasource="BLOG"> 
        UPDATE users 
        SET firstName = <cfqueryparam value="#Trim(form.firstName)#" cfsqltype="cf_sql_nvarchar">, 
        lastName = <cfqueryparam value="#Trim(form.lastName)#" cfsqltype="cf_sql_nvarchar">, 
        userName = <cfqueryparam value="#Trim(form.username)#" cfsqltype="cf_sql_nvarchar">,
        address = <cfqueryparam value="#Trim(form.address)#" cfsqltype="cf_sql_nvarchar">,
        password = <cfqueryparam value="#passwordHashed#" cfsqltype="cf_sql_nvarchar">
        WHERE id = #form.user_id#   
    </cfquery> 
    <cflocation url="/?action=user/list_user_info">
<cfelse>
    <cflocation url="/?action=user/update_user_form">
</cfif>