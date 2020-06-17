package org.macross.entity;

public class User {
    private String username;
    private String usermobilephone;
    private String userpassword;
    private String useraddress;

    public User(String username, String usermobilephone, String userpassword, String useraddress) {
        this.username = username;
        this.usermobilephone = usermobilephone;
        this.userpassword = userpassword;
        this.useraddress = useraddress;
    }
    public User() {
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsermobilephone() {
        return usermobilephone;
    }

    public void setUsermobilephone(String usermobilephone) {
        this.usermobilephone = usermobilephone;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", usermobilephone='" + usermobilephone + '\'' +
                ", userpassword='" + userpassword + '\'' +
                ", useraddress='" + useraddress + '\'' +
                '}';
    }
}
