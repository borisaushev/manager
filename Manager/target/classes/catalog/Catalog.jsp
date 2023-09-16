<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="com.Manager.catalog.Catalog" %>


<html lang="ru"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Каталог</title>
    <style><%@include file="/target/classes/catalog/Catalog.css"%></style>
    <style><%@include file="/target/classes/navigation bar/NavBar.css"%></style>
</head>

<body style="background: #212327;">

<div class="navigation-panel">
    <a class="link" href="/магазин">МАГАЗИН</a>
    <a class="link" href="/">ГЛАВНАЯ</a>
    <a class="chosen-link" href="/catalog">КАТАЛОГ</a>
</div>

<div class="cards">
    <%=Catalog.getCatalog()%>
</div>



</body></html>