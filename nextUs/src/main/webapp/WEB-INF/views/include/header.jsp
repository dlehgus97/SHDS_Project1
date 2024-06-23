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
	    <div id="header_menu_container">
	    
        <!-- 카테고리 -->
		<!-- NAVBAR -->
     	<nav class="navbar navbar-expand-lg navbar-light">
      		<div class="container">
      		<!-- Toggler -->
		        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		          <span class="navbar-toggler-icon"></span>
		        </button>
		        
		    	<!-- Collapse -->
        		<div class="collapse navbar-collapse" id="navbarCollapse">
					
			        <!-- Nav -->
		          <ul class="navbar-nav mx-auto">
		            <li class="nav-item dropdown">
    		
            			<!-- Toggle -->
              			<a class="nav-link" data-bs-toggle="dropdown" href="#"><img id="header_menu_button" src="../resources/imgs/icons/grid.svg" alt="menu" width="100px" height="100px"></a>
    
			            <!-- Menu -->
			              <div class="dropdown-menu">
			                <div class="card card-lg" style="flex-direction: row-reverse;">
			                  <div class="card-body">
			                    <ul class="list-styled fs-sm">
			                    <li class="list-styled-item">
						          <h5>Front-End</h5>
						        </li>
			                      <li class="list-styled-item">
			                        <a class="list-styled-link" href="/category/html.do">- HTML</a>
			                      </li>
			                      <li class="list-styled-item">
			                        <a class="list-styled-link" href="/category/css.do">- CSS</a>
			                      </li>
			                      <li class="list-styled-item">
			                        <a class="list-styled-link" href="/category/javascript.do">- JavaScript</a>
			                      </li>
			                       	<li class="list-styled-item">
							          
							        </li>
			                    <li class="list-styled-item">
						          <h5>Back-End</h5>
						        </li>
			                      <li class="list-styled-item">
			                        <a class="list-styled-link" href="/category/java.do">- Java</a>
			                      </li>
			                      <li class="list-styled-item">
			                        <a class="list-styled-link" href="/category/cplusplus.do">- C++</a>
			                      </li>
			                      <li class="list-styled-item">
			                        <a class="list-styled-link" href="/category/c.do">- C</a>
			                      </li>
			                      <li class="list-styled-item">
			                        <a class="list-styled-link" href="/category/python.do"> - Python</a>
			                      </li>
			                    </ul>
			                  </div>
			                </div>
			              </div>
			    
			            </li>
			          </ul>
			        </div>
 			      </div>
			    </nav>
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