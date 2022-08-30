
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
                    <div class="login">
                        <div><a href="/login">Login</a></div>
                    </div>
                </div>
            </nav>
        </header>
        <main>
            <section class="content">
                <div class="side_menu">
                    <div><a href="/">На главную</a></div>
                    <div><a href="/students">Назад</a></div>
                </div>
                <div class="main">
                    <h2>Отображена успеваемость для следующего студента:</h2>
                    <div class="progress">
                        <input type="hidden" name="idStudent" value="${student.id}">
                        <table class="list">
                            <tr>
                                <th class="lp_col0">Фамилия</th>
                                <th class="lp_col1">Имя</th>
                                <th class="lp_col2">Группа</th>
                                <th class="lp_col3">Дата поступления</th>
                            </tr>
                            <tr>
                                <td class="lp_col0">${student.surname}</td>
                                <td class="lp_col1">${student.name}</td>
                                <td class="lp_col2">${student.group.group}</td>
                                <td class="lp_col3"><fmt:formatDate pattern="dd/MM/yyyy" value="${student.date}"/></td>
                            </tr>
                        </table>
                    </div>
                    <div class="progress_section">
                        <div class="marks">
                            <table class="list">
                                <tr>
                                    <th class="lm_col0">Дисциплина</th>
                                    <th class="lm_col1">Оценка</th>
                                </tr>
                                <c:forEach items="${marks}" var="m">
                                <tr>
                                    <td class="lm_col0">${m.discipline.discipline}</td>
                                    <c:if test="${m.mark ne -1}">
                                    <td class="lm_col1">${m.mark}</td>
                                    </c:if>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="term_average_mark">
                            <div class="term">
                                <div>Выбрать семестр</div>
                                <form action="/student-progress" method="get">
                                    <label>
                                        <input type="hidden" name="idHiddenProgress" value="${student.id}">
                                        <select name="idTerm">
                                            <c:forEach items="${terms}" var="t">
                                                <c:choose>
                                                    <c:when test="${t.id== selectedTerm.id}">
                                                       <option selected value="${t.id}">${t.term}</option>
                                                        <br />
                                                    </c:when>
                                                    <c:otherwise>
                                                       <option value="${t.id}">${t.term}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </label>
                                    <input class="button_term" type="submit" value="Выбрать">
                                </form>
                            </div>
                            <div class="average_mark">
                                Средняя оценка за семестр:
                                <h3> <fmt:formatNumber value="${avg}" maxFractionDigits="2"></fmt:formatNumber> балла </h3></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>

</body>
</html>