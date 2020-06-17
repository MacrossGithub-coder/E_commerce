package org.macross.entity;

public class apple {
    private int g_id;
    private String g_name;
    private String g_price;
    private String g_src;
    private String g_headersrc;
    private String g_infosrc;


    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public String getG_name() {
        return g_name;
    }

    public void setG_name(String g_name) {
        this.g_name = g_name;
    }

    public String getG_headersrc() {
        return g_headersrc;
    }

    public void setG_headersrc(String g_headersrc) {
        this.g_headersrc = g_headersrc;
    }

    public String getG_infosrc() {
        return g_infosrc;
    }

    public void setG_infosrc(String g_infosrc) {
        this.g_infosrc = g_infosrc;
    }

    public String getG_price() {
        return g_price;
    }

    public void setG_price(String g_price) {
        this.g_price = g_price;
    }

    public String getG_src() {
        return g_src;
    }

    public void setG_src(String g_src) {
        this.g_src = g_src;
    }

    @Override
    public String toString() {
        return "apple{" +
                "g_id=" + g_id +
                ", g_name='" + g_name + '\'' +
                ", g_price='" + g_price + '\'' +
                ", g_src='" + g_src + '\'' +
                ", g_headersrc='" + g_headersrc + '\'' +
                ", g_infosrc='" + g_infosrc + '\'' +
                '}';
    }
}
