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
public class Hosprequest_Dt {
    int req_id,req_units,req_status,req_hid;

    public int getReq_id() {
        return req_id;
    }

    public void setReq_id(int req_id) {
        this.req_id = req_id;
    }

    public int getReq_units() {
        return req_units;
    }

    public void setReq_units(int req_units) {
        this.req_units = req_units;
    }

    public int getReq_status() {
        return req_status;
    }

    public void setReq_status(int req_status) {
        this.req_status = req_status;
    }

    public int getReq_hid() {
        return req_hid;
    }

    public void setReq_hid(int req_hid) {
        this.req_hid = req_hid;
    }

    public String getReq_patient() {
        return req_patient;
    }

    public void setReq_patient(String req_patient) {
        this.req_patient = req_patient;
    }

    public String getReq_group() {
        return req_group;
    }

    public void setReq_group(String req_group) {
        this.req_group = req_group;
    }

    public String getReq_gdate() {
        return req_gdate;
    }

    public void setReq_gdate(String req_gdate) {
        this.req_gdate = req_gdate;
    }
    String req_patient,req_group,req_gdate;
}
