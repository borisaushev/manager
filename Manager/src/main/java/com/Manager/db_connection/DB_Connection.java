package com.Manager.db_connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DB_Connection {

    private static Statement statement;

    public static Statement getStatement() {
        if(statement == null) {
            String url = "jdbc:postgresql:manager";
            String user = "postgres";
            String password = "123";
            try {
                Class.forName("org.postgresql.Driver");
                Connection connection = DriverManager.getConnection(url, user, password);
                statement = connection.createStatement();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return statement;
    }
}
