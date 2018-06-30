<%-- 
    Document   : addbank
    Created on : Apr 1, 2018, 8:08:43 PM
    Author     : Ravi
--%>
<%@page import="com.bloodcare.Workers.BloodBank_Worker"%>
<%@page import="com.bloodcare.POJO.Bloodbank_Dt"%>      
<%
    try{
        String req=request.getParameter("submit");
        Bloodbank_Dt bd=null;
        String result=null;
        switch(req){
            case "add":
                System.out.println(req);
                bd=new Bloodbank_Dt();
                bd.setBank_name(request.getParameter("bname"));
                bd.setBank_area(request.getParameter("barea"));
                bd.setBank_building(request.getParameter("bbuilding"));
                bd.setBank_pin(request.getParameter("bpin"));
                bd.setBank_usr(request.getParameter("busr"));
                bd.setBank_pwd(request.getParameter("bpwd"));
                bd.setBank_city(request.getParameter("bcity"));
                result=BloodBank_Worker.addBloodbank(bd);
                break;
            case "update":
                System.out.println(req);
                bd=new Bloodbank_Dt();
                bd.setBank_name(request.getParameter("bname"));
                bd.setBank_area(request.getParameter("barea"));
                bd.setBank_building(request.getParameter("bbuilding"));
                bd.setBank_city(request.getParameter("bcity"));
                bd.setBank_pin(request.getParameter("bpin"));
                bd.setBank_usr(request.getParameter("busr"));
                bd.setBank_pwd(request.getParameter("bpwd"));
                result=BloodBank_Worker.updateBank(bd);
                break;
            case "delete":
                System.out.println(req);
                result=BloodBank_Worker.deleteBank(Integer.parseInt(request.getParameter("id")));
                break;
            case "login":
                System.out.println(req);
                String usr=request.getParameter("busr");
                String pwdd=request.getParameter("bpwd");
                System.out.println("Ucid: "+usr+"\t Pwd from form: "+pwdd);
                try{
                    bd=BloodBank_Worker.showBankByUser(usr);
                    if(bd.getBank_pwd().equals(pwdd)){
                        bd.setBank_pwd(" ");
                        session.setAttribute("bank",bd);
                        response.sendRedirect("bdboard");
                    }
                    else{
                        session.setAttribute("err", "Password Incorrect. Please try again.");
                        response.sendRedirect("banklogin");
                    }
                }
                catch(NullPointerException e){
                    session.setAttribute("err","No such record exists.");
                    response.sendRedirect("banklogin");
                }
                break;
            case "logout":
                session.removeAttribute("bank");
                session.setAttribute("err", "You are logged out.");
                response.sendRedirect("banklogin");
                break;
        }
    }
    catch(Exception e){
        e.printStackTrace();
    }    
%>