<cfquery name="getUser" datasource="BLOG"> 
    SELECT firstName, lastName, userName, address 
    FROM users 
    WHERE id = #URL.user_id# 
</cfquery> 

<cfoutput query="getUser"> 
    <div class="update-user-wrapper form-wrapper">
        <h2>Update User Information</h2>
        <form action="user/update_user_action.cfm" method="post">
        <input type="Hidden" name="user_id" value="#user_id#"><br> 
            <div class="field-wrapper">
                <span>First Name:</span>
                <input type="text" name="firstName" value="#firstName#"/>
            </div>
            <div class="field-wrapper">
                <span>Last Name:</span>
                <input type="text" name="lastName" value="#lastName#">
            </div>
            <div class="field-wrapper">
                <span>Address:</span>
                <input type="text" name="address" value="#address#">
            </div>
            <div class="field-wrapper">
                <span>User Name:</span>
                <input type="text" name="userName" value="#userName#">
            </div>
            <div class="field-wrapper">
                <span>Password:</span>
                <input type="password" name="password" value="">
            </div>
            <div class="btn-wrapper">
                <input name="btnUpdate" type="submit" value="Update User">
            </div>
        </form>
    </div>
</cfoutput>
