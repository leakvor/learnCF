<cfcomponent output="false">

  <cfscript>
    this.name = "BLOG";
    this.loginStorage = "session";
    this.sessionManagement = true;
    this.setClientCookies = true;
    this.setDomainCookies = false;
    this.sessionTimeOut = createTimeSpan(0,1,30,0);
    this.applicationTimeOut = createTimeSpan(180,0,0,0);
  </cfscript>

  <cffunction name="onSessionStart">
    <cfscript>
    session.started = now();
    session.isExpiredPassword = false;
    session.users = [];
    </cfscript>
  </cffunction>

  <cffunction name="onRequestStart">
    <cfscript>
    if (structKeyExists(url, "reset")) {
        applicationStop();
    }
    </cfscript>
  </cffunction>
  </cfcomponent>