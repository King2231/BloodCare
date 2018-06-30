<%-- 
    Document   : hospaction
    Created on : Apr 2, 2018, 12:33:42 AM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.Workers.Hospital_Worker"%>
<%@page import="com.bloodcare.POJO.Hospital_Dt"%>
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
                Hospital_Dt hd=null;
                String result=null;
                switch(req){
                    case "add":
                        System.out.println(req);
                        hd=new Hospital_Dt();
                        hd.setHosp_name(request.getParameter("hname"));
                        hd.setHosp_building(request.getParameter("hbuilding"));
                        hd.setHosp_area(request.getParameter("harea"));
                        hd.setHosp_city(request.getParameter("hcity"));
                        hd.setHosp_pin(request.getParameter("hpin"));
                        hd.setHosp_mail(request.getParameter("hmail"));
                        hd.setHosp_wsite(request.getParameter("hsite"));
                        hd.setHosp_usr(request.getParameter("husr"));
                        hd.setHosp_pwd(request.getParameter("hpwd"));
                        result=Hospital_Worker.addHospital(hd);
                        break;    
                    case "update":
                        System.out.println(req);
                        hd=new Hospital_Dt();
                        hd.setHosp_name(request.getParameter("hname"));
                        hd.setHosp_building(request.getParameter("hbuilding"));
                        hd.setHosp_area(request.getParameter("harea"));
                        hd.setHosp_city(request.getParameter("hcity"));
                        hd.setHosp_pin(request.getParameter("hpin"));
                        hd.setHosp_mail(request.getParameter("hmail"));
                        hd.setHosp_wsite(request.getParameter("hsite"));
                        hd.setHosp_usr(request.getParameter("husr"));
                        hd.setHosp_pwd(request.getParameter("hpwd"));
                        result=Hospital_Worker.updateHospital(hd);
                        break;    
                    case "delete":
                        System.out.println(req);
                        result=Hospital_Worker.deleteHospital(Integer.parseInt(request.getParameter("id")));
                        break;    
                    case "login":
                        hd=Hospital_Worker.showHospitalByUser(request.getParameter("husr"));
                        System.out.println(hd.getHosp_usr() + hd.getHosp_pwd());
                        System.out.println("USERNAME : "+request.getParameter("husr"));
                        System.out.println("PASSWORD : "+request.getParameter("hpwd"));
                        if(hd!=null){
                            String pwd=hd.getHosp_pwd();
                            System.out.println("PWD : "+pwd);
                            if(pwd.equals(request.getParameter("hpwd"))){
                                hd.setHosp_pwd("");
                                session.setAttribute("hospital",hd);
                                response.sendRedirect("hospboard");
                            }
                            else{
                                //session.setAttribute("err", "Password Incorrect. Please try again");
                                response.sendRedirect("error");
                            }
                        }
                        else{
                            //session.setAttribute("err", "The UCID is not registered. Please Contact Administrator.");
                            response.sendRedirect("hosplogin");
                        }        
                        break;        
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
