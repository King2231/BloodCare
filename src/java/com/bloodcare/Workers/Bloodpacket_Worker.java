/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare.Workers;
import com.bloodcare.DatabaseConnector;
import com.bloodcare.DateWorker;
import com.bloodcare.POJO.Bloodpacket_Dt;
import com.bloodcare.Results;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author Ravi
 */
public class Bloodpacket_Worker {
public static String addBloodpacket(Bloodpacket_Dt bpd){
        String result = "";
        try{
            String query="insert into bloodcare_bloodpackets(packet_status,packet_cdate,packet_bdate,"
                    + "packetC_id,packetD_id,UniqueCode) values(?,?,?,?,?,?)";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setInt(1,bpd.getPacket_status());
            pstmt.setString(2,bpd.getCampdate());
            pstmt.setString(3,bpd.getBankdate());
            pstmt.setInt(4,bpd.getPcamp_id());
            pstmt.setInt(5,bpd.getPdonor_id());
            pstmt.setString(6,Integer.toString(bpd.getPcamp_id())+Integer.toString(bpd.getPdonor_id())+DateWorker.convertTopattern(bpd.getCampdate()));
            System.out.println("Inserting bloodpacket");
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
    public static String updatePacket(Bloodpacket_Dt bpd){
        String result="";
        try{
            String query="Update bloodcare_bloodpackets set packet_status=?,packet_cdate=?,packet_bdate=?,"
                    + "packetC_id=?,packetD_id=?,UniqueCode=? where id=?";
            PreparedStatement pstmt=DatabaseConnector.getPreparedStatement(query);
            pstmt.setInt(1,bpd.getPacket_status());
            pstmt.setString(2,bpd.getCampdate());
            pstmt.setString(3,bpd.getBankdate());
            pstmt.setInt(4,bpd.getPcamp_id());
            pstmt.setInt(5,bpd.getPdonor_id());
            pstmt.setString(6, bpd.getUniquecode());
            pstmt.setInt(7,bpd.getPacket_id());
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
    public static String deletePacket(int bcd_id){
        String result="";
        try{   
            String query="Delete from bloodcare_bloodpackets where id="+bcd_id+";";
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
    public static Bloodpacket_Dt showPacketById(int bpd_id){
        Bloodpacket_Dt bpd=null;
        try{
            String query="Select * from bloodcare_bloodpackets where id ="+bpd_id+";";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                bpd=new Bloodpacket_Dt();
                bpd.setPacket_id(rs.getInt(1));
                bpd.setPacket_status(rs.getInt(2));
                bpd.setCampdate(rs.getString(3));
                bpd.setBankdate(rs.getString(4));
                bpd.setPcamp_id(rs.getInt(5));
                bpd.setPdonor_id(rs.getInt(6));
                bpd.setUniquecode(rs.getString(7));
                bpd=null; 
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return bpd;
    }
//Bank Details Show By id
    public static Bloodpacket_Dt showPacketByCode(String code){
        Bloodpacket_Dt bpd=null;
        try{
            String query="Select * from bloodcare_bloodpackets where UniqueCode ='"+code+"';";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            if(rs.next()){
                bpd=new Bloodpacket_Dt();
                bpd.setPacket_id(rs.getInt(1));
                bpd.setPacket_status(rs.getInt(2));
                bpd.setCampdate(rs.getString(3));
                bpd.setBankdate(rs.getString(4));
                bpd.setPcamp_id(rs.getInt(5));
                bpd.setPdonor_id(rs.getInt(6));
                bpd.setUniquecode(rs.getString(7));
            } 
        }
        catch(Exception e){
             e.printStackTrace();
        }
        finally{
             DatabaseConnector.close();
        }
        return bpd;
    } 
//get all packets   
    public static ArrayList<Bloodpacket_Dt> getAllPackets(){
        ArrayList<Bloodpacket_Dt>list=new ArrayList<>();
        try{
            String query="Select * from bloodcare_bloodpackets;";
            ResultSet rs=DatabaseConnector.getResultSet(query);
            Bloodpacket_Dt bpd;
            while(rs.next()){
                bpd=new Bloodpacket_Dt();
                bpd.setPacket_id(rs.getInt(1));
                bpd.setPacket_status(rs.getInt(2));
                bpd.setCampdate(rs.getString(3));
                bpd.setBankdate(rs.getString(4));
                bpd.setPcamp_id(rs.getInt(5));
                bpd.setPdonor_id(rs.getInt(6));
                bpd.setUniquecode(rs.getString(7));
                list.add(bpd);
                bpd=null; 
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