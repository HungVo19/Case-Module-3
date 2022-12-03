package com.example.online_electronics_store.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/product_c08?useSSL=false";
    private static String username = "root";
    private static String password = "123456";
    private static Connection connection;

    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, username, password);
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return  connection;
    }
}
