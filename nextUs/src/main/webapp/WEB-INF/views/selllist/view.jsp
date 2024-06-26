<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.categoryname } | NEXt Us</title>
<!-- 헤더푸터 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/contents.css" />
<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />
<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 폼 제출 js -->
<script>
	function chat() {
		if (${login == null}) {
			if (confirm('로그인 후 이용 가능합니다. 로그인 하시겠습니까?')) {
				window.location.href = '/member/login.do';
			}
		} else {
			window.location.href = '/chat/chatStart.do?sellno=${vo.sellno}&senderno=${login.no}&opno=${vo.seller}';
		}
	}

	
	
	function addcart() {
		if (${login == null}) {
			if (confirm('로그인 후 이용 가능합니다. 로그인 하시겠습니까?')) {
	            window.location.href = '/member/login.do';
	        }
    	} else {
    		
    		$.ajax({
	            url: '/cart/checkcart.do',
	            type: 'GET',
	            data: {
	            	sellno: ${vo.sellno},
	            	optionno: getSelectedOptionValue()
	            },
	            success: function(response) {
	            	if(response === 'success') {
	            		 $.ajax({
	                         url: '/cart/insert.do',
	                         type: 'GET',
	                         data: {
	                             sellno: ${vo.sellno},
	                             optionno: getSelectedOptionValue()
	                         },
	                         success: function(insertResponse) {
	                        	 if (insertResponse === 'success') {
	                        		 if (confirm('상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?')) {
		                                 window.location.href = '/cart/view.do';
		                             }
	                        	 } else {
	                        		 alert('장바구니에 담는 중 문제가 발생했습니다.');
	                        	 }
	                             
	                         },
	                         error: function(xhr, status, error) {
	         	            	alert('서버와의 통신에 문제가 발생했습니다.');
	         	            }

	                     });
	            	} else {
	            		alert('이미 장바구니에 담긴 상품입니다.');
	            	}
	            },
	            error: function(xhr, status, error) {
	            	alert('서버와의 통신에 문제가 발생했습니다.');
	            }
	          });
    		
    	}

	}

	
