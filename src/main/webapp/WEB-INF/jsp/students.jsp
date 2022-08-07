
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
            </div>
            <div class="main">
                <div class="button_group1">
                    <input class="button_student1" type="submit"
                           value="Просмотреть успеваемость выбранных студентов">

                    <form action="/student-create" method="get">
                        <input class="button_student2" type="submit" value="Создать студента…">
                    </form>

                    <input class="button_student1" type="submit" value="Модифицировать выбранного студента">
                    <input class="button_student2" type="submit" value="Удалить выбранных студентов">
                </div>
                <div class="students">
                    <table class="list">
                        <caption>Список студентов</caption>
                        <tr>
                            <th class="l_col0"></th>
                            <th class="l_col1">Фамилия</th>
                            <th class="l_col2">Имя</th>
                            <th class="l_col3">Группа</th>
                            <th class="l_col4">Дата поступления</th>
                        </tr>
                        <c:forEach items="${students}" var = "s">
                        <tr>
                            <td class="l_col0"><label><input name="idStudent" type="checkbox" value="${st.id}"></label></td>
                            <td class="l_col1">${s.surname}</td>
                            <td class="l_col2">${s.name}</td>
                            <td class="l_col3">${s.group.group}</td>
                            <td class="l_col4"><fmt:formatDate value="${s.date}" pattern="dd/MM/yyyy"/></td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>