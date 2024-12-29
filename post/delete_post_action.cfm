<!------- select image name from table posts ------->
<cfquery name="GetImageById" datasource="BLOG">
    SELECT image_name FROM posts
    WHERE id = #URL.post_id#
</cfquery>

<!----- delete image from folder ---->
<cfset imgPath = "C:\dev\workspace\blog\image">
<cfset fileDestination = "#imgPath#\#GetImageById.image_name#">

<cfif FileExists(fileDestination)>
    <cffile action="delete" file = #fileDestination#>
</cfif>

<!------ delete post information from table posts ------>
<cfquery name="DeletePost" datasource="BLOG"> 
    DELETE FROM posts
    WHERE id = #URL.post_id#   
</cfquery> 
<cflocation url="/">