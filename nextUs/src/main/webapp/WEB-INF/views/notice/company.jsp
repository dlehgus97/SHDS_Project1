<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>

<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/reset.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link rel="stylesheet" href="/resources/css/contents.css"/>

</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>

        <!-- 회사소개 이미지 삽입 -->
        <div class="company-intro">
            <img src="<%= request.getContextPath() %>/resources/imgs/company.png" alt="회사소개" style="width: 100%;">
        </div>
   
    	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>		
</body>
</html>