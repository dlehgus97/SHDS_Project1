<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매자 프로필</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <base href="${pageContext.request.contextPath}/">
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
            <div class="size">
                <h3 class="sub_title">판매자 프로필</h3>
                
                <div class="profile">
                    <p><strong>판매자 번호:</strong> ${seller.no}</p>
                    <p><strong>설명:</strong> ${seller.info}</p>
                    <p><strong>카테고리 1:</strong> ${seller.category1}</p>
                    <p><strong>카테고리 2:</strong> ${seller.category2}</p>
                    <p><strong>은행:</strong> ${seller.bank}</p>
                    <p><strong>계좌 번호:</strong> ${seller.account}</p>
                    <p><strong>평균 별점:</strong> ${seller.rating_avg}</p>
                    <p><strong>리뷰 수:</strong> ${seller.review_cnt}</p>
                </div>
            </div>
        </div>

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>
