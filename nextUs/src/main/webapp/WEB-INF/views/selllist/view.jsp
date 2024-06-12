<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더푸터 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />
<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
</head>
<body>
<%-- <h1> 판매글예시 </h1>
<p>${vo.sellno }번 글입니다. 안녕하세요</p>
<p>판매자는 ${vo.seller } 입니다.</p>
<a href="/chat?no=${vo.seller }">상담하러가기</a> --%>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- BREADCRUMB -->
    <nav class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 fs-xs text-gray-400">
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="index.html">Home</a>
              </li>
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="shop.html">카테고리</a>
              </li>
              <li class="breadcrumb-item active">
                ${vo.title }
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

    <!-- PRODUCT -->
    <section>
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="row">
              <div class="col-12 col-md-6">
				<!-- Card -->
                <div class="card">
                  <!-- Slider -->
                  <div class="mb-4" data-flickity='{"draggable": false, "fade": true}' id="productSlider">

                    <!-- Item -->
                    <a href="#" data-bigpicture='{ "imgSrc": "/upload/board/1717978758514.jpg"}'>
                      <img src="/upload/board/1717978758514.jpg" alt="..." class="card-img-top">
                    </a>
                  </div>
                </div>
              </div>
              <div class="col-12 col-md-6 ps-lg-10">

                <!-- Header -->
                <div class="row mb-1">
                  <div class="col">

                    <!-- Preheading -->
                    <a class="text-muted" href="shop.html">카테고리</a>

                  </div>
                  <div class="col-auto">
                    <div class="rating fs-xs text-dark" data-value="${vo.rating_avg }">
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

                    <a class="fs-sm text-reset ms-2" href="#reviews">
                      Reviews (${vo.rating_avg })
                    </a>

                  </div>
                </div>

                <!-- Heading -->
                <h3 class="mb-2">${vo.title }</h3>

                <!-- Price -->
                <div class="mb-7">
                  <span class="ms-1 fs-5 fw-bolder text-primary" id="price">${vo.bronzeprice }원</span>
                </div>

                <!-- Form -->
                <form>
                  
                  <div class="form-group">

                    <!-- Label -->
                    <p class="mb-5">
                      옵션: <strong><span id="sizeCaption">BRONZE</span></strong>
                    </p>
                    <!-- 옵션별 설명 -->
                    <p class="mb-5">
                      <span id="optionDescription">${vo.bronzecontent }</span>
                    </p>
					
                    
                    <!-- Radio -->
                    <div class="mb-2">
                      <div class="form-check form-check-inline form-check-size mb-2">
                        <input type="radio" class="form-check-input" name="optionRadio" id="sizeRadioOne" value="BRONZE" data-toggle="form-caption" data-target="#sizeCaption" checked>
                        <label class="form-check-label" for="sizeRadioOne">BRONZE</label>
                      </div>
                      <div class="form-check form-check-inline form-check-size mb-2">
                        <input type="radio" class="form-check-input" name="optionRadio" id="sizeRadioTwo" value="SILVER" data-toggle="form-caption" data-target="#sizeCaption">
                        <label class="form-check-label" for="sizeRadioTwo">SILVER</label>
                      </div>
                      <div class="form-check form-check-inline form-check-size mb-2">
                        <input type="radio" class="form-check-input" name="optionRadio" id="sizeRadioThree" value="GOLD" data-toggle="form-caption" data-target="#sizeCaption">
                        <label class="form-check-label" for="sizeRadioThree">GOLD</label>
                      </div>
                    </div>
                    <!-- 옵션마다 가격,설명 바뀌는 자바스크립트 -->
                    <script>
					  document.addEventListener('DOMContentLoaded', function () {
					    const priceElement = document.getElementById('price');
					    const descriptionElement = document.getElementById('optionDescription');
					    const radios = document.querySelectorAll('input[name="optionRadio"]');
					    const select = document.getElementById('optionSelect');
					
					    const prices = {
					      BRONZE: ${vo.bronzeprice},
					      SILVER: ${vo.silverprice},
					      GOLD: ${vo.goldprice}
					    };
					
					    const descriptions = {
					      BRONZE: '${vo.bronzecontent}',
					      SILVER: '${vo.silvercontent}',
					      GOLD: '${vo.goldcontent}'
					    };
					
					    function formatPrice(price) {
					      return price.toLocaleString() + '원';
					    }
					
					    function updatePriceAndDescription(option) {
					      priceElement.textContent = formatPrice(prices[option]);
					      descriptionElement.textContent = descriptions[option];
					    }
					
					    radios.forEach(radio => {
					      radio.addEventListener('change', function () {
					        if (this.checked) {
					          updatePriceAndDescription(this.value);
					        }
					      });
					    });
					
					    select.addEventListener('change', function () {
					      updatePriceAndDescription(this.value);
					    });
					
					    // 초기 값 설정
					    updatePriceAndDescription('BRONZE');
					  });
					</script>
                    
                    <div class="row gx-5 mb-7">
                      <div class="col-12 col-lg">

                        <!-- Submit -->
                        <button type="submit" class="btn w-100 btn-dark mb-2">
                          장바구니에 담기
                        </button>

                      </div>
                      <div class="col-12 col-lg-auto">

                        <!-- Wishlist -->
                        <button class="btn btn-outline-dark w-100 mb-2" data-toggle="button">
                          ♥
                        </button>

                      </div>
                    </div>
                    <style>
					  #checkoutButton {
					    background-color: blue;
					    border-color: blue;
					  }
					  #checkoutButton:hover {
					    background-color: darkblue;
					    border-color: darkblue;
					  }
					</style>
                    <div class="row gx-5 mb-7">
                    	<div class="col-12 col-lg">
                    		<button type="submit" class="btn w-100 btn-dark mb-2"  id="checkoutButton">
                          		결제하기
                        	</button>
                        </div>
                    </div>
                    
					판매자와 1대1 채팅
					<a href="/chat?no=${vo.sellno }" class="chat-link">
					    <img src="/resources/imgs/chatico.jpg" alt="Image" width="30px" height="30px">
					</a>
					&emsp;&emsp;
                    판매글 신고하기
                    <a href="https://example.com" class="chat-link">
					    <img src="/resources/imgs/singo.jpg" alt="Image" width="30px" height="30px">
					</a>
                  </div>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- DESCRIPTION -->
    <section class="pt-11">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Nav -->
            <div class="nav nav-tabs nav-overflow justify-content-start justify-content-md-center border-bottom">
              <a class="nav-link active" data-bs-toggle="tab" href="#descriptionTab">
                상품 설명
              </a>
              <a class="nav-link" data-bs-toggle="tab" href="#sizeTab">
                판매자 정보
              </a>
              <a class="nav-link" data-bs-toggle="tab" href="#shippingTab">
                취소&환불 규정
              </a>
            </div>

            <!-- 상품설명, 판매자정보, 취소환불규정 -->
            <div class="tab-content">
            <!-- 상품 설명 -->
              <div class="tab-pane fade show active" id="descriptionTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row">
                      <div class="col-12">
                        <p class="text-gray-500">
                          ${vo.content }
                        </p>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- 판매자 정보 -->
              <div class="tab-pane fade" id="sizeTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row">
                      <div class="col-12 col-md-6">

                        <!-- Text -->
                        <p class="mb-4">
                          <strong>판매자 설명:</strong>
                        </p>

                        <!-- List -->
                        <ul class="list-unstyled text-gray-500">
                          <li>
                            ${vo.info }
                          </li>
                        </ul>

                      </div>
                      <div class="col-12 col-md-6">

                        <!-- Text -->
                        <p class="mb-4">
                          <strong>판매자 평점:</strong>
                        </p>

                        <!-- List -->
                        <ul class="list-unstyled text-gray-500">
                          <li>판매글 평균 평점: ${vo.rating_avg }점</li>
                          <li>총 리뷰 수: ${vo.review_cnt }개</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="shippingTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">

                    <!-- Table -->
                    <div class="table-responsive">
                      <table class="table table-bordered table-sm table-hover">
                        <thead>
                          <tr>
                            <th>조건</th>
                            <th>취소&환불 가능 여부</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>구매 확정 전</td>
                            <td>취소&환불 가능</td>
                          </tr>
                          <tr>
                            <td>구매 확정 후</td>
                            <td>취소&환불 불가</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <!-- PRODUCTS -->
    <section class="pt-11">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Heading -->
            <h4 class="mb-10 text-center">관련 상품</h4>

            <!-- Items -->
            <div class="row">
              <div class="col-6 col-sm-6 col-md-4 col-lg-3">

                <!-- Card -->
                <div class="card mb-7">

                  <!-- Image -->
                  <div class="card-img">

                    <!-- Image -->
                    <a class="card-img-hover" href="product.html">
                      <img class="card-img-top card-img-back" src="assets/img/products/product-121.jpg" alt="...">
                      <img class="card-img-top card-img-front" src="assets/img/products/product-6.jpg" alt="...">
                    </a>

                    <!-- Actions -->
                    <div class="card-actions">
                      <span class="card-action">
                        <button class="btn btn-xs btn-circle btn-white-primary" data-bs-toggle="modal" data-bs-target="#modalProduct">
                          <i class="fe fe-eye"></i>
                        </button>
                      </span>
                      <span class="card-action">
                        <button class="btn btn-xs btn-circle btn-white-primary" data-toggle="button">
                          <i class="fe fe-shopping-cart"></i>
                        </button>
                      </span>
                      <span class="card-action">
                        <button class="btn btn-xs btn-circle btn-white-primary" data-toggle="button">
                          <i class="fe fe-heart"></i>
                        </button>
                      </span>
                    </div>

                  </div>

                  <!-- Body -->
                  <div class="card-body px-0">

                    <!-- Category -->
                    <div class="fs-xs">
                      <a class="text-muted" href="shop.html">Dresses</a>
                    </div>

                    <!-- Title -->
                    <div class="fw-bold">
                      <a class="text-body" href="product.html">
                        Cotton floral print Dress
                      </a>
                    </div>

                    <!-- Price -->
                    <div class="fw-bold text-muted">
                      $40.00
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <!-- REVIEWS -->
    <section class="pt-9 pb-11" id="reviews">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Heading -->
            <h4 class="mb-10 text-center">리뷰</h4>

            <!-- Header -->
            <div class="row align-items-center">
              <div class="col-12 col-md-auto">

                <!-- Dropdown -->
                <div class="dropdown mb-4 mb-md-0">

                  <!-- Toggle -->
                  <a class="dropdown-toggle text-reset" data-bs-toggle="dropdown" href="#">
                    <strong>정렬기준: 최신순</strong>
                  </a>

                  <!-- Menu -->
                  <div class="dropdown-menu mt-3">
                    <a class="dropdown-item" href="#!">최신순</a>
                    <a class="dropdown-item" href="#!">별점높은순</a>
                    <a class="dropdown-item" href="#!">별점낮은순</a>
                  </div>

                </div>

              </div>
              <div class="col-12 col-md text-md-center">

                <!-- Rating -->
                 <!-- 별점 별개수로 표현하는곳 소수점은 안되는듯 -->
                <div class="rating text-dark h6 mb-4 mb-md-0" data-value="3">
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

                <!-- Count -->
                <!-- 리뷰 수 -->
                <strong class="fs-sm ms-2">Reviews (${vo.review_cnt })</strong>

              </div>
              <div class="col-12 col-md-auto">

                <!-- Button -->
                <!-- 리뷰 작성 버튼 -->
                <a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#reviewForm">
                  리뷰 작성하기
                </a>

              </div>
            </div>

            <!-- 리뷰 작성 폼 -->
            <!-- New Review -->
            <div class="collapse" id="reviewForm">

              <!-- Divider -->
              <hr class="my-8">

              <!-- Form -->
              <form>
                <div class="row">
                  <div class="col-12 mb-6 text-center">

                    <!-- Text -->
                    <p class="mb-1 fs-xs">
                      Score:
                    </p>

                    <!-- Rating form -->
                    <div class="rating-form">

                      <!-- Input -->
                      <input class="rating-input" type="range" min="1" max="5" value="5">

                      <!-- Rating -->
                      <div class="rating h5 text-dark" data-value="5">
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

                  </div>
                  <div class="col-12 col-md-6">

                    <!-- Name -->
                    <!-- 로그인한 사용자 이름 들어가게 -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewName">Your Name:</label>
                      <input class="form-control form-control-sm" id="reviewName" type="text" placeholder="Your Name *" required>
                    </div>

                  </div>
                  <div class="col-12">

                    <!-- 리뷰 제목 -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
                      <input class="form-control form-control-sm" id="reviewTitle" type="text" placeholder="Review Title *" required>
                    </div>

                  </div>
                  <div class="col-12">

                    <!-- 리뷰 내용 -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewText">Review:</label>
                      <textarea class="form-control form-control-sm" id="reviewText" rows="5" placeholder="Review *" required></textarea>
                    </div>

                  </div>
                  <div class="col-12 text-center">

                    <!-- 리뷰 등록 -->
                    <button class="btn btn-outline-dark" type="submit">
                      리뷰 등록하기
                    </button>

                  </div>
                </div>
              </form>

            </div>

            <!-- Reviews -->
            <div class="mt-8">

              <!-- Review -->
              <div class="review">
                <div class="review-body">
                  <div class="row">
                    <div class="col-12 col-md-auto">

                      <!-- Avatar -->
                      <div class="avatar avatar-xxl mb-6 mb-md-0">
                        <span class="avatar-title rounded-circle">
                          <i class="fa fa-user"></i>
                        </span>
                      </div>

                    </div>
                    <div class="col-12 col-md">

                      <!-- Header -->
                      <div class="row mb-6">
                        <div class="col-12">

                          <!-- Rating -->
                          <div class="rating fs-sm text-dark" data-value="5">
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
                        <div class="col-12">

                          <!-- 리뷰 작성자, 등록일자 -->
                          <span class="fs-xs text-muted">
                            Logan Edwards, <time datetime="2019-07-25">25 Jul 2019</time>
                          </span>

                        </div>
                      </div>

                      <!-- 리뷰 제목 -->
                      <p class="mb-2 fs-lg fw-bold">
                        So cute!
                      </p>

                      <!-- 리뷰 내용 -->
                      <p class="text-gray-500">
                        Justo ut diam erat hendrerit. Morbi porttitor, per eu. Sodales curabitur diam sociis. Taciti lobortis nascetur. Ante laoreet odio hendrerit.
                        Dictumst curabitur nascetur lectus potenti dis sollicitudin habitant quis vestibulum.
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 페이징 처리 -->
            <nav class="d-flex justify-content-center mt-9">
              <ul class="pagination pagination-sm text-gray-400">
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="#">
                    <i class="fa fa-caret-left"></i>
                  </a>
                </li>
                <li class="page-item active">
                  <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="#">
                    <i class="fa fa-caret-right"></i>
                  </a>
                </li>
              </ul>
            </nav>

          </div>
        </div>
      </div>
    </section>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <!--부트스트랩 JAVASCRIPT -->
	<!-- Map (replace the API key to enable) -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>

	<!-- Vendor JS -->
	<script src="/resources/js/board/vendor.bundle.js"></script>

	<!-- Theme JS -->
	<script src="/resources/js/board/theme.bundle.js"></script>

</body>
</html>