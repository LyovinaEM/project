
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
            </div>
            <div class="main">
                <div class="terms_section1">
                    <div class="terms_title">
                        <div class="line4">
                            <div>Выбрать семестр</div>
                            <label>
                                <form action="/terms" method="get">
                                    <select name="idTerm">
                                        <c:forEach items="${terms}" var="t">
                                            <c:choose>
                                                <c:when test="${t.id == selectedTerm.id}">
                                                    <option selected value="${t.id}">${t.term}</option>
                                                    <br />
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${t.id}">${t.term}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                    <input class="button_term" type="submit" value="Выбрать">
                                </form>
                            </label>
                        </div>
                    </div>
                    <div class="term_duration">
                        <h2>Длительность семестра:</h2>
                        <h2>${selectedTerm.duration}</h2>
                    </div>
                    <h2 class="list_dt">Список дисциплин семестра</h2>
                    <div class="terms_section2">
                        <div class="terms">
                            <table class="list">
                                <tr>
                                    <th class="lt_col0">Наименование дисциплины</th>
                                </tr>
                                <c:forEach items="${disciplines}" var="d">
                                <tr>
                                    <td class="lt_col0">${d.discipline}</td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="root_terms">
                            <div class="button_group3">
                                    <form action="/term-create" method="get">
                                        <input class="button_terms" type="submit" value="Создать семестр…">
                                    </form>
                                    <form action="/term-modify" method="get">
                                        <input type="hidden" name="idTermToModify" value="${selectedTerm.id}">
                                        <input class="button_terms" type="submit" value="Модифицировать текущий семестр…">
                                    </form>
                                    <form action="/term-delete" method="get">
                                        <input type="hidden" name="idTermToDelete" value="${selectedTerm.id}">
                                        <input class="button_terms" type="submit" value="Удалить текущий семестр…">
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>


</html>
