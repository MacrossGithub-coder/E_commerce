package org.macross.entity;

public class JSONIO {
    private String result;
    private int new_account;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public int getNew_account() {
        return new_account;
    }

    public void setNew_account(int new_account) {
        this.new_account = new_account;
    }

    @Override
    public String toString() {
        return "other{" +
                "result='" + result + '\'' +
                ", new_account=" + new_account +
                '}';
    }
}