</script>


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
              <li>
                <a class="text-gray-400" href="/index.do">Home > </a>
              </li>
              <li>
                <a class="text-gray-400" href="/selllist/index.do?categoryno=${vo.categoryno }">&ensp; ${vo.categoryname} > </a>
              </li>
              <li>
                &ensp;${vo.title }
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
                    <a href="#" data-bigpicture='{ "imgSrc": "/upload/thumbnail/${vo.thumbnail_real}"}'>
                      <img src="/upload/thumbnail/${vo.thumbnail_real}" alt="..." class="card-img-top">
                    </a>
                  </div>
                </div>
              </div>
              <div class="col-12 col-md-6 ps-lg-10">

                <!-- Header -->
                <div class="row mb-1">
                  <div class="col">

                    <!-- Preheading -->
                    <a class="text-muted" href="/selllist/index.do?categoryno=${vo.categoryno }">${vo.categoryname}</a>

                  </div>
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

                    <a class="fs-sm text-reset ms-2" href="#reviews">
                      Reviews (<fmt:formatNumber value="${vo.rating_avg}" type="number" maxFractionDigits="1" minFractionDigits="1" />)
                    </a>

                  </div>
                </div>

                <!-- Heading -->
                <h3 class="mb-2">${vo.title }</h3>

                <!-- Price -->
                <div class="mb-7">
                  <span class="ms-1 fs-5 fw-bolder text-primary" id="price">
                  <fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.bronzeprice }" />원
                  </span>
                </div>

                <!-- Form -->
                <form method="get" name="frm" action="/cart/insert.do" enctype="multipart/form-data">
                  	<!-- Hidden field -->
        			<input type="hidden" name="sellno" value="${vo.sellno }">
        			
                  <div class="form-group">

                    <!-- Label -->
                    <p class="mb-5">
                      옵션: <strong><span id="optionname">BRONZE</span></strong>
                    </p>
                    <!-- 옵션별 설명 -->
                    <p class="mb-5">
                      <span id="optionDescription">${vo.bronzecontent }</span>
                    </p>
					
                    
                    <!-- Radio -->
                    <div class="mb-2">
                      <div class="form-check form-check-inline form-check-size mb-2">
                        <input type="radio" class="form-check-input" name="optionno" id="sizeRadioOne" value="${vo.bronzeoptionno }" data-toggle="form-caption" checked>
                        <label class="form-check-label" for="sizeRadioOne">BRONZE</label>
                      </div>
                      <div class="form-check form-check-inline form-check-size mb-2">
                        <input type="radio" class="form-check-input" name="optionno" id="sizeRadioTwo" value="${vo.silveroptionno }" data-toggle="form-caption">
                        <label class="form-check-label" for="sizeRadioTwo">SILVER</label>
                      </div>
                      <div class="form-check form-check-inline form-check-size mb-2">
                        <input type="radio" class="form-check-input" name="optionno" id="sizeRadioThree" value="${vo.goldoptionno }" data-toggle="form-caption">
                        <label class="form-check-label" for="sizeRadioThree">GOLD</label>
                      </div>
                    </div>
                    <!-- 옵션마다 가격,설명 바뀌는 자바스크립트 -->
                    <script>
					  document.addEventListener('DOMContentLoaded', function () {
					    const optionnameElement = document.getElementById('optionname');
					    const priceElement = document.getElementById('price');
					    const descriptionElement = document.getElementById('optionDescription');
					    const radios = document.querySelectorAll('input[name="optionno"]');
					    const select = document.getElementById('optionSelect');
						
					    const optionname = {
					    		${vo.bronzeoptionno }: 'BRONZE',
					    		${vo.silveroptionno }: 'SILVER',
					    		${vo.goldoptionno }: 'GOLD'
							    };
					    
					    const prices = {
					    		${vo.bronzeoptionno }: ${vo.bronzeprice},
					    		${vo.silveroptionno }: ${vo.silverprice},
					    		${vo.goldoptionno }: ${vo.goldprice}
					    };
					
					    const descriptions = {
					    		${vo.bronzeoptionno }: '${vo.bronzecontent}',
					    		${vo.silveroptionno }: '${vo.silvercontent}',
					    		${vo.goldoptionno }: '${vo.goldcontent}'
					    };
					
					    function formatPrice(price) {
					      return price.toLocaleString() + '원';
					    }
					
					    function updatePriceAndDescription(option) {
					   		optionnameElement.textContent = optionname[option];
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
					<!-- 선택된 옵션 값이 장바구니에 있는지 확인하기 위해 필요 -->
					<script>
					  function getSelectedOptionValue() {
					    const selectedOption = document.querySelector('input[name="optionno"]:checked');
					    if (selectedOption) {
					      const selectedValue = selectedOption.value;
					      console.log("Selected Option Value: " + selectedValue);
					      return selectedValue;
					    } else {
					      console.log("No option selected.");
					      return null;
					    }
					  }

					</script>
					
					<!-- 로그인한 사용자와 이 글의 셀러가 같은 사람이 아니면 -->
                    <c:if test="${vo.seller != login.no}">
                    <div class="row gx-5 mb-7">
                      <div class="col-12 col-lg">

                        <!-- Submit -->
                        <button type="button" class="btn w-100 btn-dark mb-2" id="cart_add_btn" onclick="addcart();">
                          장바구니에 담기
                        </button>

                      </div>
                      
                      <div class="col-12 col-lg-auto">

                      <!-- Wishlist -->
					  <c:choose>
					    <c:when test="${iswishlist == 0}">
					      <a href="javascript:insertwishlist();" class="btn btn-outline-dark w-100 mb-2" role="button" style="background-color: black;">
					        <img src="/resources/imgs/heartwhite.png" alt="Image" width="30px" height="30px">
					      </a>
					    </c:when>
					    <c:otherwise>
					      <a href="javascript:deletewishlist();" class="btn btn-outline-dark w-100 mb-2" role="button" style="background-color: black;">
					        <img src="/resources/imgs/heart.png" alt="Image" width="30px" height="30px">
					      </a>
					    </c:otherwise>
					  </c:choose>

                      </div>
                      <!-- 찜 등록 js -->
							<script type="text/javascript">
								function insertwishlist() {
									if (${login == null}) {
										if (confirm('로그인 후 이용 가능합니다. 로그인 하시겠습니까?')) {
								            window.location.href = '/member/login.do';
								        }
							    	} else {
									$.ajax({
							            url: '/wishlist/insert.do',
							            type: 'POST',
							            data: {
							              memberno: ${login.no },
							              sellno: ${vo.sellno }
							            },
							            success: function(response) {
							              alert('찜 목록에 추가되었습니다.');
							              location.reload();
							            },
							            error: function(xhr, status, error) {
							              alert('추가 중 오류가 발생했습니다.');
							            }
							          });
									}
								}
							</script>
                      
                    </div>
                    </c:if>
                    <!-- 찜 삭제 js -->
							<script type="text/javascript">
								function deletewishlist() {
									$.ajax({
							            url: '/wishlist/delete.do',
							            type: 'POST',
							            data: {
							              memberno: ${login.no },
							              sellno: ${vo.sellno }
							            },
							            success: function(response) {
							              alert('찜 목록에서 삭제되었습니다.');
							              location.reload();
							            },
							            error: function(xhr, status, error) {
							              alert('추가 중 오류가 발생했습니다.');
							            }
							          });
								}
							</script>
                      
                    </div>
                    
                    
                    <c:if test="${vo.seller != login.no}">
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
								<a href="javascript:chat();" class="btn w-100 btn-dark mb-2" id="checkoutButton">
								    판매자와 1대1 채팅하기<img src="/resources/imgs/chatico.png" alt="Image" width="30px" height="30px">
								</a>
                        </div>
                    </div>

                    
                    </form>
                    </c:if>
                    
                    
                    <c:if test="${login != null}">
                    판매글 신고하기
                    <!-- 신고 버튼 -->
	                <a data-bs-toggle="collapse" href="#singoForm">
	                  <img src="/resources/imgs/singo.jpg" alt="Image" width="30px" height="30px">
	                </a>
	            	</c:if>
	                <!-- 신고 작성 폼 -->
		            <!-- New Review -->
		            <div class="collapse" id="singoForm">
		
		              <!-- Divider -->
		              <hr class="my-8">
		
		              <!-- Form -->
		              <form method="post" name="frm" action="/report/insert.do" enctype="multipart/form-data">
		                <div class="row">
		                  <div class="col-12 mb-6 text-center">
							
		        			<!-- Hidden field -->
		        			<input type="hidden" name="sellno" value="${vo.sellno }">
		        			<input type="hidden" name="memberno" value="${login.no }">
		        			<input type="hidden" name="status" value=1>
		                    <!-- Text -->
		                    <p class="mb-1 fs-xs">
		                      신고 내용을 작성해주세요
		                    </p>
		
		                  </div>
		                  <div class="col-12">
		
		                    <!-- 신고 내용 -->
		                    <div class="form-group">
		                      <label class="visually-hidden" for="reviewText">Review:</label>
		                      <textarea class="form-control form-control-sm" name="content" id="reviewText" rows="5" placeholder="신고 사유를 상세히 작성해주세요 *" required></textarea>
		                    </div>
		
		                  </div>
		                  <div class="col-12 text-center">
		
		                    <!-- 신고 등록 -->
		                    <button class="btn btn-outline-dark" type="submit" style="background-color: gray;">
		                      판매글 신고하기
		                    </button>
		
		                  </div>
		                </div>
		              </form>

            		</div>
	                
	                
	                
                    
<!--                     <a href="https://example.com" class="chat-link">
					    <img src="/resources/imgs/singo.jpg" alt="Image" width="30px" height="30px">
					</a>
                  </div> -->
                

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
                          <li>이 판매자의 평균 별점: <fmt:formatNumber value="${vo.sellerrating_avg}" type="number" minFractionDigits="1" maxFractionDigits="1" />점</li>
                          <li>총 리뷰 수: ${vo.sellerreview_cnt }개</li>
                          <li>&nbsp;</li> <!-- 줄 띄우기 -->
  						  <li><a href="/seller/sellerProfile/${vo.seller}" style="color: blue;">판매자 소개페이지 -></a></li>
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
            <c:forEach var="relation" items="${relation}">
            	<c:if test="${relation.sellno != vo.sellno}">
              <div class="col-6 col-sm-6 col-md-4 col-lg-3">

                <!-- Card -->
                <div class="card mb-7">

                  <!-- Image -->
                  <div class="card-img">

                    <!-- Image -->
                    <a class="card-img" href="/selllist/view.do?sellno=${relation.sellno }">
                      <img class="card-img-top card-img-front" src="/upload/thumbnail/${relation.thumbnail_real}" alt="...">
                    </a>

                  </div>

                  <!-- Body -->
                  <div class="card-body px-0">

                    <!-- Category -->
                    <div class="fs-xs">
                      <a class="text-muted">${relation.categoryname }</a>
                    </div>

                    <!-- Title -->
                    <div class="fw-bold">
                      <a class="text-body" href="/selllist/view.do?sellno=${vo.sellno }">
                        ${relation.title }
                      </a>
                    </div>

                    <!-- Price -->
                    <div class="fw-bold text-muted">
                      <fmt:formatNumber type="number" maxFractionDigits="3" value="${relation.price }" />원
                    </div>
                  </div>
                </div>
              </div>
              </c:if>
              </c:forEach>
              
            </div>

          </div>
        </div>
      </div>
    </section>
	
	<!-- 페이지 로드 시 해시를 처리하여 특정 위치로 이동 -->
	  <script>
	    window.onload = function() {
	      // 해시가 있는지 확인
	      if (window.location.hash) {
	        // 해시에서 ID를 가져오기
	        var targetId = window.location.hash.substring(1);
	        // 해당 ID를 가진 요소로 스크롤
	        document.getElementById(targetId).scrollIntoView({ behavior: 'smooth' });
	      }
	      
	      const data = {
	    		  memberno: "",
	    		  sellno: ""
	      }
	    };
	  </script>
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



              </div>
              <div class="col-12 col-md text-md-center">

                <!-- Rating -->
                 <!-- 별점 별개수로 표현하는곳 소수점은 안되는듯 -->
                <div class="rating text-dark h6 mb-4 mb-md-0" data-value="<fmt:formatNumber value="${vo.rating_avg}" type="number" maxFractionDigits="0" minFractionDigits="0" />">
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
              <c:if test="${vo.isreview > 0}">
              <div class="col-12 col-md-auto">

                <!-- Button -->
                <!-- 리뷰 작성 버튼 -->
                <a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#reviewForm">
                  리뷰 작성하기
                </a>

              </div>
              </c:if>
              
            </div>

            <!-- 리뷰 작성 폼 -->
            <!-- New Review -->
            <div class="collapse" id="reviewForm">

              <!-- Divider -->
              <hr class="my-8">

              <!-- Form -->
              <form method="post" name="frm" action="/review/insert.do" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-12 mb-6 text-center">
					
        			<!-- Hidden field -->
        			<input type="hidden" name="sellno" value="${vo.sellno }">
        			<input type="hidden" name="seller" value="${vo.seller }">
        			<input type="hidden" name="writeno" value="${login.no }">
                    <!-- Text -->
                    <p class="mb-1 fs-xs">
                      Score:
                    </p>

                    <!-- Rating form -->
                    <div class="rating-form">

                      <!-- Input -->
                      <input class="rating-input" name="score" type="range" min="1" max="5" value="5">

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
                  <div class="col-12">
			
                    <!-- 리뷰 제목 -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
                      <input class="form-control form-control-sm" name="title" id="reviewTitle" type="text" placeholder="Review Title *" required>
                    </div>

                  </div>
                  <div class="col-12">

                    <!-- 리뷰 내용 -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewText">Review:</label>
                      <textarea class="form-control form-control-sm" name="text" id="reviewText" rows="5" placeholder="Review *" required></textarea>
                    </div>

                  </div>
                  <div class="col-12 text-center">

                    <!-- 리뷰 등록 -->
                    <button class="btn btn-outline-dark" type="submit" style="background-color:black;">
                      리뷰 등록하기
                    </button>

                  </div>
                </div>
              </form>

            </div>

            <!-- Reviews -->
            <div class="mt-8">
			<c:forEach var="review" items="${review.list }">
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
                          <div class="rating fs-sm text-dark" data-value="${review.score }">
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
                            ${review.writer }, <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.writedate }" />&emsp;<c:if test="${login.no == review.writeno}"><a href="javascript:commentDel(${review.reviewno});">[삭제]</a></c:if>
                          </span>
                          <!-- 댓글 삭제 js -->
							<script type="text/javascript">
								function commentDel(reviewno) {
									$.ajax({
							            url: '/review/delete.do',
							            type: 'POST',
							            data: {
							              reviewno: reviewno,
							              sellno: ${vo.sellno }
							            },
							            success: function(response) {
							              alert('리뷰가 삭제되었습니다.');
							              location.reload();
							            },
							            error: function(xhr, status, error) {
							              alert('삭제 중 오류가 발생했습니다.');
							            }
							          });
								}
							</script>
							
							<c:if test="${login != null}">
                          <span class="fs-xs text-muted" style="position: absolute; right: 10px;">
						  	신고하기
						  	<!-- 신고 버튼 -->
			                <a data-bs-toggle="collapse" href="#reviewsingoForm${review.reviewno}">
			                  <img src="/resources/imgs/singo.jpg" alt="Image" width="20px" height="20px">
			                </a>
						  </span>
						  </c:if>
						  <!-- 리뷰신고 작성 폼 -->
			     
				            <div class="collapse" id="reviewsingoForm${review.reviewno}">
				
				              <!-- Divider -->
				              <hr class="my-8">
				
				              <!-- Form -->
				              <form method="post" name="frm" action="/report/insert.do" enctype="multipart/form-data">
				                <div class="row">
				                  <div class="col-12 mb-6 text-center">
									
				        			<!-- Hidden field -->
				        			<input type="hidden" name="reviewno" value="${review.reviewno }">
				        			<input type="hidden" name="sellno" value="${vo.sellno }">
				        			<input type="hidden" name="memberno" value="${login.no }">
				        			<input type="hidden" name="status" value=1>
				                    <!-- Text -->
				                    <p class="mb-1 fs-xs">
				                      신고 사유를 작성해주세요
				                    </p>
				
				                  </div>
				                  <div class="col-12">
				
				                    <!-- 신고 내용 -->
				                    <div class="form-group">
				                      <label class="visually-hidden" for="reviewText">Review:</label>
				                      <textarea class="form-control form-control-sm" name="content" id="reviewText" rows="5" placeholder="신고 사유를 상세히 작성해주세요 *" required></textarea>
				                    </div>
				
				                  </div>
				                  <div class="col-12 text-center">
				
				                    <!-- 신고 등록 -->
				                    <button class="btn btn-outline-dark" type="submit" style="background-color: gray;">
				                      리뷰 신고하기
				                    </button>
				
				                  </div>
				                </div>
				              </form>
		
		            		</div>
                          

                        </div>
                      </div>

                      <!-- 리뷰 제목 -->
                      <p class="mb-2 fs-lg fw-bold">
                        ${review.title }
                      </p>

                      <!-- 리뷰 내용 -->
                      <p class="text-gray-500">
                        ${review.text }
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
			
			<!-- 페이지 처리 -->
            <nav class="d-flex justify-content-center mt-10">
              <ul class="pagination pagination-sm text-gray-400">
              	<c:if test="${review.prev }">
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="view.do?sellno=${vo.sellno }&page=${review.startPage-1 }&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}#reviews">
                    <i class="fa fa-caret-left"></i>
                  </a>
                </li>
                </c:if>
                
                <c:forEach var="p" begin="${review.startPage}" end="${review.endPage}">
                	<c:if test="${p == reviewVO.page}">
	                <li class="page-item active">
	                  <a class="page-link" href="#">${p}</a>
	                </li>
	                </c:if>
					
					<c:if test="${p != reviewVO.page}">
	                <li class="page-item">
	                  <a class="page-link" href="view.do?sellno=${vo.sellno }&page=${p}&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}#reviews">${p}</a>
	                </li>
	                </c:if>
	            </c:forEach>
                
                <c:if test="${review.next }">
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="view.do?sellno=${vo.sellno }&page=${review.endPage+1 }&searchType=${ReviewVO.searchType}&searchWord=${ReviewVO.searchWord}#reviews">
                    <i class="fa fa-caret-right"></i>
                  </a>
                </li>
                </c:if>
              </ul>
            </nav>
			
			<!-- 검색 -->
			<div class="bbsSearch">
				<form method="get" name="searchForm" id="searchForm" action="view.do#reviews">
					<input type="hidden" name="sellno" value="${vo.sellno }">
					<span class="srchSelect"> <select id="stype" name="searchType" class="dSelect" title="검색분류 선택">
							<option value="all">전체</option>
							<option value="title"
								<c:if test="${ReviewVO.searchType == 'title'}">selected</c:if>>제목</option>
							<option value="text"
								<c:if test="${ReviewVO.searchType == 'text'}">selected</c:if>>내용</option>
					</select>
					</span> 
					<span class="searchWord"> 
						<input type="text" id="sval" name="searchWord" value="${ReviewVO.searchWord}" title="검색어 입력">
						<input type="submit" id="" value="검색" title="검색">
					</span>
				</form>
			</div>
			
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