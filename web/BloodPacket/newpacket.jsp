<%-- 
    Document   : newpacket
    Created on : Apr 2, 2018, 10:20:51 AM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.POJO.Bloodbank_Dt"%>
<%@page import="com.bloodcare.POJO.Bloodpacket_Dt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Bloodbank_Dt bd;
    Object o = session.getAttribute("bank");
    Object err=session.getAttribute("err");
    if(o!=null){
        bd=(Bloodbank_Dt)o;
    }
    else{
        session.setAttribute("err", "Please Login Before You Update Details");
        response.sendRedirect("../banklogin");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/css/mdb.min.css" rel="stylesheet">
        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.0/js/mdb.min.js"></script>
        <title>New Packet</title>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark scrolling-navbar grey lighten-3" style="letter-spacing: 2px">
                <a class="navbar-brand red-text" href="#" ><strong>BloodCare</strong></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link red-text" href="bdboard">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link red-text" href="newdonor">New Donor</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link red-text" href="addbank?submit=logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <hr><br><br>
        <div class="container ">
            <div class="row ">
                <div class="col-md-6 card offset-sm-3" style="padding: 15px 5px 5px 5px">
                    <center><p><h1>Packet Entry</h1></p></center><hr><br>
                    <%
                        if(err!=null){
                            String eror=(String)err;
                    %>
                    <center><p class="red-text"><b><%=eror%></b></p></center>
                    <%
                        session.removeAttribute("err");
                        }
                    %>
                    <form class="form" method="post" action="packetaction">
                        <div class="row form-group">
                            <input type="text" placeholder="Enter Packet ID " required="" class="form-control-lg col-sm-8 offset-sm-2" name="code">
                        </div>
                            <center><button type="submit" name="submit" value="update" class="btn btn-default">Submit</button></center>
                    </form>
                </div>
            </div>
        </div>
        <form>
            
        </form>
        
    </body>
</html>
