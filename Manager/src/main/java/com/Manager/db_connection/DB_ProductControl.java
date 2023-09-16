package com.Manager.db_connection;

import com.Manager.Product.Product;
import com.Manager.util.photo.PhotoUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import static com.Manager.util.photo.PhotoUtil.deletePhoto;
import static com.Manager.util.photo.PhotoUtil.storePhoto;

public class DB_ProductControl {

    public static List<Product> getAllProducts() throws SQLException {
        System.out.println("getting all products for catalog");

        Statement database = DB_Connection.getStatement();
        boolean hasResult = database.execute("SELECT * FROM products");

        if (hasResult) {
            List<Product> productList = new LinkedList<>();
            ResultSet resultSet = database.getResultSet();

            while(resultSet.next())
                productList.add(getProductFromResultSet(resultSet));

            return productList;
        }
        else
            return null;
    }

    public static void addProduct(Product product) {
        try {
            Statement database = DB_Connection.getStatement();
            String SQLCommand = SQLCommandBuilder.buildAddSQLCommand(product);
            System.out.println(SQLCommand);
            database.execute(SQLCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateProduct(Product product, String prevName) {
        try {
            System.out.println("updateProduct() " + product);
            Product previousProduct = getProductByName(prevName);
            if(previousProduct.getImage_path()!= null && !previousProduct.getImage_path().equals(product.getImage_path()))
                 PhotoUtil.deletePhoto(previousProduct.getImage_path());

            Statement database = DB_Connection.getStatement();
            String SQLCommand = SQLCommandBuilder.buildUpdateSQLCommand(product, prevName);
            System.out.println(SQLCommand);
            database.execute(SQLCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteProduct(String name) {
        try {
            Product product = getProductByName(name);
            if(product.getImage_path() != null)
                deletePhoto(product.getImage_path());

            Statement database = DB_Connection.getStatement();
            String SQLCommand = "DELETE FROM products WHERE name='" + name + "'";
            System.out.println(SQLCommand);
            database.execute(SQLCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static Product getProductFromResultSet(ResultSet resultSet) throws SQLException {
        String name = resultSet.getString("name");
        String price = resultSet.getString("price");

        String description = null;
        String image_path = null;

        if (resultSet.getString("description") != null)
            description = resultSet.getString("description");

        if (resultSet.getString("image_path") != null)
            image_path = resultSet.getString("image_path");

        Product product = new Product(name, price, description, image_path);
        System.out.println("Got product: " + product);
        return product;
    }

    private static class SQLCommandBuilder {

        private static String buildUpdateSQLCommand(Product product, String prevName) {
            StringBuilder SQLCommand = new StringBuilder();
            SQLCommand.append("UPDATE products ");

            SQLCommand.append("SET name=");
            String name = product.getName();
            SQLCommand.append("'" + name + "',");


            SQLCommand.append(" price=");
            String price = product.getPrice();
            SQLCommand.append("'" + price + "',");

            SQLCommand.append(" description=");
            String description = product.getDescription();
            if (description == null)
                SQLCommand.append("NULL,");
            else
                SQLCommand.append("'" + description + "',");

            SQLCommand.append(" image_path=");
            String image_path = product.getImage_path();
            if (image_path == null)
                SQLCommand.append("NULL");
            else
                SQLCommand.append("'" + image_path + "'");

            SQLCommand.append(" WHERE name = '" + prevName + "'");

            return SQLCommand.toString();
        }

        private static String buildAddSQLCommand(Product product) {
            StringBuilder SQLCommand = new StringBuilder();
            SQLCommand.append("INSERT INTO products (name, price");

            String values = "'" + product.getName() + "'";
            values += ", '" + product.getPrice() + "'";

            if(product.getDescription() != null) {
                SQLCommand.append(", description");
                values += ", '" + product.getDescription() + "'";
            }

            if(product.getImage_path() != null) {
                SQLCommand.append(", image_path");
                values += ", '" + product.getImage_path() + "'";
            }

            SQLCommand.append(") VALUES ( " + values + ")");

            return SQLCommand.toString();
        }

    }

    public static Product getProductByName(String productName) throws SQLException {

        System.out.println("Trying to get product: " + productName);

        Statement database = DB_Connection.getStatement();
        boolean hasResult = database.execute("SELECT * FROM products WHERE name = '" + productName + "'");

        if (hasResult) {
            ResultSet resultSet = database.getResultSet();
            resultSet.next();
            Product product = getProductFromResultSet(resultSet);
            System.out.println("got product " + product);

            return product;
        }
        else
            return null;

    }

}
