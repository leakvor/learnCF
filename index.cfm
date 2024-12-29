<cfif structKeyExists(URL, "action")>
    <cfset action = URL.action />
    <cfelse>
    <cfset action = "post.all" />
</cfif>

<!DOCTYPE html>
<html>
<head>
<title>Fruit Advantages</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
    <cfif IsUserLoggedIn() eq "No">
        <cflocation url="login.cfm">
    </cfif>
    <cfinclude template="header.cfm">
    <div class="container">
        <cfif fileExists(expandPath(action & ".cfm"))>
            <cfinclude template="#action#.cfm">
        <cfelse>
            <cfinclude template="post/list_post_info.cfm">
        </cfif>
    </div>
    <cfinclude template="footer.cfm" />
</body>
</html>