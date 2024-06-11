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
	<div id="main_first_container">
		<div id="main_banner_container">
			<div class="banner-wrapper">
                <c:forEach var="vo" items="${mainBanner}">
                    <div class="banner" style="background-image: url('/upload/board/${vo.thumbnail_real}')"></div>
                </c:forEach>
            </div>
			<button class="arrow left">&#9664;</button>
	        <button class="arrow right">&#9654;</button>
		</div>
	</div>
	<script>
        $(document).ready(function () {
        	let currentIndex = 0;
            const banners = $('#main_banner_container .banner');
            const totalBanners = banners.length;
            const bannerWrapper = $('.banner-wrapper');
            let slideInterval;

            function startSlider() {
                slideInterval = setInterval(nextBanner, 5000);
            }

            function resetSlider() {
                clearInterval(slideInterval);
                startSlider();
            }

            function showBanner(index) {
                const offset = -index * 100; // Calculate the offset percentage
                bannerWrapper.css('transform', 'translateX(' + offset + '%)');
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

            $('.arrow.right').click(function() {
                nextBanner();
                resetSlider();
            });

            $('.arrow.left').click(function() {
                prevBanner();
                resetSlider();
            });

            // Initialize the first banner and start the slider
            showBanner(currentIndex);
            startSlider();
        });
    </script>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>