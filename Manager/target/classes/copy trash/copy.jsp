<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="com.Manager.db_connection.DB_ProductControl" %>
<%@ page import="com.Manager.Product.Product" %>

<!DOCTYPE html>
<html>
    <head>

        <link rel="preconnect" href="https://fonts.googleapis.com%22%3E/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@600&family=Open+Sans&family=Roboto:wght@300&display=swap" rel="stylesheet">
        <meta charset="utf-8">
        <title>Manager</title>

    </head>

    <style><%@include file="/target/classes/Product Info/ProductInfo.css"%></style>

    <body>

        <% String name = request.getParameter("name"); %>
        <% Product product = DB_ProductControl.getProductByName(name); %>

        <form action=<%= "\"" + "/product/" + name + "\"" %> accept-charset="utf-8" enctype="multipart/form-data" method="post">
            <p class="name">
                <label for="name">Название:</label>
                <input class="input_name" type="text" name="name" id="name" value=<%= "\"" + name + "\"" %> required>
            </p>
            <p class="desc">
                <label class="desc_text" for="description">Описание (необязательно):</label>
                <textarea id="description" name="description" rows="5" cols="33">
                    <% if(product.getDescription() != null) { %>
                        <%= product.getDescription().trim() %>
                    <% } %>
                </textarea>
            </p>


            <% if(product.getImage_path() != null) { %>
                <%= product.getEncodedPhoto() %>
            <% } %>


            <p class="photo">
                <label for="photo">Поменять фото:</label>

                <input id="photo" name="photo" type="file" accept="image/png, image/jpeg">
            </p>
            <button type="submit">Обновить</button>
        </form>

    </body>
</html>
