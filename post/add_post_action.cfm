<!------- get current login user id ------->
<cfif structKeyExists(session, "userLogined")>
    <cfquery name="GetUserId" datasource="BLOG"> 
        SELECT id FROM users
        WHERE userName='#session.userLogined#'
    </cfquery> 
</cfif>

<!--------- upload image to store with destination path --------->
<!------ fileField="image" refer to name="image" form type = file for name we can set as what as we want ------->

<cfif IsDefined("form.btnPost")>
    <cfif #GetApplicationMetaData().name# eq "BLOG">
        <!--<cfoutput>#GetApplicationMetaData().name#</cfoutput>-->
        <cfif Trim(form.title) NEQ "" && Trim(form.description) NEQ "" && Trim(form.image) NEQ "">
            <cfif IsDefined("form.image")>
                <cfset imgDestination = "C:\dev\workspace\blog\image">
                <cffile action = "upload" 
                fileField = "image" 
                destination = #imgDestination#
                attributes = "normal"
                accept = "image/*"
                result = "uploadResult"
                nameConflict ="overwrite">
                <!--<cfoutput>#uploadResult.serverfile#</cfoutput>-->
            </cfif>

            <cfquery name="AddPost" datasource="BLOG">
                INSERT INTO posts (user_id, title, description, image_name) VALUES (#GetUserId.id#, '#Trim(form.title)#', '#Trim(form.description)#',  '#uploadResult.serverfile#')
            </cfquery>
            <cflocation url="/" >
        <cfelse>
            <!-- still show add user form if form empty -->
            <cflocation url="/?action=post/add_post_form">
        </cfif>
    </cfif>
</cfif>