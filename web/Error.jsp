<%-- 
    Document   : Error
    Created on : Apr 1, 2018, 8:16:44 PM
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error=null;
    Object err=session.getAttribute("err");
    if(err!=null){
        error=(String)err;
        session.removeAttribute("err");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR</title>
    </head>
    <body>
        <%
            if(error!=null){
            
        %>
            <%=error%>
        <%
            } 
            else{
        %>
        <div style="color: red">
            REQUEST NOT FULFILLED.<br>
            SOME TECHNICAL ERROR.<br> PLEASE TRY AGAIN.<br> PLEASE CONTACT SYSTEM ENGINEER IF ISSUE PREVAILS.
        </div>
        <%
            }
        %>
        <a href=".">Go back to Homepage</a>
    </body>
</html>
