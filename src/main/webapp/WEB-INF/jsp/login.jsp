<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Войти</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>

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
    <form method="POST" action="/login">
        <div class="form">
            <h1>Вход</h1>
            <div class="input-form">
                <input name="username" type="text" placeholder="Логин"
                       autofocus="true"/>
            </div>
            <div class="input-form">
                <input name="password" type="password" placeholder="Пароль"/>
            </div>
            <div class="input-form">
                <input type="submit" value="Войти">
            </div>
                <a href="/registration">Зарегистрироваться</a>
        </div>
</form>
</div>

</body>
</html>
