<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- 이벤트 메인 배너 -->
	<div id="main_banner_container">
		<c:forEach var="vo" items="${mainBanner }">
			<img class="banner" src="/upload/board/${vo.thumbnail_real}" alt="Banner Image">
		</c:forEach>
		<button class="arrow left">&#9664;</button>
        <button class="arrow right">&#9654;</button>
	</div>
	<script>
        $(document).ready(function () {
        	let currentIndex = 0;
            const banners = $('#main_banner_container .banner');
            const totalBanners = banners.length;

            // Initialize the first banner
            banners.eq(currentIndex).show();

            function showBanner(index) {
                banners.eq(currentIndex).fadeOut(1000);
                banners.eq(index).fadeIn(1000);
                currentIndex = index;
            }

            function nextBanner() {
                const nextIndex = (currentIndex + 1) % totalBanners;
                showBanner(nextIndex);
            }

            function prevBanner() {
                const prevIndex = (currentIndex - 1 + totalBanners) % totalBanners;
                showBanner(prevIndex);
            }

            $('.arrow.right').click(nextBanner);
            $('.arrow.left').click(prevBanner);

            setInterval(nextBanner, 10000);
        });
    </script>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>