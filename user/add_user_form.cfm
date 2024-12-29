<div class="add-user-wrapper form-wrapper">
    <h2>Add New User</h2>
    <form action="user/add_user_action.cfm" method="post">
        <div class="field-wrapper">
            <span>First Name:</span>
            <input type="text" name="firstName"/>
        </div>
        <div class="field-wrapper">
            <span>Last Name:</span>
            <input type="text" name="lastName"/>
        </div>
        <div class="field-wrapper">
            <span>Address:</span>
            <input type="text" name="address"/>
        </div>
        <div class="field-wrapper">
            <span>User Name:</span>
            <input type="text" name="username"/>
        </div>
        <div class="field-wrapper">
            <span>Password:</span>
            <input type="password" name="password"/>
        </div>
        <div class="btn-wrapper">
            <input name="btnRegister" type="submit" value="Register">
        </div>
    </form>
</div>