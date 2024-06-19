<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" href="/resources/css/reset.css"/>
	<link rel="stylesheet" href="/resources/css/style.css"/>
	<link rel="stylesheet" href="/resources/css/contents.css"/>
    <script>
        function confirmDelete(no) {
            if (confirm('삭제하시겠습니까?')) {
                window.location.href = 'deleteNotice.do?no=' + no;
            }
        }
    </script>
</head> 
<body>
    <div class="wrap">
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">공지사항</h3>
                <div class="bbs">
                    <div class="view">
                        <div class="title">
                            <dl>
                                <dt>${vo.title }</dt>
                                <dd class="date">작성일 : <fmt:formatDate value="${vo.writedate }" pattern="YYYY-MM-dd HH:mm:ss"/> </dd>
                            </dl>
                        </div>
                        <div class="cont">${vo.content }</div>                 
                        <div class="btnSet clear">
                            <div class="fl_l">
                            	<a href="../notice.do" class="btn">목록</a>
                            	<a href="adedit.do?no=${vo.no}" class="btn">수정</a>
                            	<a href="javascript:void(0);" onclick="confirmDelete(${vo.no})" class="btn">삭제</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body> 
</html>