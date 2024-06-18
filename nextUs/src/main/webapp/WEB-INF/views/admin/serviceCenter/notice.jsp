<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/serviceCenter.css" />
<style>
    #serviceCenter{color:purple;}
    #notice{color:purple;}
    
	/* 테이블 스타일 */
	table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	th, td {
	    padding: 10px;
	    text-align: left;
	    border-bottom: 1px solid #ddd;
	}
	
	th {
	    background-color: #f2f2f2;
	    text-align: center;
	}
	
	tr:hover {
	    background-color: #f5f5f5;
	}
	
	.title_notice {
	    font-size: 24px;
	}
	
	.button1 {
	    font-size: 16px;
	}
	
	.col-number {
		font-size : 20px;
	    text-align: right;
	    width: 10%;
	}
	
	.col-title {
		font-size : 20px;
	    text-align: center;
	    width: 60%;
	}
	
	.col-date {
		font-size : 20px;
	    text-align: left;
	    padding-left: 50px;
	    width: 30%;
	}
	.col-number2 {
	    text-align: right;
	    padding-right:20px;
	    width: 10%;
	}
	
	.col-title2 {
	    text-align: center;
	    width: 60%
	}
	.col-date2 {
	    text-align: left;
	    width: 20%;
	}
	.col-action {
	    text-align: center;
	    width: 10%;
	}
	.no_row{
		height : 50px;
	}
	.delete-button {
	    background-color: red;
	    color: white;
	    border: none;
	    padding: 5px 10px;
	    cursor: pointer;
	    border-radius: 3px;
	}
</style>
<script>
    function deleteNotice(noticeNo) {
        if (confirm('정말 삭제하시겠습니까?')) {
            window.location.href = 'deleteNotice.do?no=' + noticeNo;
        }
    }
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content">
				<!-- 여기에 작성해라 -->
		
            <div class="bg-wh service_div">
                <div class="service_header">
				    <h1 class="title_notice">공지사항</h1>
				    <button class="button1" onclick="location.href='/register.do'; return false;">공지 등록</button>
				</div>
                <div class="paragraph">
                    <table>
                        <thead>
                            <tr>
                                <th class="col-number">번호</th>
                                <th class="col-title">제목</th>
                                <th class="col-date">날짜</th>
                                <th class="col-action"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="notice" items="${list}">
                                <tr class = "no_row">
                                    <td class="col-number2">${notice.no}</td>
                                    <td class="col-title2">${notice.title}</td>
                                    <td class="col-date2"><fmt:formatDate value="${notice.writedate}" pattern="yyyy-MM-dd HH:mm" /></td>
                                    <td class="col-action">
                                        <button class="delete-button" onclick="deleteNotice(${notice.no});">삭제하기</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>