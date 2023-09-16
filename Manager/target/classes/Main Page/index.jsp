<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="com.Manager.servlets.IndexServlet" %>

<html xml:lang="ru" lang="ru" class="bx-core bx-win bx-no-touch bx-no-retina bx-chrome"><link type="text/css" id="dark-mode" rel="stylesheet" href=""><head><meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, width=device-width">

    <title>Добавление товаров</title>
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
    <style><%@include file="index.css"%></style>
    <style><%@include file="/target/classes/navigation bar/NavBar.css"%></style>

</head>
<body class="landing-b24button-use-style" style="background: #212327;">
<div class="navigation-panel">
    <a class="link" href="/магазин">МАГАЗИН</a>
    <a class="chosen-link" href="/">ГЛАВНАЯ</a>
    <a class="link" href="/catalog">КАТАЛОГ</a>
</div>
<main class="w-100 landing-public-mode">
    <div class="b24-form2">
        <div id="b24-26296573477241867951087490933693" data-styles-apllied="true" class="b24-form-dark">
            <div class="b24-form-wrapper2 b24-form-shadow b24-form-border-bottom2">
                <div class="b24-form-header b24-form-padding-side">
                    <div class="b24-form-header-title">Добавить товар</div>
                    <div class="b24-form-header-description">Тяжелее всего придумывать описание</div>
                </div> <div class="b24-form-content b24-form-padding-side">

                <form method="post" action="/product/new" accept-charset="utf-8" enctype="multipart/form-data" novalidate="novalidate"><!---->

                    <div><div class="b24-form-field b24-form-field-name b24-form-control-string b24-form-control-alert"><div><div>
                        <div class="b24-form-control-container b24-form-control-icon-after">
                            <input name="name" id="name" autocomplete="given-name" type="text" class="b24-form-control" placeholder=" " required>
                            <div class="b24-form-control-label">
                                Название
                                <span class="b24-form-control-required">*</span>
                            </div> <!----> <!----> </div></div> <!----> <!----></div> <!----></div>

                        <!-- TODO: Добавить цену в продукт -->
                        <div class="b24-form-field b24-form-field-string b24-form-control-string b24-form-control-alert"><div><div>
                            <div class="b24-form-control-container b24-form-control-icon-after">
                                <input name="price" id="price" type="text" class="b24-form-control" placeholder=" " required>
                                <div class="b24-form-control-label">
                                    Цена
                                    <span class="b24-form-control-required">*</span>
                                </div> <!----> <!----> </div></div> <!----> <!----></div> <!----></div>

                        <div class="b24-form-field b24-form-field-text b24-form-control-text"><div><div>
                            <div class="b24-form-control-container b24-form-control-icon-after">
                                <textarea class="b24-form-control" id="description" name="description" style="height: 120px;" placeholder=" "></textarea>
                                <div class="b24-form-control-label">
                                    Комментарий

                                </div> <!----> </div></div> <!----> <!----></div> <!----></div>

                        <div class="b24-form-field b24-form-field-file b24-form-control-file2"><!----> <div>
                            <div class="b24-form-control-container">
                                <div class="b24-form-control-label">Фото</div>
                                <div class="b24-form-control-filelist"><div><!---->
                                    <div class="b24-form-control-file-item-empty" style="display: none;">
                                        <span class="b24-form-control-string">Файл загружается...</span>
                                    </div> <div class="b24-form-control-file-item-empty">
                                        <label class="b24-form-control2">➕ Выбрать файл
                                            <input name="photo" id="photo" type="file" accept="image/*,.jpeg,.png,.ico" style="display: none;">
                                        </label>
                                        </div></div>
                                    </div></div> <!----></div></div></div>

                    <div class="b24-form-btn-container"><!----> <!---->
                        <div class="b24-form-btn-block">
                            <button type="submit" class="b24-form-btn">
                                ДОБАВИТЬ
                            </button></div></div>
                    <span style="color: red; display: none;">
                    </form></div>   </div></div></div>
</main>
</body></html>