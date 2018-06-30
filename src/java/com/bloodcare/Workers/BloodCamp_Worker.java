/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare.Workers;

import com.bloodcare.DatabaseConnector;
import com.bloodcare.POJO.Bloodcamp_Dt;
import com.bloodcare.Results;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Ravi
 */
public class BloodCamp_Worker {
    public static String addBloodcamp(Bloodcamp_Dt bcd){
        String result = "";
        try{
            String query="insert into bloodcare_bloodcamp(camp_name,camp_status,camp_building,"
                    + "camp_area,camp_city,camp_pin,"
                    + "camp_organizer,bbank_id,camp_pwd,camp_date) values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,bcd.getCamp_name());
            pstmt.setInt(2,bcd.getCamp_status());
            pstmt.setString(3,bcd.getCamp_building());
            pstmt.setString(4,bcd.getCamp_area());
            pstmt.setString(5,bcd.getCamp_city());
            pstmt.setString(6,bcd.getCamp_pin());
            pstmt.setString(7,bcd.getCamp_organizer());
            pstmt.setInt(8,bcd.getBank_id());
            pstmt.setString(9, bcd.getCamp_pwd());
            pstmt.setString(10,bcd.getCamp_date());
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
    public static String updateCamp(Bloodcamp_Dt bcd){
        String result="";
        try{
            String query="Update bloodcare_bloodcamp set camp_name=?,camp_status=?,camp_building=?,"
                    + "camp_area,camp_city=?,camp_pin=?,"
                    + "camp_organizer=?,bbank_id=?,camp_pwd=?,camp_date=? where id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,bcd.getCamp_name());
            pstmt.setInt(2,bcd.getCamp_status());
            pstmt.setString(3,bcd.getCamp_building());
            pstmt.setString(4,bcd.getCamp_area());
            pstmt.setString(5,bcd.getCamp_city());
            pstmt.setString(6,bcd.getCamp_pin());
            pstmt.setString(7,bcd.getCamp_organizer());
            pstmt.setInt(8,bcd.getBank_id());
            pstmt.setString(9,bcd.getCamp_pwd());
            pstmt.setString(10,bcd.getCamp_date());
            pstmt.setInt(10,bcd.getCamp_id());
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
    public static String deleteCamp(int bcd_id){
        String result="";
        try{   
            String query="Delete from bloodcare_bloodcamp where id="+bcd_id+";";
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
    public static Bloodcamp_Dt showCampById(int bcd_id){
        Bloodcamp_Dt bcd=null;
        try{
            String query="Select * from bloodcare_bloodcamp where id ="+bcd_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                bcd=new Bloodcamp_Dt();
                bcd.setCamp_id(rs.getInt(1));
                bcd.setCamp_name(rs.getString(2));
                bcd.setCamp_status(rs.getInt(3));
                bcd.setCamp_building(rs.getString(4));
                bcd.setCamp_area(rs.getString(5));
                bcd.setCamp_city(rs.getString(6));
                bcd.setCamp_pin(rs.getString(7));
                bcd.setCamp_organizer(rs.getString(8));
                bcd.setBank_id(rs.getInt(9));
                bcd.setCamp_pwd(rs.getString(10));
                bcd.setCamp_date(rs.getString(11));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return bcd;
    } 

//Camp by user
    public static Bloodcamp_Dt showCampByUser(String user){
        Bloodcamp_Dt bcd=null;
        try{
            String query="Select * from bloodcare_bloodcamp where camp_name='"+user+"';";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                bcd=new Bloodcamp_Dt();
                bcd.setCamp_id(rs.getInt(1));
                bcd.setCamp_name(rs.getString(2));
                bcd.setCamp_status(rs.getInt(3));
                bcd.setCamp_building(rs.getString(4));
                bcd.setCamp_area(rs.getString(5));
                bcd.setCamp_city(rs.getString(6));
                bcd.setCamp_pin(rs.getString(7));
                bcd.setCamp_organizer(rs.getString(8));
                bcd.setBank_id(rs.getInt(9));
                bcd.setCamp_pwd(rs.getString(10));
                bcd.setCamp_date(rs.getString(11));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return bcd;
    } 

//All camps    
    public static ArrayList<Bloodcamp_Dt> getAllCamps(){
        ArrayList<Bloodcamp_Dt>list=new ArrayList<>();
        try{
            String query="Select * from bloodcare_bloodcamp;";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            Bloodcamp_Dt bcd;
            while(rs.next()){
                
                bcd=new Bloodcamp_Dt();
                bcd.setCamp_id(rs.getInt(1));
                bcd.setCamp_name(rs.getString(2));
                bcd.setCamp_status(rs.getInt(3));
                bcd.setCamp_building(rs.getString(4));
                bcd.setCamp_area(rs.getString(5));
                bcd.setCamp_city(rs.getString(6));
                bcd.setCamp_pin(rs.getString(7));
                bcd.setCamp_organizer(rs.getString(8));
                bcd.setBank_id(rs.getInt(9));
                bcd.setCamp_pwd(rs.getString(10));
                bcd.setCamp_date(rs.getString(11));

                list.add(bcd);
                bcd=null; 
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
