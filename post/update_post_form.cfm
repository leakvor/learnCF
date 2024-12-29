<cfquery name="getPostById" datasource="BLOG"> 
    SELECT title, description, image_name FROM posts 
    WHERE id = #URL.post_id#
</cfquery> 

<cfoutput query="getPostById"> 
    <div class="update-post-wrapper form-wrapper">
        <h2>Update Post Information</h2>
        <form action="post/update_post_action.cfm" enctype="multipart/form-data" method="post">
        <input type="Hidden" name="post_id" value="#post_id#"><br>
        <input type="hidden" name="image_name" value="#getPostById.image_name#">
            <div class="field-wrapper">
                <span>Title:</span>
                <input type="text" name="title" value="#title#"/>
            </div>
            <div class="field-wrapper">
                <span>Description:</span>
                <textarea rows = "5" cols = "40" name = "description" class="description-textarea"  placeholder="Enter details here...">#description#</textarea>
            </div>
            <div class="field-wrapper">
                <span></span>
                <img src="image/#getPostById.image_name#" class="preview-image" alt="no image"/>
            </div>
            <div class="field-wrapper">
                <span>Select Image:</span>
                <label for="image" class="custom-image-upload">
                    <img class="icon-upload" src="image/upload_icon.png"/>
                    <span>Upload Image</span>
                </label>
                <input type="file" id="image" name="image" accept="image/*">
            </div>
            <div class="btn-wrapper">
                <input name="btnUpdate" type="submit" value="Update">
            </div>
        </form>
    </div>
</cfoutput> 
