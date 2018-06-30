<%-- 
    Document   : campaction
    Created on : Apr 1, 2018, 11:08:01 PM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.Workers.BloodCamp_Worker"%>
<%@page import="com.bloodcare.POJO.Bloodcamp_Dt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                String req=request.getParameter("submit");
                Bloodcamp_Dt bdc=null;
                String result=null;
                switch(req){
                    case "add":
                        System.out.println(req);
                        bdc=new Bloodcamp_Dt();
                        bdc.setCamp_name(request.getParameter("cname"));
                        bdc.setCamp_area(request.getParameter("carea"));
                        bdc.setCamp_building(request.getParameter("cbuilding"));
                        bdc.setCamp_pin(request.getParameter("cpin"));
                        bdc.setCamp_pwd(request.getParameter("cpwd"));
                        bdc.setCamp_city(request.getParameter("ccity"));
                        bdc.setCamp_date(request.getParameter("cdate"));
                        bdc.setCamp_organizer(request.getParameter("corganizer"));
                        bdc.setBank_id(Integer.parseInt(request.getParameter("bank")));
                        result=BloodCamp_Worker.addBloodcamp(bdc);
                        break;
                    case "update":
                        System.out.println(req);
                        bdc=new Bloodcamp_Dt();
                        bdc.setCamp_name(request.getParameter("cname"));
                        bdc.setCamp_area(request.getParameter("carea"));
                        bdc.setCamp_building(request.getParameter("cbuilding"));
                        bdc.setCamp_pin(request.getParameter("cpin"));
                        bdc.setCamp_pwd(request.getParameter("cpwd"));
                        bdc.setCamp_city(request.getParameter("ccity"));
                        bdc.setCamp_date(request.getParameter("cdate"));
                        bdc.setCamp_organizer(request.getParameter("corganizer"));
                        bdc.setBank_id(Integer.parseInt(request.getParameter("bank")));
                        result=BloodCamp_Worker.updateCamp(bdc);
                        break;
                    case "delete":
                        System.out.println(req);
                        result=BloodCamp_Worker.deleteCamp(Integer.parseInt(request.getParameter("id")));
                        break;
                    case "login":
                        bdc=BloodCamp_Worker.showCampByUser(request.getParameter("cusr"));
                        if(bdc!=null){
                            String pwd=bdc.getCamp_pwd();
                            System.out.println("PWD : "+pwd);
                            if(pwd.equals(request.getParameter("cpwd"))){
                                bdc.setCamp_pwd("");
                                session.setAttribute("camp",bdc);
                                response.sendRedirect("campboard");
                            }
                            else{
                                //session.setAttribute("err", "Password Incorrect. Please try again");
                                response.sendRedirect("error");
                            }
                        }
                        else{
                            //session.setAttribute("err", "The UCID is not registered. Please Contact Administrator.");
                            response.sendRedirect("camplogin");
                        }
                }
                if(result.equalsIgnoreCase("Success"))
                     response.sendRedirect("success");
                else{
                     session.setAttribute("err","Some Internal Error. Please Contact System Engineer");
                     response.sendRedirect("error");
                }
            }
            catch(Exception e){
                e.printStackTrace();

            }    
        %>
    </body>
</html>
