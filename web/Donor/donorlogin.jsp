<%-- 
    Document   : donorlogin
    Created on : Apr 5, 2018, 12:19:27 AM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.POJO.Donor_Dt"%>
<%@page import="com.bloodcare.Workers.Donor_Worker"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int donor=Integer.parseInt(request.getParameter("donor"));
            //System.out.println(Integer.toString(donor));
            
            Donor_Dt d=Donor_Worker.showDonorById(donor);
            //String name=d.getDonor_id();
        %>
        <h1>DONOR LOGIN. <%=d.getDonor_name()%></h1>
    </body>
</html>
