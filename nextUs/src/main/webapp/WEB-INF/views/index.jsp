<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nexTus</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />

<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- 이벤트 메인 배너 -->
	<div id="main_first_container">
		<div id="main_banner_container">
			<div class="banner-wrapper">
				<c:forEach var="vo" items="${mainBanner}">
					<div class="banner"
						style="background-image: url('/upload/board/${vo.thumbnail_real}')"></div>
				</c:forEach>
			</div>
			<button class="arrow left">&#9664;</button>
			<button class="arrow right">&#9654;</button>
		</div>
	</div>

	<!-- TOP SELLERS -->
	<section class="py-12">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6">

					<!-- Heading -->
					<h2 class="mb-4 text-center">Top month Sellers</h2>

					<!-- Nav -->
					<div class="nav justify-content-center mb-10">
						<a class="nav-link active" href="#topSellersTab"
							data-bs-toggle="tab">Women</a> <a class="nav-link"
							href="#topSellersTab" data-bs-toggle="tab">Men</a> <a
							class="nav-link" href="#topSellersTab" data-bs-toggle="tab">Kids</a>
					</div>

				</div>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="topSellersTab">
					<div class="row">
						<c:forEach var="vo" items="${list }">
							<!-- 반복 시작 -->
							<div class="col-6 col-md-4 col-lg-3">
								<!-- Card -->
								<div class="card mb-7">

									<!-- Badge -->
									<div
										class="badge bg-white text-body card-badge card-badge-start text-uppercase">
										New</div>

									<!-- Image -->
									<div class="card-img">

										<!-- Image -->
										<a class="card-img" href="/selllist/view.do?sellno=${vo.sellno }"> <img
											class="card-img-top card-img-front"
											src="/upload/board/1717978758514.jpg"
											style="width: 90%; height: 250px; object-fit: cover;">
										</a>
									</div>

									<!-- Body -->
									<div class="card-body px-0">

										<!-- Category -->
										<div class="fs-xs">
											<a class="text-muted" href="/selllist/view.do?sellno=${vo.sellno }">카테고리? 별점? 중 뭐넣을까</a>
										</div>

										<!-- Title -->
										<div class="fw-bold">
											<a class="text-body" href="/selllist/view.do?sellno=${vo.sellno }"> ${vo.title } </a>
										</div>

										<!-- Price -->
										<div class="fw-bold text-muted">${vo.price }원</div>

									</div>

								</div>

							</div>
							<!-- 반복 끝 -->
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- JAVASCRIPT -->
	<script>
		$(document).ready(
				function() {
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
						bannerWrapper.css('transform', 'translateX(' + offset
								+ '%)');
						currentIndex = index;
					}

					function nextBanner() {
						const nextIndex = (currentIndex + 1) % totalBanners;
						showBanner(nextIndex);
					}

					function prevBanner() {
						const prevIndex = (currentIndex - 1 + totalBanners)
								% totalBanners;
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
	
	<!-- 카테고리 -->
	<script>
	    document.getElementById('categoryButton').addEventListener('click', function() {
	        var categoryMenu = document.getElementById('categoryMenu');
	        if (categoryMenu.style.display === 'none') {
	            categoryMenu.style.display = 'block';
	        } else {
	            categoryMenu.style.display = 'none';
	        }
	    });
	</script>

	<!-- 부트스트랩 js -->
	<!-- Map (replace the API key to enable) -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>

	<!-- Vendor JS -->
	<script src="/resources/js/board/vendor.bundle.js"></script>

	<!-- Theme JS -->
	<script src="/resources/js/board/theme.bundle.js"></script>

</body>
</html>