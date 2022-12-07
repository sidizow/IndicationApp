<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Главная</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<div>
    <nav class="navbar">
        <div class="container">
            <a href="#" class="navbar-brand">Энергогарант</a>
            <div class="navbar-wrap">
                <ul class="navbar-menu">
                    <li><a href="/">Главная</a></li>
                    <sec:authorize access="hasAnyRole('ADMIN')">
                        <li><a href="/admin/users">Пользователи</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ADMIN')">
                        <li><a href="/admin/indications">Посмотреть показания</a></li>
                    </sec:authorize>
                    <li><a href="/indications">Отправить показания</a></li>
                    <sec:authorize access="!isAuthenticated()">
                        <li><a href="/login">Войти</a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <li><a href="/logout">Выйти</a></li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div>

</div>
<div class="form-welcome">
    <sec:authorize access="isAuthenticated()">
    <h3>Здравствуйте ${pageContext.request.userPrincipal.name}! <br> Ознакомьтесь с нашими новостями </h3>
    </sec:authorize>
</div>

<div class="main inline">
    <div class="new">
        <h2>Новость 1</h2>
        <p>
            АО «Томскэнергосбыт» совместно с «Радио Сибирь Томск» в течение двух месяцев награждали победителей акции «Я
            всегда плачу по счетам». Победителями стали 30 участников, которым полностью вернули деньги оплаченной
            квитанции.
        </p>
        <a href="#">Читать полностью</a>
    </div>
    <div class="new">
        <h2>Новость 2</h2>
        <p>
            АО «Томскэнергосбыт» совместно с «Радио Сибирь Томск» в течение двух месяцев награждали победителей акции «Я
            всегда плачу по счетам». Победителями стали 30 участников, которым полностью вернули деньги оплаченной
            квитанции.
        </p>
        <a href="#">Читать полностью</a>
    </div>
    <div class="new">
        <h2>Новость 3</h2>
        <p>
            АО «Томскэнергосбыт» совместно с «Радио Сибирь Томск» в течение двух месяцев награждали победителей акции «Я
            всегда плачу по счетам». Победителями стали 30 участников, которым полностью вернули деньги оплаченной
            квитанции.
        </p>
        <a href="#">Читать полностью</a>
    </div>

</div>


</body>
</html>