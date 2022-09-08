
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="/resources/js/functions.js"></script>
</head>
<body>
<div id="container">
    <header>
        <h1>Система управления студентами и их успеваемостью</h1>
    </header>
    <main>

        <section class="form_log">
            <h2 class="log_title">Вход в систему</h2>
            <form action="/login" method="post">
                <div class="line">
                    <div>Логин</div>
                    <label>
                        <input type="text" name="login">
                    </label>
                </div>
                <div class="line">
                    <div>Пароль</div>
                    <label>
                        <input type="text" name="password">
                    </label>
                </div>
                <div class="line">
                    <div>Права</div>
                    <label>
                        <select name="role">
                            <c:forEach items="${roles}" var="r">
                                <option value="${r.id}">${r.role}</option>
                            </c:forEach>
                        </select>
                    </label>
                </div>
                <input class="button_enter" type="submit" value="Войти">
            </form>
        </section>
    </main>
    <h4>Права "Администратор", "Учитель", "Студент" - Login: admin, Password: 123</h4>
    <h4>Права "Учитель", "Студент" - Login: teacher, Password: 123</h4>
    <h4>Права "Студент" - Login: student, Password: 123</h4>
    <c:if test="${error eq '1'}">
        <h4>Неверный логин или пароль!</h4>
    </c:if>
    <c:if test="${error eq '2'}">
        <h4>Поля не должны быть пустыми!</h4>
    </c:if>
</div>
</body>
</html>