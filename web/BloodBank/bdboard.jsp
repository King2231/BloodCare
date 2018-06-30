<%-- 
    Document   : bdboard
    Created on : Apr 1, 2018, 11:46:28 PM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.POJO.Hospital_Dt"%>
<%@page import="com.bloodcare.Workers.Hospital_Worker"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bloodcare.Workers.Hosprequest_Worker"%>
<%@page import="com.bloodcare.POJO.Hosprequest_Dt"%>
<%@page import="com.bloodcare.POJO.Bloodbank_Dt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            Bloodbank_Dt bd=null;
            Object o=session.getAttribute("bank");
            if(o!=null){
                bd=(Bloodbank_Dt)o;
                System.out.println("Hospital: "+bd.getBank_name());
            }
            else{
                session.removeAttribute("bank");
                response.sendRedirect("banklogin");
            }
            ArrayList<Hosprequest_Dt> list = Hosprequest_Worker.getAllHosprequests();          
%>
<!DOCTYPE html>
<html>
    <head>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=bd.getBank_name()%></title>
        <!-- Font Awesome -->
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
   </head>
    <body class="">
        <header>
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar grey lighten-3">
                <a class="navbar-brand red-text" href="#" ><strong>BloodCare</strong></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link red-text" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link red-text" href="newdonor">New Donor</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link red-text" href="newpacket">New Packet</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link red-text" href="addbank?submit=logout">Logout</a>
                        </li>
                        
                    </ul>
                    <ul class="navbar-nav nav-flex-icons">
                        <li class="nav-item right">
                            <%=bd.getBank_name()%>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
<!--Main Navigation-->
        <div class="container">
           <h1><%=bd.getBank_name()%></h1><br>
                <!--a href="newdonor">New Donor</a><br-->
                <p><h3>Blood Requests</h3></p>

            <table cellpadding="10px" class="table table-bordered table-hover table-responsive" style="letter-spacing: 1px" id="tabless">
                <thead class="orange lighten-2 white-text">
                    <tr>
                        <td>Hosp. Name</td>
                        <td>Blood-Group</td>
                        <td>Req. Units</td>
                        <td>Avail. Units</td>
                        <td>Address</td>
                        <td>Email</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for(Hosprequest_Dt hd: list){
                    %>
                    <tr>
                            <%
                                Hospital_Dt h=Hospital_Worker.showHospitalById(hd.getReq_hid()); 
                                Boolean g=true;
                            %>
                        <td>
                            <%=h.getHosp_name()%>
                        </td>
                        <td>
                            <%=hd.getReq_group()%>
                        </td>
                        <td>
                            <%=hd.getReq_units()%>
                        </td>
                        <td>
                            <%
                                switch(hd.getReq_group()){
                                    case "apos":
                                        if(bd.getApos()>0)
                                            g=false;
                            %>                       
                            <%=bd.getAbpos()%>                               
                            <%
                                        break;
                                    case "aneg":
                                        if(bd.getAneg()>0)
                                        g=false;
                            %>                       
                            <%=bd.getAbneg()%>
                            <%
                                        break;
                                    case "bpos":
                                        if(bd.getBpos()>0)
                                            g=false;
                            %>
                            <%=bd.getBpos()%>                        
                            <%
                                        break;
                                    case "bneg":
                                        if(bd.getBneg()>0)
                                            g=false;
                            %>                        
                            <%=bd.getBneg()%>
                            <%
                                        break;
                                    case "abpos":
                                        if(bd.getAbpos()>0)
                                            g=false;
                            %>                        
                            <%=bd.getAbpos()%>
                            <% 
                                        break;
                                    case "abneg":
                                        if(bd.getAbneg()>0)
                                            g=false;
                            %>
                            <%=bd.getAbneg()%> 
                            <%
                                        break;
                                    case "opos":
                                        if(bd.getOpos()>0)
                                            g=false;
                            %>
                            <%=bd.getOpos()%>
                            <%
                                        break;
                                    case "obneg":
                                        if(bd.getOneg()>0)
                                            g=false;
                            %>
                            <%=bd.getOneg()%>
                            <%
                                        break;
                                }
                            %>
                        </td>
                        <td>
                            <%=h.getHosp_building()+", "+h.getHosp_area()+", "+h.getHosp_city()+" - "+h.getHosp_pin()%>
                        </td>
                        <td>
                            <%=h.getHosp_mail()%>
                        </td>
                        <td>
                            <form action="requestaction">
                                <input type="hidden" name="request" value="<%=hd.getReq_id()%>" readonly>
                                <button type="submit" name="submit" value="respond" disabled="<%=g%>" class="btn btn-default blue"> Respond </button>
                            </form>
                        </td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table> 
        </div>    
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
        <script>
            $(document).ready(function() {
            $('#tabless').DataTable();
        } );
        </script>
    </body>
</html>
