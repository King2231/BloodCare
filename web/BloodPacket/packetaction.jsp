<%-- 
    Document   : packetaction
    Created on : Apr 2, 2018, 10:22:49 AM
    Author     : Ravi
--%>
<%@page import="com.bloodcare.Workers.*"%>
<%@page import="com.bloodcare.POJO.*"%>
<%@page import="com.bloodcare.DateWorker"%>
<%@page import="java.util.Date"%>    
<%
    try{
        String req=request.getParameter("submit");
        Bloodpacket_Dt packet=null;
        String result=null;
        switch(req){
            case "add":
                packet=new Bloodpacket_Dt();
                break;
            case "update":
                Object obank=session.getAttribute("bank");
                Bloodbank_Dt bdd=new Bloodbank_Dt();
                if(obank!=null){
                    bdd=(Bloodbank_Dt)obank;
                    System.out.println(bdd.getBank_name());
                    String code=request.getParameter("code");
                    System.out.println("Code: "+code);
                    try{
                        packet=Bloodpacket_Worker.showPacketByCode(code);
                        if(packet.getPacket_status()==0){
                            packet.setPacket_status(1);
                            packet.setPbank_id(bdd.getBank_id());
                            packet.setBankdate(DateWorker.getCurrentDate());
                            result=Bloodpacket_Worker.updatePacket(packet);
                            if(result.equalsIgnoreCase("Success")){
                                Donor_Dt dt=new Donor_Dt();
                                try{
                                    dt=Donor_Worker.showDonorById(packet.getPdonor_id());
                                }
                                catch(NullPointerException e){
                                    session.setAttribute("err", "No such donor Exists");
                                    response.sendRedirect("newpacket");
                                }
                                String bg=dt.getDonor_group();
                                switch(bg){
                                    case "apos":
                                        bdd.setApos(bdd.getApos()+1);
                                        break;
                                    case "bpos":
                                        bdd.setBpos(bdd.getBpos()+1);
                                        break;
                                    case "opos":
                                        bdd.setOpos(bdd.getOpos()+1);
                                        break;
                                    case "aneg":
                                        bdd.setAneg(bdd.getAbneg()+1);
                                        break;
                                    case "bneg":
                                        bdd.setBneg(bdd.getBneg()+1);
                                        break;
                                    case "oneg":
                                        bdd.setOneg(bdd.getOneg()+1);
                                        break;
                                    case "abpos":
                                        bdd.setAbpos(bdd.getAbpos()+1);
                                        break;
                                    case "abneg":
                                        bdd.setAbneg(bdd.getAbneg()+1);
                                        break;
                                }
                                result=BloodBank_Worker.updateBank(bdd);
                                if(result.equalsIgnoreCase("success")){
                                    String message="Hi "+dt.getDonor_name()+" !. Thankyou for your kind act of "
                                            + "donation. This email is just to acknowledge you that your donated bloodpacket "
                                            + "has reached a bloodbank. ";
                                    String subject="Acknowledgement of Blood Receipt.";
                                    MailWorker.sendHTMLMail(dt.getDonor_mail(), message, subject);
                                    session.setAttribute("err", "Record Updated.");
                                    response.sendRedirect("newpacket");
                                }
                            }
                        }
                        else{
                            session.setAttribute("err", "The BloodPacket is already Counted.");
                        }
                    }    
                    catch(NullPointerException e){
                        System.err.println("No such packet");
                        session.setAttribute("err", "No corresponding packet record exists.");
                        response.sendRedirect("newpacket");
                        //e.printStackTrace();
                    }
                }
                else{
                    session.setAttribute("err", "Please sign in before you continue.");
                    response.sendRedirect("banklogin");
                }
                break;
        }
        /*if(result.equalsIgnoreCase("Success"))
             response.sendRedirect("success");
        else{
             session.setAttribute("err","Some Internal Error. Please Contact System Engineer");
             response.sendRedirect("error");
        }*/
    }
    catch(Exception e){
        e.printStackTrace();
    }    
%>