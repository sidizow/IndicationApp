<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!DOCTYPE html>
<html>
<head>
    <title>Отправка показаний</title>
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


<div class="form">
    <h2>Отправка показаний</h2>
    <form:form method="POST" modelAttribute="indicationModel">
        <div class="input-form">
            <form:input name="indication" path="indication" placeholder="Введите показания" autofocus="true"></form:input>
            <form:errors  path="indication"></form:errors>
            <br>
                ${errorString}
        </div>
        <div class="input-form">
            <input type="submit" value="Отправить">
        </div>
    </form:form>

    <div class="output-form">
        <output name="indication">Ваши предыдущие показания: ${lastIndication}</output>
    </div>
    <div class="output-form">
        <output name="indication">Дата последней отправки: ${lastSendDate}</output>
    </div>
</div>
</body>
</html>