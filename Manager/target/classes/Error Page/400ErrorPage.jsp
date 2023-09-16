<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="com.Manager.servlets.IndexServlet" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>400 Error Page</title>
    <style><%@include file="style.css"%></style>
</head>
<body>
<div id="error-page">
    <div class="content">
        <h2 class="header" data-text="400">
            400
        </h2>
        <h4 data-text="Неправильно заполнена форма">
            Неправильно заполнена форма
        </h4>
        <p>
            Скорее всего ты не заполнил имя или цену, либо в полях присутствовала кавычка: (')
        </p>
        <div class="btns">
            <a href="/">Вернуться на главную</a>

        </div>
    </div>
</div>
</body>
</html>