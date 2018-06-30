<%-- 
    Document   : newrequest
    Created on : Apr 3, 2018, 10:50:43 PM
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <h1>
                Blood Request form
            </h1>
        </center>
        <form action="requestaction" method="post">    
            <input type="text" name="rpatient" required placeholder="Enter Patient Name"><br>
            <select name="rgroup">
                <option value="apos">A positive</option>
                <option value="aneg">A Negative</option>
                <option value="bpos">B positive</option>
                <option value="bneg">B negative</option>
                <option value="abpos">AB positive</option>
                <option value="abneg">AB negative</option>
                <option value="opos">O positive</option>
                <option value="oneg">O negative</option>
            </select><br>
            <input type="number" name="runits" required placeholder="Enter Number Of Units"><br>
            <input type="submit" name="submit" value="add">
        </form>
    </body>
</html>
