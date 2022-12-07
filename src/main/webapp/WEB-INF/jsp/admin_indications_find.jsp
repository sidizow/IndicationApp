<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Admin</title>
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


    <div class="search">
        <form method="POST" action="/admin/findUser">
            <input name="username" type="text" id="username">
            <input type="submit" value="find">
        </form>
    </div>

    <div class="myTable">
        <table>
            <thead class="main">
            <th>ID</th>
            <th>Indication</th>
            <th>Send Date</th>
            <th>Id User</th>
            <th>User Name</th>
            </thead>
            <c:forEach items="${findIndication}" var="indication">
                <tr class="str">
                    <td>${indication.id}</td>
                    <td>${indication.indication}</td>
                    <td>${indication.sendDate}</td>
                    <td>${indication.users.id}</td>
                    <td>${indication.users.username}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>