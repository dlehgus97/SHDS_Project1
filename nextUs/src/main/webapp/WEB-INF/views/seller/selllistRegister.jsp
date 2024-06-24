<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>판매글 등록</title>
</head>
<body>
    <h1>판매글 등록</h1>
    <form action="${pageContext.request.contextPath}/selllistRegister" method="post">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="5" cols="40" required></textarea><br><br>

        <input type="submit" value="등록">
    </form>
</body>
</html>
