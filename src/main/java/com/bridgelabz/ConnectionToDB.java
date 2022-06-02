package com.bridgelabz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionToDB{

        static Connection getConnection() throws SQLException {
            String jdbcURL = "jdbc:mysql://localhost:3306/payroll_service?useSSL=false";
            String userName ="root";
            String password = "welcome123";
            Connection connection;
            connection= DriverManager.getConnection(jdbcURL,userName,password);
            System.out.println("DB Connected Successfully");
            return connection;
        }
    }




