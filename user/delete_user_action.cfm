<cfquery name="DeleteUser" datasource="BLOG"> 
   UPDATE users 
    SET status = 0
    WHERE id = #URL.user_id#   
</cfquery> 
<cflocation url="/">