package com.models;


import java.sql.Date;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author PhucPhan
 */
public class Account {
    public String username;
    public String password;
    public String fullname;
    public String gender;
    public Date birthday;
    public String department;

    public Account() {
    }

    public Account(String username, String password, String fullname, String gender, Date birthday, String department) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.gender = gender;
        this.birthday = birthday;
        this.department = department;
    }

}
