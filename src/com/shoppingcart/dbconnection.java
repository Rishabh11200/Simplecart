package com.shoppingcart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class dbconnection {
	
	public static Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/shoppingcart?useTimezone=true&serverTimezone=UTC";
        String uname = "root";
        String pass = "";
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, uname, pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void closeConnection(PreparedStatement pr, Connection con) {
        try {
            if (pr != null) {
                pr.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
    }

}
