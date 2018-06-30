/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare.Workers;

import com.bloodcare.DatabaseConnector;
import com.bloodcare.POJO.Transaction_Dt;
import com.bloodcare.Results;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Ravi
 */
public class Transaction_Worker {
   public static String addTransaction(Transaction_Dt td){
        String result = "";
        try{
            String query="insert into bloodcare_transactor(trans_group,trans_units,trans_date,bbank_id,hosp_id,request_id) values(?,?,?,?,?,?)";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,td.getTrans_group());
            pstmt.setInt(2,td.getTrans_units());
            pstmt.setString(3,td.getTrans_date());
            pstmt.setInt(4,td.getTrans_bid());
            pstmt.setInt(5,td.getTrans_hid());
            pstmt.setInt(6,td.getTrans_rid());
            
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

//Update Transaction By id
    public static String updateHospReq(Transaction_Dt td){
        String result="";
        try{
            String query="Update bloodcare_transactor set trans_group=?,trans_units=?,trans_date=?,bbank_id=?,hosp_id=?,request_id=? where id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setString(1,td.getTrans_group());
            pstmt.setInt(2,td.getTrans_units());
            pstmt.setString(3,td.getTrans_date());
            pstmt.setInt(4,td.getTrans_bid());
            pstmt.setInt(5,td.getTrans_hid());
            pstmt.setInt(6,td.getTrans_rid());
            
            pstmt.setInt(7,td.getTrans_id());
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

//Delete Transaction By id
    public static String deleteTransaction(int td_id){
        String result="";
        try{   
            String query="Delete from bloodcare_transactor where id="+td_id+";";
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
 //Transaction Details Show By id
    public static Transaction_Dt showTransactionById(int td_id){
        Transaction_Dt td=null;
        try{
            String query="Select * from bloodcare_transactor where id ="+td_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                td=new Transaction_Dt();
                td.setTrans_id(rs.getInt(1));
                td.setTrans_group(rs.getString(2));
                td.setTrans_units(rs.getInt(3));
                td.setTrans_date(rs.getString(4));
                td.setTrans_bid(rs.getInt(5));
                td.setTrans_hid(rs.getInt(6));
                td.setTrans_rid(rs.getInt(7));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return td;
    } 

//All Transactions    
    public static ArrayList<Transaction_Dt> getAllCamps(){
        ArrayList<Transaction_Dt>list=new ArrayList<>();
        try{
            String query="Select * from bloodcare_transactor;";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            Transaction_Dt td;
            while(rs.next()){
                td=new Transaction_Dt();
                td.setTrans_id(rs.getInt(1));
                td.setTrans_group(rs.getString(2));
                td.setTrans_units(rs.getInt(3));
                td.setTrans_date(rs.getString(4));
                td.setTrans_bid(rs.getInt(5));
                td.setTrans_hid(rs.getInt(6));
                td.setTrans_rid(rs.getInt(7));
                list.add(td);
                td=null; 
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
