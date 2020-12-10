#!/usr/bin/haserl

<%  echo -en "content-type: text/html\r\n\r\n"  # RF2616 Compliance %>

    <div>You have been logged out. Redirecting to home...</div>    

<script>
    var XHR = new XMLHttpRequest();
    XHR.open("GET", "/cgi-bin/system-overview.has", true, "no user", "no password");
    XHR.send();

    setTimeout(function () {
/*        window.location.href = "/"; */
        window.location.href = "/cgi-bin/system-overview.has";
    }, 2000);
</script>
