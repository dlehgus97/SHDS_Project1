<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NEXt Us</title>
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



<style>
	.bg-purple {background-color: #d3d3d3;}
    .section-bg-light-purple,
    .section-bg-light-purple * {
        background-color: #F8F8FF;
    }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- 이벤트 메인 배너 -->
	<div id="main_first_container">
		<div id="main_banner_container">
			<div class="banner-wrapper">
				<c:forEach var="vo" items="${mainBanner}">
					<div class="banner"
						style="background-image: url('/upload/event/${vo.thumbnail_real}')"></div>
				</c:forEach>
			</div>
			<button class="arrow left">&#9664;</button>
			<button class="arrow right">&#9654;</button>
		</div>
	</div>
	
	
	 <!-- 카테고리 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
	  <div class="container">
	    
	    <!-- Toggler -->
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    
	    <!-- Collapse -->
	    <div class="collapse navbar-collapse" id="navbarCollapse">
	      
	      <!-- 웹 -->
	      <ul class="navbar-nav mx-auto">
	        <li class="nav-item dropdown">
	          <!-- Toggle -->
	          <a class="nav-link fw-bold fs-6 text-dark" data-bs-toggle="dropdown" href="#"><strong>웹</strong></a>
	          
	          <!-- 홈페이지 -->
	          <div class="dropdown-menu" style="margin-top: 24px;">
	            <div class="card card-lg">
	              <div class="card-body">
	                <ul class="list-styled fs-sm">
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=5">- 홈페이지</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=6">- UI, 퍼블리싱</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=7">- 검색최적화</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=8">- 애널리틱스</a>
	                  </li>
	                </ul>
	              </div>
	            </div>
	          </div>
	        </li>
	      </ul>
	      <hr class="my-2">
	
	      <!-- 모바일 -->
	      <ul class="navbar-nav mx-auto">
	        <li class="nav-item dropdown">
	          <!-- Toggle -->
	          <a class="nav-link fw-bold fs-6 text-dark" data-bs-toggle="dropdown" href="#"><strong>모바일</strong></a>
	          
	          <!-- Menu -->
	          <div class="dropdown-menu" style="margin-top: 24px;">
	            <div class="card card-lg">
	              <div class="card-body">
	                <ul class="list-styled fs-sm">
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=9">- 안드로이드</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=10">- iOS</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=11">- 기타</a>
	                  </li>
	                </ul>
	              </div>
	            </div>
	          </div>
	        </li>
	      </ul>
	      <hr class="my-2">
	
	      <!-- 인공지능 -->
	      <ul class="navbar-nav mx-auto">
	        <li class="nav-item dropdown">
	          <!-- Toggle -->
	          <a class="nav-link fw-bold fs-6 text-dark" data-bs-toggle="dropdown" href="#"><strong>인공지능</strong></a>
	          
	          <!-- Menu -->
	          <div class="dropdown-menu" style="margin-top: 24px;">
	            <div class="card card-lg">
	              <div class="card-body">
	                <ul class="list-styled fs-sm">
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=12">- 생성형 AI</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=13">- 머신러닝, 딥러닝</a>
	                  </li>
	                </ul>
	              </div>
	            </div>
	          </div>
	        </li>
	      </ul>
	      <hr class="my-2">
	
	      <!-- Nav -->
	      <ul class="navbar-nav mx-auto">
	        <li class="nav-item dropdown">
	          <!-- Toggle -->
	          <a class="nav-link fw-bold fs-6 text-dark" data-bs-toggle="dropdown" href="#"><strong>기타</strong></a>
	          
	          <!-- Menu -->
	          <div class="dropdown-menu" style="margin-top: 24px;">
	            <div class="card card-lg">
	              <div class="card-body">
	                <ul class="list-styled fs-sm">
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=14">- 보안</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=15">- QA</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=16">- 기술지원</a>
	                  </li>
	                  <li class="list-styled-item">
	                    <a class="list-styled-link text-dark" href="/selllist/index.do?categoryno=17">- 파일변환</a>
	                  </li>
	                </ul>
	              </div>
	            </div>
	          </div>
	        </li>
	      </ul>
	      <hr class="my-2">
	      
	    </div>
	  </div>
	</nav>
	


	<!-- 실시간 인기 서비스 -->
	<section class="py-12 section-bg-light-purple">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6">

					<!-- Heading -->
					<h2 class="mb-4 text-center">실시간 인기 서비스 <img src="/resources/imgs/hot.png" alt="인기 서비스 이미지" width="40" height="40" style="margin-right: 10px; margin-bottom: 10px"></h2>
					
					
					<!-- Nav -->
					<div class="nav justify-content-center mb-10">
						<a class="nav-link popular" href="#" data-value="0" >전체</a>
						<a class="nav-link popular" href="#" data-value="1" >웹</a>
	                    <a class="nav-link popular" href="#" data-value="2" >모바일</a> 
	                    <a class="nav-link popular" href="#" data-value="3" >인공지능</a>
	                    <a class="nav-link popular" href="#" data-value="4" >기타</a>
					</div>

				</div>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="topSellersTab">
					<div class="row" id ="popular_list">
						<c:forEach var="vo" items="${popularList }">
							<!-- 반복 시작 -->
							<div class="col-6 col-md-4 col-lg-3 card-bg-light-purple">
								<!-- Card -->
								<div class="card mb-7">

									<!-- Badge -->
							        <c:choose>
									    <c:when test="${vo.view_cnt >= 1000}">
									        <div class="badge bg-white text-body card-badge card-badge-start text-uppercase">
									            조회수 1000+
									        </div>
									    </c:when>
									    <c:when test="${vo.review_cnt >= 100}">
									        <div class="badge bg-white text-body card-badge card-badge-start text-uppercase">
									            리뷰 100+
									        </div>
									    </c:when>
									</c:choose>

									

									<!-- Image -->
									<div class="card-img">

										<!-- Image -->
										<a class="card-img" href="/selllist/view.do?sellno=${vo.sellno }"> <img
											class="card-img-top card-img-front"
											src="/upload/thumbnail/${vo.thumbnail_real}"
											style="width: 90%; height: 250px; object-fit: cover;">
										</a>
									</div>

									<!-- Body -->
									<div class="card-body px-0">

										<!-- Category -->
										<div class="fs-xs">
											<a class="text-muted" href="/selllist/view.do?sellno=${vo.sellno }">
												<div class="col-auto">
							                    <div class="rating fs-xs text-dark" data-value="<fmt:formatNumber value="${vo.rating_avg}" type="number" maxFractionDigits="0" minFractionDigits="0" />">
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                    </div>
							
							                  </div>
											</a>
										</div>

										<!-- Title -->
										<div class="fw-bold">
											<a class="text-body" href="/selllist/view.do?sellno=${vo.sellno }"> ${vo.title } </a>
										</div>

										<!-- Price -->
										<div class="fw-bold text-muted"><fmt:formatNumber value="${vo.price}" type="number" groupingUsed="true" />원</div>

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
	
	<!-- 신규 등록 서비스 -->
	<section class="py-12">
	    <div class="container">
	        <div class="row justify-content-center">
	            <div class="col-12 col-md-10 col-lg-8 col-xl-6">
	
	                <!-- Heading -->
	                <h2 class="mb-4 text-center">신규 등록 서비스 <img src="/resources/imgs/new.png" alt="신규 등록 이미지" width="50" height="40" style="margin-right: 10px; margin-bottom: 10px"></h2>
	                
	                <!-- 동동초이가 건듬 -->
	                <!-- Nav -->
	                <div class="nav justify-content-center mb-10">
	                    <a class="nav-link regis" href="#" data-value="0">전체</a> 
	                    <a class="nav-link regis" href="#" data-value="1">웹</a> 
	                    <a class="nav-link regis" href="#" data-value="2">모바일</a> 
	                    <a class="nav-link regis" href="#" data-value="3">인공지능</a>
	                    <a class="nav-link regis" href="#" data-value="4">기타</a>
	                </div>
	
	            </div>
	        </div>
	        <div class="tab-content">
	            <div class="tab-pane fade show active" id="topSellersTab">
	                <div class="row" id="productList">
	                    <c:forEach var="vo" items="${recentList}">
	                        <!-- 반복 시작 -->
	                        <div class="col-6 col-md-4 col-lg-3">
	                            <!-- Card -->
	                            <div class="card mb-7">
	
	                                <!-- Badge -->
	                                <div class="badge bg-white text-body card-badge card-badge-start text-uppercase">
	                                    New
	                                </div>
	
	                                <!-- Image -->
	                                <div class="card-img">
	
	                                    <!-- Image -->
	                                    <a class="card-img" href="/selllist/view.do?sellno=${vo.sellno}"> 
	                                        <img class="card-img-top card-img-front" src="/upload/thumbnail/${vo.thumbnail_real}" style="width: 90%; height: 250px; object-fit: cover;">
	                                    </a>
	                                </div>
	
	                                <!-- Body -->
	                                <div class="card-body px-0">
	
	                                    <!-- Category -->
	                                    <div class="fs-xs">
	                                        <a class="text-muted" href="/selllist/view.do?sellno=${vo.sellno}">카테고리? 별점? 중 뭐넣을까</a>
	                                    </div>
	
	                                    <!-- Title -->
	                                    <div class="fw-bold">
	                                        <a class="text-body" href="/selllist/view.do?sellno=${vo.sellno}"> ${vo.title} </a>
	                                    </div>
	
	                                    <!-- Price -->
	                                    <div class="fw-bold text-muted">${vo.price}원</div>
	
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

	
	<!-- TOP SELLERS -->
	<section class="py-10 section-bg-light-purple">
		<!-- 웹 -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8 col-xl-2 col-xl-6">

					<!-- Heading -->
					<h2 class="mb-4 text-center">NEXTUS 셀러 순위</h2>
					<hr style="border: 3px solid #000;">

					<!-- Nav -->
					<div class="nav justify-content-center mb-10">
						<h5 class="mb-4 text-center">웹</h5>
					</div>

				</div>
			</div>

		      <div class="flickity-page-dots-progress" data-flickity='{"pageDots": true}'>
				<c:forEach var="rank" items="${rank }" varStatus="webstatus">
				 <c:if test="${rank.nested1 == 1 or rank.nested2 == 1}">
			        <!-- Item -->
			        <div class="col px-4" style="width: 250px;">
			          <div class="card">
			
			            <!-- Image -->
			            <div class="card-img" style="width: 100%; height: 250px;">
			
			              <!-- Action -->
			              <div class="btn btn-xs btn-circle btn-white-primary card-action card-action-end">
			                ${webstatus.index + 1}
			              </div>
			
			              <!-- Image -->
			              <img class="card-img-top" src="/upload/profile/${rank.profile_real }" alt="..." >
			
			            </div>
			
			            <!-- Body -->
			            <div class="card-body fw-bold text-center">
			              <a class="text-body" href="product.html">${rank.nickname }</a> <br>
			              <span class="text-muted">${rank.info }</span>
			            </div>
			
			          </div>
			        </div>
			       </c:if>
				</c:forEach>
		      </div>
		</div>
		
		<!-- 모바일 -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8 col-xl-2 col-xl-6">
					

					<!-- Nav -->
					<div class="nav justify-content-center mb-10" style="margin-top:100px">
						<h5 class="mb-4 text-center">모바일</h5>
					</div>

				</div>
			</div>

		      <div class="flickity-page-dots-progress" data-flickity='{"pageDots": true}'>
				<c:forEach var="rank" items="${rank }" varStatus="mbstatus">
				 <c:if test="${rank.nested1 == 2 or rank.nested2 == 2}">
			        <!-- Item -->
			        <div class="col px-4" style="width: 250px;">
			          <div class="card">
			
			            <!-- Image -->
			            <div class="card-img" style="width: 100%; height: 250px;">
			
			              <!-- Action -->
			              <div class="btn btn-xs btn-circle btn-white-primary card-action card-action-end">
			                ${mbstatus.index + 1}
			              </div>
			
			              <!-- Image -->
			              <img class="card-img-top" src="/upload/profile/${rank.profile_real }" alt="..." style="width: 90%; height: 250px;">
			
			            </div>
			
			            <!-- Body -->
			            <div class="card-body fw-bold text-center">
			              <a class="text-body" href="product.html">${rank.nickname }</a> <br>
			              <span class="text-muted">${rank.info }</span>
			            </div>
			
			          </div>
			        </div>
			       </c:if>
				</c:forEach>
		      </div>
		</div>
		
		<!-- 인공지능 -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8 col-xl-2 col-xl-6">
					

					<!-- Nav -->
					<div class="nav justify-content-center mb-10" style="margin-top:100px">
						<h5 class="mb-4 text-center">인공지능</h5>
					</div>

				</div>
			</div>

		      <div class="flickity-page-dots-progress" data-flickity='{"pageDots": true}'>
				<c:forEach var="rank" items="${rank }" varStatus="aistatus">
				 <c:if test="${rank.nested1 == 3 or rank.nested2 == 3}">
			        <!-- Item -->
			        <div class="col px-4" style="width: 250px;">
			          <div class="card">
			
			            <!-- Image -->
			            <div class="card-img" style="width: 100%; height: 250px;">
			
			              <!-- Action -->
			              <div class="btn btn-xs btn-circle btn-white-primary card-action card-action-end">
			                ${aistatus.index + 1}
			              </div>
			
			              <!-- Image -->
			              <img class="card-img-top" src="/upload/profile/${rank.profile_real }" alt="..." style="width: 90%; height: 250px;">
			
			            </div>
			
			            <!-- Body -->
			            <div class="card-body fw-bold text-center">
			              <a class="text-body" href="product.html">${rank.nickname }</a> <br>
			              <span class="text-muted">${rank.info }</span>
			            </div>
			
			          </div>
			        </div>
			       </c:if>
				</c:forEach>
		      </div>
		</div>
		
		
		<!-- 기타 -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-10 col-lg-8 col-xl-2 col-xl-6">
					

					<!-- Nav -->
					<div class="nav justify-content-center mb-10" style="margin-top:100px">
						<h5 class="mb-4 text-center">기타</h5>
					</div>

				</div>
			</div>

		      <div class="flickity-page-dots-progress" data-flickity='{"pageDots": true}'>
				<c:forEach var="rank" items="${rank }" varStatus="etcstatus">
				 <c:if test="${rank.nested1 == 4 or rank.nested2 == 4}">
			        <!-- Item -->
			        <div class="col px-4" style="width: 250px;">
			          <div class="card">
			
			            <!-- Image -->
			            <div class="card-img" style="width: 100%; height: 250px;">
			
			              <!-- Action -->
			              <div class="btn btn-xs btn-circle btn-white-primary card-action card-action-end">
			                ${etcstatus.index + 1}
			              </div>
			
			              <!-- Image -->
			              <img class="card-img-top" src="/upload/profile/${rank.profile_real }" alt="..." style="width: 90%; height: 250px;">
			
			            </div>
			
			            <!-- Body -->
			            <div class="card-body fw-bold text-center">
			              <a class="text-body" href="product.html">${rank.nickname }</a> <br>
			              <span class="text-muted">${rank.info }</span>
			            </div>
			
			          </div>
			        </div>
			       </c:if>
				</c:forEach>
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
	<!-- 실시간 인기 서비스 -->
    <script>
	    $(document).ready(function() {
	        $('.popular').on('click', function(event) {
	            event.preventDefault(); // 기본 동작 방지
	            var value = $(this).data('value');
	            
	            $.ajax({
	                url: '/index2.do',
	                type: 'POST',
	                cache: false,
	                data: { value: value },
	                success: function(response) {
	                    // 받은 데이터를 이용하여 페이지 내용을 업데이트
	                    var productList = $('#popular_list');
	                    productList.empty();     
	                    console.log("reponse=" +response);
	
	                    $.each(response.list, function(index, vo) {
	                        var title = vo.title;
	                        var price = vo.price;
	                        var thumbnail_real = vo.thumbnail_real;
	                        var productHtml = '';
	                        productHtml += '<div class="col-6 col-md-4 col-lg-3">';
	                        productHtml += '    <div class="card mb-7">';
	                        productHtml += '        <div class="badge bg-white text-body card-badge card-badge-start text-uppercase">';
	                        productHtml += '            New';
	                        productHtml += '        </div>';
	                        productHtml += '        <div class="card-img">';
	                        productHtml += '            <a class="card-img" href="/selllist/view.do?sellno=' + vo.sellno + '">';
	                        productHtml += '                <img class="card-img-top card-img-front" src="/upload/thumbnail/' + thumbnail_real + '" style="width: 90%; height: 250px; object-fit: cover;">';
	                        productHtml += '            </a>';
	                        productHtml += '        </div>';
	                        productHtml += '        <div class="card-body px-0">';
	                        productHtml += '            <div class="fs-xs">';
	                        productHtml += '                <a class="text-muted" href="/selllist/view.do?sellno=' + vo.sellno + '">카테고리? 별점? 중 뭐넣을까</a>';
	                        productHtml += '            </div>';
	                        productHtml += '            <div class="fw-bold">';
	                        productHtml += '                <a class="text-body" href="/selllist/view.do?sellno=' + vo.sellno + '">' + title + '</a>';
	                        productHtml += '            </div>';
	                        productHtml += '            <div class="fw-bold text-muted">' + price + '원</div>';
	                        productHtml += '        </div>';
	                        productHtml += '    </div>';
	                        productHtml += '</div>';
	                        productList.append(productHtml);
	                    });
	                },
	                error: function(xhr, status, error) {
	                    // 실패 시 처리할 코드
	                    console.log('에러:', error);
	                }
	            });
	        });
	    });
	</script>
    <!-- 신규등록서비스 -->
    <script>
	    $(document).ready(function() {
	        $('.regis').on('click', function(event) {
	            event.preventDefault(); // 기본 동작 방지
	            var value = $(this).data('value');
	            
	            $.ajax({
	                url: '/index1.do',
	                type: 'POST',
	                cache:false,
	                data: { value: value },
	                success: function(response) {
	                    // 받은 데이터를 이용하여 페이지 내용을 업데이트
	                    var productList = $('#productList');
	                    productList.empty();
	
	                    $.each(response.list, function(index, vo) {
	                    	var title = vo.title;
	                    	var price = vo.price;
	                    	var thumbnail_real = vo.thumbnail_real;
	                        var productHtml = '';
	                        productHtml += '    <div class="col-6 col-md-4 col-lg-3">';
                        	productHtml += '        <div class="card mb-7">';
                       		productHtml += '            <div class="badge bg-white text-body card-badge card-badge-start text-uppercase">';
                   			productHtml += '                New';
                 			productHtml += '            </div>';
                 			productHtml += '            <div class="card-img">';
                 			productHtml += '                <a class="card-img" href="/selllist/view.do?sellno=${vo.sellno}">';
                 			productHtml += '                    <img class="card-img-top card-img-front" src="/upload/thumbnail/' + thumbnail_real + '" style="width: 90%; height: 250px; object-fit: cover;">';
                 			productHtml += '                </a>';
                 			productHtml += '             </div>';
                 			productHtml += '            <div class="card-body px-0">';
                 			productHtml += '                 <div class="fs-xs">';
                 			productHtml += '                     <a class="text-muted" href="/selllist/view.do?sellno="></a>';
                 			productHtml += '                 </div>';
                 			productHtml += '                 <div class="fw-bold">';
                 			productHtml += '                     <a class="text-body" href="/selllist/view.do?sellno=">'+title+'</a>';
                 			productHtml += '                </div>';
                 			productHtml += '                <div class="fw-bold text-muted">'+price+'원</div>';
                 			productHtml += '            </div>';
                 			productHtml += '        </div>';
                 			productHtml += '   </div>';
	                        productList.append(productHtml);
	                    });
	                },
	                error: function(xhr, status, error) {
	                    // 실패 시 처리할 코드
	                    console.log('에러:', error);
	                }
	            });
	        });
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