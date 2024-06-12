<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>아이디 찾기</title>
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
   
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <div class="sub">
            <h3 class="sub_title">아이디 찾기</h3>
            <div class="box">
                <fieldset class="id_search_form">
                    <form action="/member/findid.do" method="post" id="idsearchForm" name="idsearchForm">
                        <ul>
                            <li><input type="text" id="name" name="name" placeholder="이름" value="${memberSearchDTO.name}"></li>
                            <li><input type="text" id="phone" name="phone" placeholder="전화번호" value="${memberSearchDTO.phone}"></li>
                        </ul>
                        <div class="search_btn"><input type="submit" value="찾기" alt="찾기" /></div>
                    </form>
                </fieldset>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>
