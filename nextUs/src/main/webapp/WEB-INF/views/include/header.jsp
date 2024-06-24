<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- HEADER -->
<div id="header_container">
    <div id="header_left_container">
	    <div id="header_menu_container" style="margin-left: 50px;">
            <a id="header_event" href="/event/index.do">이벤트</a>
	    </div>
    </div>
    <div id="header_logo_container">
    	<a href="/index.do">
	    	<img id="header_logo_icon" src="../resources/imgs/nexus2.png" alt="logo">
	    </a>
    </div>
    <div id="header_right_container">
        <div id="header_userinfo_menu">
            <c:if test="${!empty login && login.seller == 1}">
                <a id="header_regist_seller" class="header_right_object" href="/seller/sellerWeeklyMetrics">셀러 마이페이지</a>
            </c:if>
            <c:if test="${!empty login && login.seller == 0}">
                <button id="header_regist_seller" class="header_right_object">셀러등록</button>
            </c:if>
            <div id="header_chat" class="header_right_object">
            	<c:if test="${!empty login }">
                <img id="header_chat_img" src="../resources/imgs/icons/CHAT.png">
                <a href="/chat/chats.do" id="header_chat_text" class="text_color_white">CHAT</a>
                </c:if>
            </div>
            <div id="login_status" class="header_right_object">
            	<c:if test="${empty login }">
            		<a href="/member/login.do" class="text_color_white" style="font-size: 18px; text-decoration-line: none;">로그인</a>
            	</c:if>
            	<c:if test="${!empty login }">
            		<a href="/member/logout.do" class="text_color_white" style="font-size: 18px; text-decoration-line: none;">로그아웃</a>
            	</c:if>
            </div>
            <c:if test="${!empty login }">
            <div class="header_right_object">
            	<a href="/mypage/orderlist.do" class="text_color_white" style="font-size: 18px; text-decoration-line: none;">마이페이지</a>
            	<img src="" id="header_profile" alt="프로필">
            </div>
            <div></div><div></div>
            <div class="header_right_object">
            	<a href="/cart/view.do" class="text_color_white" style="font-size: 18px; text-decoration-line: none;">장바구니</a>
            </div>
            <div class="header_right_object">
            	<a href="/mypage/wishlist.do" class="text_color_white" style="font-size: 18px; text-decoration-line: none;">찜목록</a>
            </div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>