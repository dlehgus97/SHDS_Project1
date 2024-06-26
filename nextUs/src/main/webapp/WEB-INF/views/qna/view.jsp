<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>질문과 답변 | NEXt Us</title>
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
    function del() {
    	if (confirm('삭제하시겠습니까?')) {
    		location.href='delete.do?no=${vo.no}';
    	}
    }
    
    function getComment(page) {
		$.ajax({
			url: "/comment/list.do",
			data: {
				parent_no: ${vo.no},
				page: page
			},
			success: function(res) {
				$("#commentArea").html(res);
			}
		});
	}
	
	$(function() {
		getComment(1);
	});
	
	
	function goSave() {
		<c:if test="${empty login}">
			alert('댓글은 로그인 후 작성 가능합니다.');
		</c:if>
		
		<c:if test="${!empty login}">
		if ($("#content").val().trim() == '') {
			alert('댓글을 입력해 주세요');
			$("#content").focus();
			return false;
		}
		if (confirm('댓글을 저장하시겠습니까?')) {
    		$.ajax({
    			url: "/comment/insert.do",
    			data: {
    				parent_no: ${vo.no}, // sql거쳐 받아온 no도 있고, param에도 no가 있고 // ${param.no} 얘 써도 됨
    				content: $("#content").val(), // 컨트롤러의 커멘드객체(CommentVO vo) 안에 있는 필드명과 일치해야지
    				writer: ${login.no}
    			},
    			success: function(res) {
    				if (res.trim() == "1") {
    					alert('댓글이 정상적으로 등록되었습니다.');
    					$("#content").val('');
    					getComment(1);
    				}
    			}
    		});
		}
		</c:if>
	}
	
	function commentDel(no) {
		if (confirm("댓글을 삭제하시겠습니까?")) {
			$.ajax ({
				url: '/comment/delete.do?no='+no,
				success: function(res) {
					if (res.trim() == "1") {
						alert('댓글이 정상적으로 삭제되었습니다.');
						getComment(1);
					}
				}
			});
		}
	}
    </script>
</head> 
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">고객센터(QnA)</h3>
                <div class="bbs">
                    <div class="view">
                        <div class="title">
                            <dl>
                                <dt>${vo.title }</dt>
                                <dd class="date">작성일 : <fmt:formatDate value="${vo.write_date }" pattern="YYYY-MM-dd HH:mm:ss"/> </dd>
                            </dl>
                        </div>
                        <div class="cont">${vo.text }</div>                 
                        <div class="btnSet clear">
                            <div class="fl_l">
                            	<a href="index.do" class="btn">목록</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body> 
</html>