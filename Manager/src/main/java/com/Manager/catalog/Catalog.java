package com.Manager.catalog;

import com.Manager.Product.Product;
import com.Manager.db_connection.DB_ProductControl;
import com.Manager.util.product.ProductUtil;

import java.sql.SQLException;
import java.util.List;

public class Catalog {
    public static String getCatalog() {
        List<Product> productList = null;
        try {
            productList = DB_ProductControl.getAllProducts();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(productList == null)
            return "";

        StringBuilder builder = new StringBuilder();
        for(Product product : productList)
            builder.append(ProductUtil.getProductCard(product));

        return builder.toString();
    }
}
