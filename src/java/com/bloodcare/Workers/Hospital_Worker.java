/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare.Workers;

import com.bloodcare.DatabaseConnector;
import com.bloodcare.POJO.Hospital_Dt;
import com.bloodcare.Results;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Ravi
 */
public class Hospital_Worker {
    public static String addHospital(Hospital_Dt hd){
        String result = "";
        try{
            String query="insert into bloodcare_hospital(hosp_name,hosp_building,"
                    + "hosp_area,hosp_city,hosp_pin,"
                    + "hosp_mail,hosp_wsite,hosp_pwd,hosp_usr) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,hd.getHosp_name());
            pstmt.setString(2,hd.getHosp_building());
            pstmt.setString(3,hd.getHosp_area());
            pstmt.setString(4,hd.getHosp_city());
            pstmt.setString(5,hd.getHosp_pin());
            pstmt.setString(6,hd.getHosp_mail());
            pstmt.setString(7,hd.getHosp_wsite());
            pstmt.setString(8, hd.getHosp_pwd());
            pstmt.setString(9, hd.getHosp_usr());
            
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

//Update Hospital By id
    public static String updateHospital(Hospital_Dt hd){
        String result="";
        try{
            String query="Update bloodcare_hospital set hosp_name=?,hosp_building=?,"
                    + "hosp_area=?,hosp_city=?,hosp_pin=?,"
                    + "hosp_mail=?,hosp_wsite=?,hosp_pwd=?,hosp_usr=? where id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,hd.getHosp_name());
            pstmt.setString(2,hd.getHosp_building());
            pstmt.setString(3,hd.getHosp_area());
            pstmt.setString(4,hd.getHosp_city());
            pstmt.setString(5,hd.getHosp_pin());
            pstmt.setString(6,hd.getHosp_mail());
            pstmt.setString(7,hd.getHosp_wsite());
            pstmt.setString(8, hd.getHosp_pwd());
            pstmt.setString(9, hd.getHosp_usr());
            pstmt.setInt(10,hd.getHospital_id());
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

//Delete Hospital By id
    public static String deleteHospital(int hd_id){
        String result="";
        try{   
            String query="Delete from bloodcare_hospital where id="+hd_id+";";
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
 //Hospital Details Show By id
    public static Hospital_Dt showHospitalById(int hd_id){
        Hospital_Dt hd=null;
        try{
            String query="Select * from bloodcare_hospital where id ="+hd_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                hd=new Hospital_Dt();
                hd.setHospital_id(rs.getInt(1));
                hd.setHosp_name(rs.getString(2));
                hd.setHosp_building(rs.getString(3));
                hd.setHosp_area(rs.getString(4));
                hd.setHosp_city(rs.getString(5));
                hd.setHosp_pin(rs.getString(6));
                hd.setHosp_mail(rs.getString(7));
                hd.setHosp_wsite(rs.getString(8));
                hd.setHosp_pwd(rs.getString(9));
                hd.setHosp_usr(rs.getString(10));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return hd;
    } 
 //Hospital Details Show By user
    public static Hospital_Dt showHospitalByUser(String user){
        Hospital_Dt hd=null;
        try{
            String query="Select * from bloodcare_hospital where hosp_usr ='"+user+"';";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                hd=new Hospital_Dt();
                hd.setHospital_id(rs.getInt(1));
                hd.setHosp_name(rs.getString(2));
                hd.setHosp_building(rs.getString(3));
                hd.setHosp_area(rs.getString(4));
                hd.setHosp_city(rs.getString(5));
                hd.setHosp_pin(rs.getString(6));
                hd.setHosp_mail(rs.getString(7));
                hd.setHosp_wsite(rs.getString(8));
                hd.setHosp_pwd(rs.getString(9));
                hd.setHosp_usr(rs.getString(10));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return hd;
    } 
//All Hospitals    
    public static ArrayList<Hospital_Dt> getAllHospitals(){
        ArrayList<Hospital_Dt>list=new ArrayList<>();
        try{
            String query="Select * from bloodcare_hospital;";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            Hospital_Dt hd;
            while(rs.next()){
                hd=new Hospital_Dt();
                hd.setHospital_id(rs.getInt(1));
                hd.setHosp_name(rs.getString(2));
                hd.setHosp_building(rs.getString(3));
                hd.setHosp_area(rs.getString(4));
                hd.setHosp_city(rs.getString(5));
                hd.setHosp_pin(rs.getString(6));
                hd.setHosp_mail(rs.getString(7));
                hd.setHosp_wsite(rs.getString(8));
                hd.setHosp_pwd(rs.getString(9));
                hd.setHosp_usr(rs.getString(10));
                list.add(hd);
                hd=null; 
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
