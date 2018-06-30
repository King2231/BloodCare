/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare.Workers;

import com.bloodcare.DatabaseConnector;
import com.bloodcare.POJO.Donor_Dt;
import com.bloodcare.Results;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Ravi
 */
public class Donor_Worker {
    public static String addDonor(Donor_Dt d){
        String result = "";
        try{
            String query="insert into bloodcare_donor(Donor_name,Donor_status,Donor_city,"
                    + "Donor_group,Donor_phone,Donor_mail,Donor_usr,Donor_pwd) values(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,d.getDonor_name());
            pstmt.setInt(2,d.getStatus());
            pstmt.setString(3,d.getDonor_city());
            pstmt.setString(4,d.getDonor_group());
            pstmt.setString(5,d.getDonor_phone());
            pstmt.setString(6,d.getDonor_mail());
            pstmt.setString(7,d.getDonor_usr());
            pstmt.setString(8,d.getDonor_pwd());
            
            
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
    public static String updateDonor(Donor_Dt d){
        String result="";
        try{
            String query="Update bloodcare_donor set Donor_name=?,Donor_status=?,Donor_city=?,"
                    + "Donor_group=?,Donor_phone=?,Donor_mail=?,Donor_usr=?,Donor_pwd=? where id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,d.getDonor_name());
            pstmt.setInt(2,d.getStatus());
            pstmt.setString(3,d.getDonor_city());
            pstmt.setString(4,d.getDonor_group());
            pstmt.setString(5,d.getDonor_phone());
            pstmt.setString(6,d.getDonor_mail());
            pstmt.setString(7,d.getDonor_usr());
            pstmt.setString(8,d.getDonor_pwd());
            
            pstmt.setInt(9,d.getDonor_id());
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
    public static String deleteDonor(int d_id){
        String result="";
        try{   
            String query="Delete from bloodcare_donor where id="+d_id+";";
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
    public static Donor_Dt showDonorById(int d_id){
        Donor_Dt d=null;
        try{
            String query="select * from bloodcare_donor where id ="+d_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                d=new Donor_Dt();
                System.out.print(rs.getString(2));
                d.setDonor_id(rs.getInt(1));
                d.setDonor_name(rs.getString(2));
                d.setStatus(rs.getInt(3));
                d.setDonor_city(rs.getString(4));
                d.setDonor_group(rs.getString(5));
                d.setDonor_phone(rs.getString(6));
                d.setDonor_mail(rs.getString(7));
                d.setDonor_usr(rs.getString(8));
                d.setDonor_pwd(rs.getString(9));
                
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return d;
    } 

 //Bank Details Show By id
    public static Donor_Dt showDonorByUser(String donor){
        Donor_Dt d=null;
        try{
            String query="Select * from bloodcare_donor where Donor_usr='"+donor+"';";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                d=new Donor_Dt();
                d.setDonor_id(rs.getInt(1));
                d.setDonor_name(rs.getString(2));
                d.setStatus(rs.getInt(3));
                d.setDonor_city(rs.getString(4));
                d.setDonor_group(rs.getString(5));
                d.setDonor_phone(rs.getString(6));
                d.setDonor_mail(rs.getString(7));
                d.setDonor_usr(rs.getString(8));
                d.setDonor_pwd(rs.getString(9));
                d=null; 
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return d;
    } 

 //All Donors   
    public static ArrayList<Donor_Dt> getAllCamps(){
        ArrayList<Donor_Dt>list=new ArrayList<>();
        try{
            String query="Select * from bloodcare_bloodpackets;";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            Donor_Dt d;
            while(rs.next()){
                
                d=new Donor_Dt();
                d.setDonor_id(rs.getInt(1));
                d.setDonor_name(rs.getString(2));
                d.setStatus(rs.getInt(3));
                d.setDonor_city(rs.getString(4));
                d.setDonor_group(rs.getString(5));
                d.setDonor_phone(rs.getString(6));
                d.setDonor_mail(rs.getString(7));
                d.setDonor_usr(rs.getString(8));
                d.setDonor_pwd(rs.getString(9));
                list.add(d);
                d=null; 
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
    
    //Max Donor ID
    public static int getMaxDonor(){
         int id=0;
         try{
              String query="select max(id) from bloodcare_donor;";
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

}
