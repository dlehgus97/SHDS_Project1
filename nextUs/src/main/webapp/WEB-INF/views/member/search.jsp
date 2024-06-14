<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>아이디/비밀번호 찾기</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
    
    <style>
    .btn { padding: 30px 30px; background-color: #000000; color: white; border: none; cursor: pointer; }
    .btn:hover { background-color: #333333; }
    .active { display: block; }
    </style>
    
</head> 
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">아이디/비밀번호 찾기</h3>
                
                <div class="btnSet clear">
                    <!-- 아이디 찾기와 비밀번호 찾기 버튼에 클릭 이벤트 추가 -->
                    <button class="btn" onclick="window.location.href='/member/idsearch.do'">아이디 찾기</button>
                    <button class="btn" onclick="window.location.href='/member/pwdsearch.do'">비밀번호 찾기</button>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body> 
</html>
