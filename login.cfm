<!-- it is out put cfdump equal console.log in js -->
<!--<cfdump var="#session#">-->
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
<cfif IsDefined("btnLogin")>
    <cfset passwordHashed = hash(form.password) />

    <cfquery name="getUser" datasource="BLOG" result="getUserResult"> 
        SELECT userName
        FROM users
        WHERE userName = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_nvarchar">
        AND password = <cfqueryparam value="#passwordHashed#" cfsqltype="cf_sql_nvarchar">
        AND status = 1
    </cfquery>

    <!--<cfdump var="#getUser#" />
    <cfoutput>#getUserResult.recordCount#</cfoutput>-->
    <!--<cfdump var="#getUserResult#" />-->
    <cfif getUserResult.recordCount eq 1>
        <!--- TODO: user is logged in --->
        <cflogin>
            <cfloginuser name="#getUser.username#" password="#passwordHashed#" roles="admin">
        </cflogin>
        <cfset session.userLogined = #form.username#>
        <!--<cfoutput>Authorized user: #getAuthUser()#</cfoutput>-->
        <cflocation url="/">
    </cfif>
</cfif>

<div class="login-content-wrapper form-wrapper">
    <h2>Login</h2>
    <form name="form" action="login.cfm" method="post">
        <div class="field-wrapper">
            <span>UserName:</span>
            <input name="username" type="text">
        </div>
        <div class="field-wrapper">
            <span>Password:</span>
            <input name="password" type="password">
        </div>
        <div class="btn-wrapper">
            <input name="btnLogin" type="submit" value="Login">
        </div>
    </form>
</div>

</body>
</html>