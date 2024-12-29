<!------ add new user ------>
<cfset passwordHashed = hash(form.password) />
<cfif IsDefined("form.btnRegister")>
    <cfif #GetApplicationMetaData().name# eq "BLOG">
        <!--<cfoutput>#GetApplicationMetaData().name#</cfoutput>-->
        <cfif Trim(form.firstName) NEQ "" && Trim(form.lastName) NEQ "" && Trim(form.username) NEQ "" && Trim(form.password) NEQ "">
            <cfquery name="AddUser" datasource="BLOG">
                INSERT INTO users (firstName, lastName, userName, address, password) VALUES ('#Trim(form.firstName)#', '#Trim(form.lastName)#',  '#Trim(form.username)#', '#Trim(form.address)#', '#passwordHashed#')
            </cfquery>
            <cflocation url="/" >
        <cfelse>
            <!-- still show add user form if form empty -->
            <cflocation url="/?action=user/add_user_form">
        </cfif>
    </cfif>
</cfif>