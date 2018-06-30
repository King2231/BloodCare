<%-- 
    Document   : newdonor
    Created on : Apr 2, 2018, 9:13:23 AM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.POJO.Bloodbank_Dt"%>
<%@page import="com.bloodcare.POJO.Bloodcamp_Dt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Bloodcamp_Dt bcd=null;
        Bloodbank_Dt bdd=null;
        
        Object camp=session.getAttribute("camp");
        Object bank=session.getAttribute("bank");
        if(camp!=null)
            bcd=(Bloodcamp_Dt)camp;
        else{
            if(bank!=null){
                bdd=(Bloodbank_Dt)bank;
            }
            else{
                session.setAttribute("err", "Please Login Before You Continue");
                response.sendRedirect("camplogin");
            }
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Request</title>
    </head>
    <body>
        <form action="donoraction" method="post">    
            <input type="text" name="dname" required placeholder="Enter Donor Name"><br>
            <input type="text" name="dcity" required placeholder="Enter Donor City"><br>
            <input type="text" name="dphone" required placeholder="Enter Donor Phone"><br>
            <select name="dgroup">
                <option value="apos">A positive</option>
                <option value="aneg">A Negative</option>
                <option value="bpos">B positive</option>
                <option value="bneg">B negative</option>
                <option value="abpos">AB positive</option>
                <option value="abneg">AB negative</option>
                <option value="opos">O positive</option>
                <option value="oneg">O negative</option>
            </select><br>
            <input type="email" name="dmail" required placeholder="Enter Email"><br>
            <input type="submit" name="submit" value="add">
        </form>
    </body>
</html>
