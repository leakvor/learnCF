<div class="add-post-wrapper form-wrapper">
    <h2>Add New Post</h2>
    <form action="post/add_post_action.cfm" enctype="multipart/form-data" method="post">
        <div class="field-wrapper">
            <span>Title:</span>
            <input type="text" name="title"/>
        </div>
        <div class="field-wrapper">
            <span>Description:</span>
            <textarea rows = "5" cols = "40" name = "description" class="description-textarea" placeholder="Enter details here..."></textarea>
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
            <input name="btnPost" type="submit" value="Save">
        </div>
    </form>
</div>