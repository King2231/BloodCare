/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bloodcare.POJO;

/**
 *
 * @author Ravi
 */
public class Bloodpacket_Dt {
   int packet_id,packet_status,pbank_id,pcamp_id,pdonor_id;
   String campdate, bankdate,uniquecode;

    public String getUniquecode() {
        return uniquecode;
    }

    public void setUniquecode(String uniquecode) {
        this.uniquecode = uniquecode;
    }

    public int getPacket_id() {
        return packet_id;
    }

    public void setPacket_id(int packet_id) {
        this.packet_id = packet_id;
    }

    public int getPacket_status() {
        return packet_status;
    }

    public void setPacket_status(int packet_status) {
        this.packet_status = packet_status;
    }

    public int getPbank_id() {
        return pbank_id;
    }

    public void setPbank_id(int pbank_id) {
        this.pbank_id = pbank_id;
    }

    public int getPcamp_id() {
        return pcamp_id;
    }

    public void setPcamp_id(int pcamp_id) {
        this.pcamp_id = pcamp_id;
    }

    public int getPdonor_id() {
        return pdonor_id;
    }

    public void setPdonor_id(int pdonor_id) {
        this.pdonor_id = pdonor_id;
    }

    public String getCampdate() {
        return campdate;
    }

    public void setCampdate(String campdate) {
        this.campdate = campdate;
    }

    public String getBankdate() {
        return bankdate;
    }

    public void setBankdate(String bankdate) {
        this.bankdate = bankdate;
    }
}
