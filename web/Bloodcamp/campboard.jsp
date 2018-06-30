<%-- 
    Document   : campboard
    Created on : Apr 2, 2018, 12:21:39 AM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.POJO.Bloodcamp_Dt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            Bloodcamp_Dt bdc=null;
            Object o=session.getAttribute("camp");
            if(o!=null){
                bdc=(Bloodcamp_Dt)o;
            }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=bdc.getCamp_name()%></title>
    </head>
    <body>
        <h1><%=bdc.getCamp_name()%></h1>    
        <a href="newdonor">New Donor</a>
        
    </body>
</html>
