<cfquery name="UserList" datasource="BLOG" result="userResultList">
    SELECT id, firstName, lastName, userName, address
    FROM users WHERE status = 1
</cfquery>

<cfif structKeyExists(URL, "action")>
    <cfset action = URL.action />
</cfif>

 <!--<cfdump var="#session.users#">-->

<div class="list-user-wrapper form-wrapper">
    <!--<cfoutput>#UserList.RecordCount#</cfoutput>
    <cfoutput>#userResultList.RecordCount#</cfoutput>-->
    <cfif #UserList.RecordCount# eq 0>
        <div class="no-user-list">Have no records. Please click on button <strong>Add New User</strong> for adding user information.</div>
    <cfelse>
        <table class="table-list-user">
            <tr>
                <th>FirstName</th>
                <th>LastName</th>
                <th>UserName</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            <cfoutput query="UserList">
                <tr>
                    <td>#firstName#</td>
                    <td>#lastName#</td>
                    <td>#username#</td>
                    <td>#address#</td>
                    <td>
                    <a href="?action=user/update_user_form&user_id=#id#">Edit</a> | 
                    <a href="user/delete_user_action.cfm?user_id=#id#">Delete</a>
                    </td>
                </tr>
            </cfoutput>
        </table>
    </cfif>
</div>