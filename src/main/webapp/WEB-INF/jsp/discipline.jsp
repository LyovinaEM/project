
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
                <h2 class="discipline_title">Список дисциплин</h2>
                <div class="discipline_section">
                    <div class="discipline">
                        <table class="list">
                            <tr>
                                <c:if test="${role eq 1}">
                                    <th class="ld_col0"></th>
                                </c:if>
                                <th class="ld_col1">Наименование дисциплины</th>
                            </tr>
                            <c:forEach items="${disciplines}" var="d">
                                <tr>
                                    <c:if test="${role eq 1}">
                                        <td class="ld_col0"><label><input name="idDiscipline" type="checkbox" value="${d.id}"></label></td>
                                    </c:if>
                                    <td class="ld_col1"></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="root_discipline">
                        <div class="button_group2">
                            <input class="button_discipline" type="submit" value="Создать дисциплину…">
                            <input class="button_discipline" type="submit" value="Модифицировать выбранную дисциплину…">
                            <input class="button_discipline" type="submit" value="Удалить выбранную дисциплину…">
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

</body>
</html>