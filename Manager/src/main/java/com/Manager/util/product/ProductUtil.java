package com.Manager.util.product;

import com.Manager.Product.Product;

public class ProductUtil {
    public static String getProductCard(Product product) {
        StringBuilder builder = new StringBuilder();

        String productName = product.getName();
        if(productName.length() > 30)
            productName = productName.substring(0, 28) + "...";

        builder.append("<div class=\"product-card\">");
        builder.append(product.getEncodedPhoto());
        builder.append("<h2 class=\"product-name\">" + productName + "</h2>");
        builder.append("<p class=\"product-price\">" + product.getPrice() + "</p>");
        builder.append("<a href=\"product/" + product.getName() + "?name=" + product.getName() + "\" class=\"buy-button\">Изменить</a>");
        builder.append("</div>");

        return builder.toString();
    }
}
