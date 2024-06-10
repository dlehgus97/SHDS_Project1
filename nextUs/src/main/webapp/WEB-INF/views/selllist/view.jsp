<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 판매글예시 </h1>
<p>${vo.sellno }번 글입니다. 안녕하세요</p>
<p>판매자는 ${vo.seller } 입니다.</p>
<a href="/chat?no=${vo.seller }">상담하러가기</a>
</body>
</html>