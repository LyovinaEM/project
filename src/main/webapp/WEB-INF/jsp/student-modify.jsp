
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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker();
        } );
    </script>
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
                <div><a href="file:///Users/ekaterinalevina/Desktop/Проект/Title%20page.html">На главную</a></div>
                <div><a href="file:///Users/ekaterinalevina/Desktop/Проект/Students%20List.html">Назад</a></div>
            </div>
            <div class="main">
                <h2>Для модификации введите значения и нажмите кнопку "Применить"</h2>
                <div class="form_cm">
                    <form action="/student-modify" method="post">
                        <input type="hidden" name="id" value="${student.id}">
                        <div class="line2">
                            <div>Фамилия</div>
                            <label>
                                <input type="text" name="surname" value="${student.surname}">
                            </label>
                        </div>
                        <div class="line2">
                            <div>Имя</div>
                            <label>
                                <input type="text" name="name" value="${student.name}">
                            </label>
                        </div>
                        <div class="line2">
                            <div>Группа</div>
                            <label>
                                <input type="text" name="group"  value="${student.group.group}">
                            </label>
                        </div>
                        <div class="line2">
                            <div>Дата поступления</div>
                            <label>
                                <input type="text" name="date" id="datepicker" value="<fmt:formatDate value="${student.date}" pattern="dd/MM/yyyy"/>">
                            </label>
                        </div>
                        <input class="button_cm_student" type="submit" value="Применить">
                    </form>
                </div>
                <c:if test="${error eq 1}">
                    <h4>Поля не должны быть пустыми!</h4>
                </c:if>
            </div>
        </section>
    </main>
</div>
