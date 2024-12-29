<!------- get all post with owner of post -------->
<cfquery name="GetAllPost" datasource="BLOG" result="GetAllPostResult">
    SELECT users.firstName, users.lastName, posts.id, posts.title, posts.description, posts.image_name, posts.created_date
    FROM users 
    INNER JOIN posts
    ON users.id = posts.user_id 
    WHERE posts.status = 1
</cfquery>
<!--<cfdump var="#GetAllPost#">-->

<div class="post-info-wrapper">
    <cfif #GetAllPostResult.RecordCount# gt 0>
        <cfoutput query="GetAllPost">
            <cfset pDate = created_date>
            <cfset postDate = DateFormat(pDate, "E, DD MMMM, YYYY")>
            <div class="each-post-content">
                <img src="image/#image_name#" alt="image post"/>
                <div class="detail post-title"><strong>#title#</strong></div>
                <div class="detail post-date-owner">
                    <span class="post-date">#postDate#</span>
                    <span class="post-owner">#lastName# #firstName#</span>
                </div>
                <div class="detail description">#description#</div>
                <div class="edit-delete-post">
                    <a href="?action=post/update_post_form&post_id=#id#">Edit</a> |
                    <a class="delete-post" href="?action=post/delete_post_action&post_id=#id#">Delete</a>
                </div>
            </div>
        </cfoutput>
    </cfif>
</div>