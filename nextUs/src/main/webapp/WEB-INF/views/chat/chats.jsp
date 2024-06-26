<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 | NEXt Us</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/chats.css">
<script>
	$(document).ready(function () {
		$('.chat_rooms').hover(
			function() {
				// 마우스를 올렸을 때 실행되는 함수
				$(this).css('background-color', 'rgb(239, 222, 255)');
			}, 
			function() {
				// 마우스를 뗐을 때 실행되는 함수
				$(this).css('background-color', 'white');
			}
		);
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div id="chat_container">
		<div id="chat_header_object">
			<p>채팅목록</p>
		</div>
		<div id="chat_rooms_list">
		
		<c:forEach var="vo" items="${list }">
			<a class="chat_rooms" href="/chat/detail.do?chatno=${vo.chatno }&chatMember=${vo.chatMember }" style="test-decoration: none;">
				<!-- 나중에 프로필 폴더로 변경 필요 -->
				<img src="/upload/profile/${vo.profile_real }" id="profile" alt="프로필">
				<p id="nickname">${vo.senderNickname }</p>
				<p id="content">${vo.content }</p>
				<c:if test="${vo.read_flag == 1 && not empty unReadList[vo.chatno]}">
					<div class="new_container">
						<p class="chat_new">${unReadList[vo.chatno]}</p>
					</div>
				</c:if>
			</a>
		</c:forEach>
		</div>
		<div id="chat_footer_object">
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>