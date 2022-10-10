/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;

/**
 *
 * @author PhucPhan
 */
public class DBconnection {

    private static Connection conn = null;

    public static Connection getConnection() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost/lab01";
                conn = DriverManager.getConnection(url, "root", "");
            } catch (ClassNotFoundException ex) {
                java.util.logging.Logger.getLogger(DBconnection.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(DBconnection.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return conn;
    }

    public void closeConnection() {
        try {
            if (conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DBconnection.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
