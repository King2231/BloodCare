/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare.Workers;

import com.bloodcare.DatabaseConnector;
import com.bloodcare.POJO.Bloodbank_Dt;
import com.bloodcare.Results;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ravi
 */
//Add bank
public class BloodBank_Worker {
    public static String addBloodbank(Bloodbank_Dt bd){
        String result = "";
        try{
            String query="insert into bloodcare_bloodbank(Bbank_name,Bbank_building,Bbank_area,"
                    + "Bbank_city,Bbank_pin,Bbank_apos,Bbank_aneg,Bbank_Bpos,Bbank_bneg,"
                    + "Bbank_abpos,Bbank_abneg,Bbank_opos,Bbank_oneg,Bbank_username,Bbank_pwd) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,bd.getBank_name());
            pstmt.setString(2,bd.getBank_building());
            pstmt.setString(3,bd.getBank_area());
            pstmt.setString(4,bd.getBank_city());
            pstmt.setString(5,bd.getBank_pin());
            pstmt.setInt(6,bd.getApos());
            pstmt.setInt(7,bd.getAneg());
            pstmt.setInt(8,bd.getBpos());
            pstmt.setInt(9,bd.getBneg());
            pstmt.setInt(10,bd.getAbpos());
            pstmt.setInt(11,bd.getAbneg());
            pstmt.setInt(12,bd.getOpos());
            pstmt.setInt(13,bd.getOneg());
            pstmt.setString(14,bd.getBank_usr());
            pstmt.setString(15,bd.getBank_pwd());
            
            int i=pstmt.executeUpdate();
            if(i==1){
                result=Results.SUCCESS;
            }
            else{
                result=Results.FAILURE;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
            DatabaseConnector.close();
        }
        return result;
   }

//Update bank By id
    public static String updateBank(Bloodbank_Dt bd){
        String result="";
        try{
            String query="Update bloodcare_bloodbank set Bbank_name=?,Bbank_building=?,Bbank_area=?,"
                    + "Bbank_city=?,Bbank_pin=?,Bbank_apos=?,Bbank_aneg=?,Bbank_Bpos=?,Bbank_bneg=?,"
                    + "Bbank_abpos=?,Bbank_abneg=?,Bbank_opos=?,Bbank_oneg=?,Bbank_username=?,Bbank_pwd=? where id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,bd.getBank_name());
            pstmt.setString(2,bd.getBank_building());
            pstmt.setString(3,bd.getBank_area());
            pstmt.setString(4,bd.getBank_city());
            pstmt.setString(5,bd.getBank_pin());
            pstmt.setInt(6,bd.getApos());
            pstmt.setInt(7,bd.getAneg());
            pstmt.setInt(8,bd.getBpos());
            pstmt.setInt(9,bd.getBneg());
            pstmt.setInt(10,bd.getAbpos());
            pstmt.setInt(11,bd.getAbneg());
            pstmt.setInt(12,bd.getOpos());
            pstmt.setInt(13,bd.getOneg());
            pstmt.setString(14,bd.getBank_usr());
            pstmt.setString(15,bd.getBank_pwd());
            pstmt.setInt(16,bd.getBank_id());
            int i=pstmt.executeUpdate();

            if(i==1){
                result=Results.SUCCESS;
            }
            else{
                result=Results.FAILURE;
            }

        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return result;
   }

//Delete Bank By id
    public static String deleteBank(int bd_id){
        String result="";
        try{   
            String query="Delete from bloodcare_bloodbank where id="+bd_id+";";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
                  //pstmt.setInt(1,ed.getEx_id());
            int i=pstmt.executeUpdate();
            if(i==1){
                result=Results.SUCCESS;
             }
             else{
                   result=Results.FAILURE;
             }
        }
        catch(Exception e){
             result=Results.PROBLEM;
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return result;
    }
 //Bank Details Show By id
    public static Bloodbank_Dt showBankById(int bd_id){
        Bloodbank_Dt bd=null;
        try{
            String query="Select * from bloodcare_bloodbank where id ="+bd_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                bd=new Bloodbank_Dt();
                bd.setBank_id(rs.getInt(1));
                bd.setBank_name(rs.getString(2));
                bd.setBank_building(rs.getString(3));
                bd.setBank_area(rs.getString(4));
                bd.setBank_city(rs.getString(5));
                bd.setBank_pin(rs.getString(6));
                bd.setApos(rs.getInt(7));
                bd.setAneg(rs.getInt(8));
                bd.setBpos(rs.getInt(9));
                bd.setBneg(rs.getInt(10));
                bd.setAbpos(rs.getInt(11));
                bd.setAbneg(rs.getInt(12));
                bd.setOpos(rs.getInt(13));
                bd.setOneg(rs.getInt(14));
                bd.setBank_usr(rs.getString(15));
                bd.setBank_pwd(rs.getString(16));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return bd;
    } 
//Bank by UserName
public static Bloodbank_Dt showBankByUser(String username){
        Bloodbank_Dt bd=null;
        try{
            String query="Select * from bloodcare_bloodbank where Bbank_username='"+username+"';";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                bd=new Bloodbank_Dt();
                bd.setBank_id(rs.getInt(1));
                bd.setBank_name(rs.getString(2));
                bd.setBank_building(rs.getString(3));
                bd.setBank_area(rs.getString(4));
                bd.setBank_city(rs.getString(5));
                bd.setBank_pin(rs.getString(6));
                bd.setApos(rs.getInt(7));
                bd.setAneg(rs.getInt(8));
                bd.setBpos(rs.getInt(9));
                bd.setBneg(rs.getInt(10));
                bd.setAbpos(rs.getInt(11));
                bd.setAbneg(rs.getInt(12));
                bd.setOpos(rs.getInt(13));
                bd.setOneg(rs.getInt(14));
                bd.setBank_usr(rs.getString(15));
                bd.setBank_pwd(rs.getString(16));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return bd;
    } 
        
//All banks
    
    public static ArrayList<Bloodbank_Dt> getAllBanks(){
        ArrayList<Bloodbank_Dt>list=new ArrayList<>();
        try{
            String query="Select * from bloodcare_bloodbank;";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            while(rs.next()){
                Bloodbank_Dt bd;
                bd=new Bloodbank_Dt();
                bd.setBank_id(rs.getInt(1));
                bd.setBank_name(rs.getString(2));
                bd.setBank_building(rs.getString(3));
                bd.setBank_area(rs.getString(4));
                bd.setBank_city(rs.getString(5));
                bd.setBank_pin(rs.getString(6));
                bd.setApos(rs.getInt(7));
                bd.setAneg(rs.getInt(8));
                bd.setBpos(rs.getInt(9));
                bd.setBneg(rs.getInt(10));
                bd.setAbpos(rs.getInt(11));
                bd.setAbneg(rs.getInt(12));
                bd.setOpos(rs.getInt(13));
                bd.setOneg(rs.getInt(14));
                bd.setBank_usr(rs.getString(15));
                bd.setBank_pwd(rs.getString(16));
                list.add(bd);
                bd=null; 
            }
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return list;
    }
    
     /*public static String deleteByExid(int ex_id){
        String result="";
          try{
              String query="Delete from exam where exam_id='"+ex_id+"';";
              PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
              int i=pstmt.executeUpdate();
               if(i==1){
                  result=Results.SUCCESS;
               }
               else{
                    result=Results.FAILURE;
               }
               DatabaseConnector.close();
          }
          catch(Exception e){
              result=Results.PROBLEM;
              e.printStackTrace();
          }
          finally{
               DatabaseConnector.close();
          }
          return result;
     }*/
    /*Show Exam by teacher
    public static ArrayList<Bloodbank_Dt> getAllExamByTid(int t_id){
         ArrayList<Exam_Dt> list=new ArrayList<>();
         try{
              String query="Select * from exam where tch_id ="+t_id+" ORDER by ex_date";
              ResultSet rs=DatabaseConnector.getResultSet(query);
              Exam_Dt ed;
              while(rs.next()){
                   ed=new Exam_Dt();
                   ed.setEx_id(rs.getInt(1));
                   ed.setSub_id(rs.getInt(2));
                   ed.setEx_sem(rs.getString(3));
                   ed.setEx_co(rs.getString(4));
                   ed.setT_id(rs.getInt(5));
                   ed.setEx_pwd(rs.getString(6));
                   ed.setEx_date(rs.getString(7));
                   ed.setEx_duration(rs.getString(8));
                   ed.setNoofq(rs.getInt(9));
                   ed.setStatus(rs.getInt(10));
                   ed.setTime(rs.getString(11));
                   ed.setD_status(rs.getInt(12));
                   ed.setDesc(rs.getString(13));
                   ed.setAnnounce(rs.getInt(14));
                   list.add(ed);
                   ed=null; 
              }
         }
         catch(Exception e){
              e.printStackTrace();
         }
         finally{
              DatabaseConnector.close();
         }
         return list;
    }
    */
    //Banks get all
    
    
    /*Max Exam ID
    public static int getMaxExId(){
         int id=0;
         try{
              String query="select max(exam_id) from exam;";
              ResultSet rs=DatabaseConnector.getResultSet(query);
              if(rs.next()){
                   id=rs.getInt(1);
              }
              DatabaseConnector.close();
         }
         catch(Exception ex){
              ex.printStackTrace();
         }
         finally{
              DatabaseConnector.close();
         }
         return id;
    }
    public static Exam_Dt getStatus(int ex_id){
         Exam_Dt ed=null;
         try{
              String query="select status,endTime from exam where exam_id ="+ex_id+";";
              ResultSet rs=DatabaseConnector.getResultSet(query);
              while(rs.next()){
                   ed=new Exam_Dt();
                   ed.setStatus(rs.getInt(1));
                   ed.setT_id(rs.getInt(2));
              }

         }
         catch(SQLException ex){
              ex.printStackTrace();
         }
         finally{
              DatabaseConnector.close();
         }
         return ed;
    }
    public static String setEnd(Exam_Dt ed){
         String result=null;
         try{
              String query="Update exam set endTime=?,o_status=? where exam_id=?";
              PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
              pstmt.setString(1,ed.getTime());
              pstmt.setInt(2,ed.getStatus());
              pstmt.setInt(3,ed.getEx_id());
              int i=pstmt.executeUpdate();
              if(i==1){
                   result="success";
              }
              else{
                   result="failure";
              }
         }
         catch(Exception ex){
              ex.printStackTrace();
         }
         finally{
              DatabaseConnector.close();
         }
         return result;
    }
    //get Active Exams
    public static ArrayList<Exam_Dt> getAllActiveExam(String sem){
         ArrayList<Exam_Dt> list=new ArrayList<>();
         try{
              String query="Select * from exam where exam_sem ='"+sem+"' and d_status=0;";
              ResultSet rs=DatabaseConnector.getResultSet(query);
              Exam_Dt ed;
              while(rs.next()){
                   ed=new Exam_Dt();
                   ed.setEx_id(rs.getInt(1));
                   ed.setEx_sem(rs.getString(3));
                   ed.setSub_id(rs.getInt(2));
                   ed.setEx_co(rs.getString(4));
                   ed.setT_id(rs.getInt(5));
                   ed.setEx_pwd(rs.getString(6));
                   ed.setEx_date(rs.getString(7));
                   ed.setEx_duration(rs.getString(8));
                   ed.setNoofq(rs.getInt(9));
                   ed.setD_status(rs.getInt(10));
                   ed.setDesc(rs.getString(11));
                   list.add(ed);
                   ed=null; 
              }
         }
         catch(Exception e){
              e.printStackTrace();
         }
         finally{
              DatabaseConnector.close();
         }
         return list;
    }
    //Close Exam
    public static String CloseExam(Exam_Dt ed){
        String result=null;
        try{
             String query="Update exam set o_status=?,d_status=? where exam_id=?";
             PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
             pstmt.setInt(1,ed.getStatus());
             pstmt.setInt(2,ed.getD_status());
             pstmt.setInt(3,ed.getEx_id());
             int i=pstmt.executeUpdate();
             if(i==1){
                  result="success";
             }
             else{
                  result="failure";
             }
        }
        catch(Exception ex){
             ex.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return result;
    }

*/

}
