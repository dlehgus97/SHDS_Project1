<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/sellerReqList.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="outer_container">
		<div id="req_container">
			<c:forEach var="vo" items="${reqList}">
		        <div class="req_list_container">
		            <div class="details">
		                <h3>Details</h3>
		                <p>${vo.details}</p>
		            </div>
		            <div class="file">
		                <h3>File</h3>
		                <c:if test="${vo.file_real != null}">
		                    <a href="download?file=${vo.file_real}">Download File</a>
		                    <a href="<c:url value="/download.do"/>?uploadPath=/upload/sellerReq&thumbnail_org=${URLEncoder.encode(vo.file_org)}&thumbnail_real=${vo.file_real}" target="_blank">첨부파일 : ${vo.file_org}</a>
		                </c:if>
		                <c:if test="${vo.file_real == null}">
		                    <p>No file available</p>
		                </c:if>
		            </div>
		            <div class="status">
		                <h3>Status</h3>
		                <c:choose>
		                    <c:when test="${vo.state == 0}">
		                        <p>신청승인</p>
		                    </c:when>
		                    <c:when test="${vo.state == 1}">
		                        <p>신청검토중</p>
		                    </c:when>
		                    <c:when test="${vo.state == -1}">
		                        <p>신청거부</p>
		                    </c:when>
		                    <c:otherwise>
		                        <p>Unknown Status</p>
		                    </c:otherwise>
		                </c:choose>
		            </div>
		        </div>
		    </c:forEach>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>