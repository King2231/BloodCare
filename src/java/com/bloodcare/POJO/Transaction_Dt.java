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
public class Transaction_Dt {
    int trans_id,trans_rid,trans_bid,trans_hid,trans_units;

    public int getTrans_id() {
        return trans_id;
    }

    public void setTrans_id(int trans_id) {
        this.trans_id = trans_id;
    }

    public int getTrans_rid() {
        return trans_rid;
    }

    public void setTrans_rid(int trans_rid) {
        this.trans_rid = trans_rid;
    }

    public int getTrans_bid() {
        return trans_bid;
    }

    public void setTrans_bid(int trans_bid) {
        this.trans_bid = trans_bid;
    }

    public int getTrans_hid() {
        return trans_hid;
    }

    public void setTrans_hid(int trans_hid) {
        this.trans_hid = trans_hid;
    }

    public int getTrans_units() {
        return trans_units;
    }

    public void setTrans_units(int trans_units) {
        this.trans_units = trans_units;
    }

    public String getTrans_group() {
        return trans_group;
    }

    public void setTrans_group(String trans_group) {
        this.trans_group = trans_group;
    }

    public String getTrans_date() {
        return trans_date;
    }

    public void setTrans_date(String trans_date) {
        this.trans_date = trans_date;
    }
    String trans_group,trans_date;
}
