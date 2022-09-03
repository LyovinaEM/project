
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
        <nav class="head">
            <h1 class="title">Система управления студентами и их успеваемостью</h1>
            <div class="login">
                <div><a href="/login">Login</a></div>
            </div>
        </nav>
    </header>
    <main>
        <section class="content">
            <div class="side_menu">
                <div><a href="/">На главную</a></div>
                <div><a href="/disciplines">Назад</a></div>
            </div>
            <div class="main">
                <h2>Для того чтобы создать новую дисциплину заполните все поля и нажмите кнопку "Создать":</h2>
                <div class="form_cm">
                    <form action="/discipline-create" method="post">
                        <input type="hidden" name="id" value="${discipline.id}">
                        <div class="line3">
                            <div>Название</div>
                            <label>
                                <input type="text" name="discipline">
                            </label>
                        </div>
                        <input class="button_cm_discipline" type="submit" value="Создать">
                    </form>
                </div>
                <c:if test="${error eq 1}">
                    <h4>Поля не должны быть пустыми!</h4>
                </c:if>
            </div>
        </section>
    </main>
</div>
</body>
</html>