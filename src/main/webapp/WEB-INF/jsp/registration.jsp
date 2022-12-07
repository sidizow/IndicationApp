<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Регистрация</title>
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
    <form:form method="POST" modelAttribute="userForm">
        <div class="form">
            <h1>Регистрация</h1>
            <div class="input-form">
                <form:input name="username" type="text" path="username" placeholder="Username"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
                    ${usernameError}
            </div>
            <div class="input-form">
                <form:input name="password" type="password" path="password" placeholder="Password"></form:input>
            </div>
            <div class="input-form">
                <form:input name="password" type="password" path="passwordConfirm"
                            placeholder="Confirm your password"></form:input>
                <form:errors path="password"></form:errors>
                    ${passwordError}
            </div>
            <div class="input-form">
                <input type="submit" value="Зарегистрироваться">
            </div>
        </div>
    </form:form>
</div>

</body>
</html>