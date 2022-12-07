<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="myTable">
    <table>
        <thead class="main">
        <th>ID</th>
        <th>UserName</th>
        <th>Password</th>
        <th>Roles</th>
        </thead>
        <c:forEach items="${allUsers}" var="user">
            <tr class="str">
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>
                    <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/admin/users" method="post">
                        <input type="hidden" name="userId" value="${user.id}"/>
                        <input type="hidden" name="action" value="delete"/>
                        <div class="input-form-admin">
                            <input type="submit" value="Удалить">
                        </div>
                    </form>

                </td>

            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>