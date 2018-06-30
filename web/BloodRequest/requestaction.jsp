<%-- 
    Document   : requestaction
    Created on : Apr 3, 2018, 10:51:15 PM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.Workers.Hosprequest_Worker"%>
<%@page import="com.bloodcare.DateWorker"%>
<%@page import="com.bloodcare.POJO.Hospital_Dt"%>
<%@page import="com.bloodcare.POJO.Hosprequest_Dt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP</title>
    </head>
    <body>
        <%  
            Hospital_Dt hd=null;
            Object hospital=session.getAttribute("hospital");
            if(hospital!=null)
                hd=(Hospital_Dt)hospital;
            else{
                session.setAttribute("err", "Please Login Before You Continue");
                response.sendRedirect("../camplogin");
            }
            try{
                String req=request.getParameter("submit");
                Hosprequest_Dt rd=null;
                String result=null;
                switch(req){
                    case "add":
                        System.out.println(req);
                        rd=new Hosprequest_Dt();
                        rd.setReq_gdate(DateWorker.getCurrentDate());
                        rd.setReq_group(request.getParameter("rgroup"));
                        rd.setReq_hid(hd.getHospital_id());
                        rd.setReq_patient(request.getParameter("rpatient"));
                        rd.setReq_units(Integer.parseInt(request.getParameter("runits")));
                        result=Hosprequest_Worker.addHosprequest(rd); 
                        break;
                    case "update":
                        System.out.println(req);
                        rd=new Hosprequest_Dt();
                        rd.setReq_gdate(DateWorker.getCurrentDate());
                        rd.setReq_group(request.getParameter("rgroup"));
                        rd.setReq_hid(hd.getHospital_id());
                        rd.setReq_patient(request.getParameter("rpatient"));
                        rd.setReq_units(Integer.parseInt(request.getParameter("runits")));
                        result=Hosprequest_Worker.updateHospReq(rd);
                        break;
                    case "delete":
                        System.out.println(req);
                        result=Hosprequest_Worker.deleteReq(Integer.parseInt(request.getParameter("id")));
                        break;
                    case "respond":
                        System.out.println(req);
                        rd=Hosprequest_Worker.showHosprequestById(Integer.parseInt(request.getParameter("id")));
                        rd.setReq_status(rd.getReq_status()+1);
                        result=Hosprequest_Worker.updateHospReq(rd);
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
                session.setAttribute("err","Some Internal Error. Please Contact System Engineer");
            }    
    %>
    </body>
</html>
