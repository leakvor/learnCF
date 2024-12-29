<cfif Trim(form.title) NEQ "" && Trim(form.description) NEQ "" && Trim(form.image) NEQ "">

    <cfset imgPath = "C:\dev\workspace\blog\image">

    <!----- delete image from folder ---->
    <cfset fileDestination = "#imgPath#\#form.image_name#">
    <cfif FileExists(fileDestination)>
        <cffile action="delete" file = #fileDestination#>
    </cfif>

    <!------ upload image to folder ------>
    <cffile action = "upload" 
        fileField = "image" 
        destination = #imgPath#
        attributes = "normal"
        accept = "image/*"
        result = "uploadResult"
        nameConflict ="overwrite">
        <!--<cfoutput>#uploadResult.serverfile#</cfoutput>-->
    <!------ add post information to table posts ----->
    <cfquery name="UpdatePost" datasource="BLOG"> 
        UPDATE posts 
        SET title = <cfqueryparam value="#Trim(form.title)#" cfsqltype="cf_sql_nvarchar">, 
        description = <cfqueryparam value="#Trim(form.description)#" cfsqltype="cf_sql_nvarchar">, 
        image_name = <cfqueryparam value="#uploadResult.serverfile#" cfsqltype="cf_sql_nvarchar">
        WHERE id = #form.post_id#   
    </cfquery> 
    <cflocation url="/?action=post/list_post_info">
<cfelse>
    <!-- if user click btn update post with blank fields -->
    <cflocation url="/?action=post/update_post_form&post_id=#form.post_id#">
</cfif>