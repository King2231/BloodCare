<%-- 
    Document   : hospboard
    Created on : Apr 2, 2018, 12:51:25 AM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.POJO.Hospital_Dt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            Hospital_Dt hd=null;
            Object o=session.getAttribute("hospital");
            if(o!=null){
                hd=(Hospital_Dt)o;
            }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=hd.getHosp_name()%></title>
    </head>
    <body>
        <h1><%=hd.getHosp_name()%></h1>
        
        <a href="newrequest">Request Units</a>
    </body>
</html>
