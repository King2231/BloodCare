/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare.Workers;

import com.bloodcare.DatabaseConnector;
import com.bloodcare.POJO.Hosprequest_Dt;
import com.bloodcare.Results;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Ravi
 */
public class Hosprequest_Worker {
    public static String addHosprequest(Hosprequest_Dt hrd){
        String result = "";
        try{
            String query="insert into bloodcare_hosprequests(req_patient,req_group,req_units,req_gdate,req_status,hosp_id) values(?,?,?,?,?,?)";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,hrd.getReq_patient());
            pstmt.setString(2,hrd.getReq_group());
            pstmt.setInt(3,hrd.getReq_units());
            pstmt.setString(4,hrd.getReq_gdate());
            pstmt.setInt(5,hrd.getReq_status());
            pstmt.setInt(6,hrd.getReq_hid());
            
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

//Update Hosprequest By id
    public static String updateHospReq(Hosprequest_Dt hrd){
        String result="";
        try{
            String query="Update bloodcare_hosprequests set req_patient=?,req_group=?,req_units=?,req_gdate=?,req_status=?,hosp_id=? where id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,hrd.getReq_patient());
            pstmt.setString(2,hrd.getReq_group());
            pstmt.setInt(3,hrd.getReq_units());
            pstmt.setString(4,hrd.getReq_gdate());
            pstmt.setInt(5,hrd.getReq_status());
            pstmt.setInt(6,hrd.getReq_hid());
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

//Delete Hosprequest By id
    public static String deleteReq(int hrd_id){
        String result="";
        try{   
            String query="Delete from bloodcare_hosprequests where id="+hrd_id+";";
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
 //Hosprequest Details Show By id
    public static Hosprequest_Dt showHosprequestById(int hrd_id){
        Hosprequest_Dt hrd=null;
        try{
            String query="Select * from bloodcare_hosprequests where id ="+hrd_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                hrd=new Hosprequest_Dt();
                hrd.setReq_id(rs.getInt(1));
                hrd.setReq_patient(rs.getString(2));
                hrd.setReq_group(rs.getString(3));
                hrd.setReq_units(rs.getInt(4));
                hrd.setReq_gdate(rs.getString(5));
                hrd.setReq_status(rs.getInt(6));
                hrd.setReq_hid(rs.getInt(7));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return hrd;
    } 

//All Hosprequests    
    public static ArrayList<Hosprequest_Dt> getAllHosprequests(){
        ArrayList<Hosprequest_Dt>list=new ArrayList<>();
        try{
            String query="Select * from bloodcare_hosprequests;";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            Hosprequest_Dt hrd;
            while(rs.next()){
                hrd=new Hosprequest_Dt();
                hrd.setReq_id(rs.getInt(1));
                hrd.setReq_patient(rs.getString(2));
                hrd.setReq_group(rs.getString(3));
                hrd.setReq_units(rs.getInt(4));
                hrd.setReq_gdate(rs.getString(5));
                hrd.setReq_status(rs.getInt(6));
                hrd.setReq_hid(rs.getInt(7));
                list.add(hrd);
                hrd=null; 
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

}
