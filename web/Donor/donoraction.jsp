<%-- 
    Document   : donoraction
    Created on : Apr 2, 2018, 9:23:52 AM
    Author     : Ravi
--%>

<%@page import="java.util.Set"%>
<%@page import="com.bloodcare.Workers.MailWorker"%>
<%@page import="com.bloodcare.Workers.BloodBank_Worker"%>
<%@page import="com.bloodcare.POJO.Bloodbank_Dt"%>
<%@page import="com.bloodcare.POJO.Hospital_Dt"%>
<%@page import="com.bloodcare.DateWorker"%>
<%@page import="com.bloodcare.Workers.Bloodpacket_Worker"%>
<%@page import="com.bloodcare.POJO.Bloodcamp_Dt"%>
<%@page import="java.util.Date"%>
<%@page import="com.bloodcare.POJO.Bloodpacket_Dt"%>
<%@page import="com.bloodcare.Workers.Donor_Worker"%>
<%@page import="com.bloodcare.POJO.Donor_Dt"%>
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
            Donor_Dt d=null;
            String result=null;
            switch(req){
                case "add":
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
                            response.sendRedirect("../camplogin");
                        }
                    }
                    System.out.println(req);
                    d=new Donor_Dt();
                    d.setDonor_name(request.getParameter("dname"));
                    d.setDonor_city(request.getParameter("dcity"));
                    d.setDonor_phone(request.getParameter("dphone"));
                    d.setDonor_group(request.getParameter("dgroup"));
                    d.setDonor_mail(request.getParameter("dmail"));
                    d.setDonor_usr(d.getDonor_name()+Integer.toString(Donor_Worker.getMaxDonor()+1));
                    result=Donor_Worker.addDonor(d);
                    if(result.equalsIgnoreCase("Success") && bcd!=null){
                        Bloodpacket_Dt bd =new Bloodpacket_Dt();
                        bd.setCampdate(DateWorker.getCurrentDate());
                        bd.setPacket_status(0);
                        bd.setPdonor_id(Donor_Worker.getMaxDonor());
                        bd.setPcamp_id(bcd.getCamp_id());
                        result=Bloodpacket_Worker.addBloodpacket(bd);
                    }
                    else{
                        if(result.equalsIgnoreCase("Success") && bdd!=null){
                            switch(d.getDonor_group()){
                                case "apos":
                                    bdd.setApos(bdd.getApos()+1);
                                    break;
                                case "aneg":
                                    bdd.setAneg(bdd.getAneg()+1);
                                    break;
                                case "bpos":
                                    bdd.setBpos(bdd.getBpos()+1); 
                                    break;
                                case "bneg":
                                    bdd.setBneg(bdd.getBneg()+1);
                                    break;
                                case "abpos":
                                    bdd.setAbpos(bdd.getAbpos()+1);
                                 break;
                                case "abneg":
                                    bdd.setAbneg(bdd.getAbneg()+1);
                                    break;
                                case "opos":
                                    bdd.setOpos(bdd.getOpos()+1);
                                    break;
                                case "obneg":
                                    bdd.setOneg(bdd.getOneg()+1);
                                    break;
                            }
                            result=BloodBank_Worker.updateBank(bdd);
                        }
                    }
                    if(result.equalsIgnoreCase("Success")){
                            String subject="Donor Profile";
                            String body="Hi <strong>"+d.getDonor_name()+"</strong>,\nWe at BloodCare, with immense pleasure welcome you to our donor community.\n"
                                    + "Your Username is : <strong>"+d.getDonor_usr()
                                    + "</strong> \nYou can please generate your password and get in touch with us to stay updated about our activites."
                                    + "Also you can just provide your username and escape the registration process in any of our associated blood donation camps.\n"
                                    + "<form action=\"http://localhost:8084/Bloodcare/donorsetup\" method=\"post\"><input type=\"hidden\" name=\"donor\" value=\""+Integer.toString(Donor_Worker.getMaxDonor())+"\">"
                                    + "<button type=\"submit\" name=\"submit\" value=\"update\">Set Credentials Here</button></form>";
                                            
                            MailWorker.sendHTMLMail(d.getDonor_mail(), body, subject);
                            response.sendRedirect("success");
                        }
                        else{
                            result=Donor_Worker.deleteDonor(Donor_Worker.getMaxDonor());
                            if(result.equalsIgnoreCase("Success")){
                                session.setAttribute("err", "Could not make updations. Please try later. \nData integrity check performed. \nLast action Rolled back.");
                                response.sendRedirect("error");
                            }
                        }
                    break;
                case "update":
                    System.out.println(req);
                    d=new Donor_Dt();
                    d.setDonor_name(request.getParameter("dname"));
                    d.setDonor_city(request.getParameter("dcity"));
                    d.setDonor_phone(request.getParameter("dphone"));
                    d.setDonor_group(request.getParameter("dgroup"));
                    d.setDonor_mail(request.getParameter("dmail"));
                    d.setDonor_mail(request.getParameter("dusr"));
                    d.setDonor_pwd(request.getParameter("dpwd"));
                    result=Donor_Worker.updateDonor(d);
                    break;
                case "delete":
                    System.out.println(req);
                    result=Donor_Worker.deleteDonor(Integer.parseInt(request.getParameter("id")));
                    break;
                case "login":
                    d=Donor_Worker.showDonorByUser(request.getParameter("dusr"));
                    if(d!=null){
                        String pwd=d.getDonor_pwd();
                        System.out.println("PWD : "+pwd);
                        if(pwd.equals(request.getParameter("cpwd"))){
                            d.setDonor_pwd("");
                            session.setAttribute("donor",d);
                            response.sendRedirect("success");
                        }
                        else{
                            //session.setAttribute("err", "Password Incorrect. Please try again");
                            response.sendRedirect("error");
                        }
                    }
                    else{
                        //session.setAttribute("err", "The UCID is not registered. Please Contact Administrator.");
                        response.sendRedirect("../camplogin");
                    }
                    break;
                case "setup":
                    int id=Integer.parseInt(request.getParameter("did"));
                    d = Donor_Worker.showDonorById(id);
                    //d.setDonor_usr(request.getParameter("dusr"));
                    d.setDonor_pwd(request.getParameter("dpwd"));
                    result=Donor_Worker.updateDonor(d);
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
            //response.sendRedirect("../error");
        }    
    %>
    </body>
</html>
