<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
		<div class="header">
            <div class="size">
                <div><a href="/index.do"></a></div>
                <div class="login">
                </div>
            </div>
        </div>
        <div class="menu">
            <ul class="depth1">
            </ul>
        </div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>