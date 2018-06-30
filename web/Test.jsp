<%-- 
    Document   : Test
    Created on : Apr 4, 2018, 9:49:47 PM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.Workers.MailWorker"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String body="Hi, We at BloodCare, with immense pleasure welcome you to our donor community.\n"
                                    + "You can please generate your credentials and get in touch with us to stay updated about our activites."
                                    + "Also you can just provide your username and escape the registration process in any of our associated blood donation camps."
                                    + "<form action=\"http://localhost:8084/Bloodcare/donorlogin\" method=\"post\"><input type=\"hidden\" name=\"donor\" value=\"1\">"
                                    + "<button type=\"submit\" name=\"submit\" value=\"update\">Set Credentials Here</button></form>";
                              
        MailWorker.sendHTMLMail("rajputravi701@gmail.com", body, "TESTMAIL");
        %>
    </body>
</html>
