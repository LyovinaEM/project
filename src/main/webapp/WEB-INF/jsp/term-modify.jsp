
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
                <div><a href="/terms">Назад</a></div>
            </div>
            <div class="main">
                <h2>Для модификации семестра отредактируйте данные и нажмите кнопку "Применить".</h2>
                <div class="form_cm">
                    <form action="/term-modify" method="post">
                       <input type="hidden" name="idTerm" value="${term.id}">
                        <div class="line5">
                            <div>Длительность (в неделях)</div>
                            <label>
                                <input name="duration" type="text" value="${term.duration}">
                            </label>
                        </div>
                        <div class="line5">
                            <div>Дисциплины в семестре</div>
                            <label>
                                <select multiple="multiple" name="idsDisc">
                                    <c:forEach items="${disciplines}" var="d">
                                        <option value="${d.id}">${d.discipline}</option>
                                    </c:forEach>
                                </select>
                            </label>
                        </div>
                        <input class="button_cm_term" type="submit" value="Применить">
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
