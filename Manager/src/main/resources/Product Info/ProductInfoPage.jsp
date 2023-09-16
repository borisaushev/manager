<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="com.Manager.db_connection.DB_ProductControl" %>
<%@ page import="com.Manager.Product.Product" %>

<html xml:lang="ru" lang="ru" class="bx-core bx-win bx-no-touch bx-no-retina bx-chrome"><head><meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, width=device-width">

    <title>Редактировать</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
    body.landing-page-transition::after {
        background: #fff;
    }
</style>
    <style>
    body {
        --landing-font-family: Open Sans
    }
</style>
    <link rel="stylesheet" href="https://fonts.bitrix24.ru/css2?family=Open+Sans:wght@100;200;300;400;500;600;700;800;900">
    <link type="text/css" rel="stylesheet" href="https://b24-33r99u.bitrix24.ru/bitrix/js/imopenlines/widget/styles.min.css?r=1692800934-34"><link type="text/css" rel="stylesheet" href="https://b24-33r99u.bitrix24.ru/bitrix/js/crm/site/form/dist/app.bundle.min.css?19592">
    <style><%@include file="/target/classes/Main Page/index.css"%></style>
    <style><%@include file="/target/classes/navigation bar/NavBar.css"%></style>

</head>
<body class="landing-b24button-use-style"  style="background: #212327;">
<div class="navigation-panel">
    <a class="link" href="/магазин">МАГАЗИН</a>
    <a class="link" href="/">ГЛАВНАЯ</a>
    <a class="link" href="/catalog">КАТАЛОГ</a>
</div>
<main class="w-100 landing-public-mode">
    <div class="b24-form2">
        <div id="b24-26296573477241867951087490933693" data-styles-apllied="true" class="b24-form-dark">
            <div class="b24-form-wrapper2 b24-form-shadow b24-form-border-bottom2">
                <div class="b24-form-header b24-form-padding-side">
                    <div class="b24-form-header-title">Редактировать товар</div>
                    <div class="b24-form-header-description">не смей ниче ломать</div>
                </div> <div class="b24-form-content b24-form-padding-side">

                <% String name = request.getParameter("name"); %>
                <% Product product = DB_ProductControl.getProductByName(name); %>

                <form method="post" action=<%= "\"" + "/product/" + name + "?prevname=" + name + "\"" %> accept-charset="utf-8" enctype="multipart/form-data" novalidate="novalidate"><!---->

                    <div><div class="b24-form-field b24-form-field-name b24-form-control-string b24-form-control-alert"><div><div>
                        <div class="b24-form-control-container b24-form-control-icon-after">
                            <input name="name" id="name" autocomplete="given-name" type="text" class="b24-form-control" placeholder=" " value=<%= "\"" + name + "\"" %> required>
                            <div class="b24-form-control-label">
                                Название
                                <span class="b24-form-control-required">*</span>
                            </div> <!----> <!----> </div></div> <!----> <!----></div> <!----></div>

                        <!-- TODO: Добавить цену в продукт -->
                        <div class="b24-form-field b24-form-field-string b24-form-control-string b24-form-control-alert"><div><div>
                            <div class="b24-form-control-container b24-form-control-icon-after">
                                <input name="price" id="price" type="text" class="b24-form-control" placeholder=" " value=<%= "\"" + product.getPrice().trim() + "\"" %> required>
                                <div class="b24-form-control-label">
                                    Цена
                                    <span class="b24-form-control-required">*</span>
                                </div> <!----> <!----> </div></div> <!----> <!----></div> <!----></div>

                        <div class="b24-form-field b24-form-field-text b24-form-control-text"><div><div>
                            <div class="b24-form-control-container b24-form-control-icon-after">
                                <textarea class="b24-form-control" id="description" name="description" style="height: 120px;" placeholder=" "><% if(product.getDescription() != null) {%><%=product.getDescription().trim()%><%}%></textarea>
                                <div class="b24-form-control-label">
                                    Комментарий
                                    <span class="b24-form-control-required" style="display: none;">*</span>
                                </div> <!----> <div class="b24-form-control-alert-message" style="display: none;">
                                </div></div></div> <!----> <!----></div> <!----></div>

                        <div class="b24-form-field b24-form-field-file b24-form-control-file2"><!----> <div>
                            <div class="b24-form-control-container">
                                <div class="b24-form-control-label">
                                    Фото
                                    <span class="b24-form-control-required" style="display: none;">*</span>
                                    <div hidden="hidden" v-bind="0" class="b24-form-control-field-file-summary-size">
                                        <span class="b24-form-control-field-file-summary-size-text">0.00 / 15 МБ</span>
                                    </div>
                                </div>

                                <%=product.getEncodedPhoto()%>

                                <div class="b24-form-control-filelist"><div><!---->
                                    <div class="b24-form-control-file-item-empty" style="display: none;">
                                        <span class="b24-form-control-string">Файл загружается...</span>
                                    </div> <div class="b24-form-control-file-item-empty">
                                        <label class="b24-form-control2">➕ Выбрать файл
                                            <input name="photo" id="photo" type="file" accept="image/*,.jpeg,.png,.ico" style="display: none; value=">
                                        </label>
                                        <div class="b24-form-control-alert-message">

                                        </div></div></div>
                                    <div class="b24-form-control-alert-message" style="display: none;">

                        </div></div></div> <!----></div></div></div>

                    <div> <div class="v-portal" style="display: none;"></div></div> <!---->
                    <div class="b24-form-btn-container"><!----> <!---->
                        <div class="b24-form-btn-block">
                            <button type="submit" class="b24-form-btn">
                                Изменить
                            </button></div></div>
                    <span style="color: red; display: none;">
                        Debug: fill fields
                    </span>
                    </form>

                    <form method="post" action=<%= "\"/product/" + name + "/delete" + "?prevname=" + name + "\"" %> accept-charset="utf-8">
                    <div class="b24-form-btn-container"><!----> <!---->
                        <div class="b24-form-btn-block">
                            <button type="submit" class="b24-form-delete-btn">
                                Удалить
                            </button></div></div>
                    </form>

                    </div>   </div></div></div>
</main>
</body></html>