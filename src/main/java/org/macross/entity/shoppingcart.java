package org.macross.entity;

import java.util.Date;

public class shoppingcart {
    private String uname;
    private int id;
    private String gname;
    private String gprice;
    private String gsrc;
    private int count;
    private int total_price;
    private String date;

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGprice() {
        return gprice;
    }

    public void setGprice(String gprice) {
        this.gprice = gprice;
    }

    public String getGsrc() {
        return gsrc;
    }

    public void setGsrc(String gsrc) {
        this.gsrc = gsrc;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "shoppingcart{" +
                "uname='" + uname + '\'' +
                ", id=" + id +
                ", gname='" + gname + '\'' +
                ", gprice='" + gprice + '\'' +
                ", gsrc='" + gsrc + '\'' +
                ", count=" + count +
                ", total_price=" + total_price +
                ", date='" + date + '\'' +
                '}';
    }
}
