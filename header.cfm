 <div class="header">
    <ul class="menu" id="menuId">
        <li class="list active"><a href="/">Home</a></li>
        <!------ user logined ------>
        <cfif structKeyExists(session, "userLogined")>
            <li class="list"><a href="?action=user/list_user_info">User Info</a></li>
            <li class="list"><a href="?action=user/add_user_form">Add User</a></li>
            <li><a href="?action=post/add_post_form">Add Post</a></li> 
        </cfif>
    </ul>
    <cfif structKeyExists(session, "userLogined")>
        <div class="header-section-right">
            <span><cfoutput>Welcome: #session.userLogined#</cfoutput></span>
            <form action="logout_action.cfm" method="post" name="logoutForm">
                <input class="logout login-logout" type="submit" name="btnLogout" value="Logout">
            </form>
        </div>
    <cfelse>
        <a class="login login-logout" href="login.cfm">Login</a>
    </cfif>
</div>