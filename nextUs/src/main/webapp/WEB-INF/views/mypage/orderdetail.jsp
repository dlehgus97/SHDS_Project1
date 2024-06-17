<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더푸터 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />
<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
<!-- 자체제작 css -->
<style>
        .refund-request {
            text-align: right;
            color: red;
        }
</style>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
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
              <li class="breadcrumb-item active">
                마이페이지
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

    <!-- CONTENT -->
    <section class="pt-7 pb-12">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">

            <!-- Heading -->
            <h3 class="mb-10">마이페이지</h3>

          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-3">

            <!-- Nav -->
            <nav class="mb-10 mb-md-0">
              <div class="list-group list-group-sm list-group-strong list-group-flush-x">
                <a class="list-group-item list-group-item-action dropend-toggle active" href="orderlist.do?no=${login.no}">
                  주문 내역
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-wishlist.html">
                  찜 목록
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-personal-info.html">
                  내정보
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-address.html">
                  문의 내역
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-payment.html">
                  보유 쿠폰
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle" href="#!">
                  회원 탈퇴
                </a>
              </div>
            </nav>

          </div>
          <div class="col-12 col-md-9 col-lg-8 offset-lg-1">

            <!-- Order -->
            <div class="card card-lg mb-5 border">
              <div class="card-body pb-0">

                <!-- Info -->
                <div class="card card-sm">
                  <div class="card-body bg-light">
                    <div class="row">
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">주문번호:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 fs-sm fw-bold">
                          ${order.buyno }
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">
						<c:choose>
      						<c:when test="${not empty order.decidedate}">
		                        <!-- Heading -->
		                        <h6 class="heading-xxxs text-muted">구매확정일자:</h6>
		
		                        <!-- Text -->
		                        <p class="mb-lg-0 fs-sm fw-bold">
		                            <fmt:formatDate pattern="yyyy-MM-dd" value="${order.decidedate }" />
		                        </p>
		                     </c:when>
		                     <c:otherwise>
		                     	<!-- Heading -->
		                        <h6 class="heading-xxxs text-muted">결제일자:</h6>
		
		                        <!-- Text -->
		                        <p class="mb-lg-0 fs-sm fw-bold">
		                            <fmt:formatDate pattern="yyyy-MM-dd" value="${order.buydate }" />
		                        </p>
						     </c:otherwise>
						</c:choose>
                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">결제 상태:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          ${order.status == 1 ? '결제완료' : order.status == 2 ? '구매취소' : order.status == 3 ? '구매확정' : ''}
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">결제 금액:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.price }" />원
                        </p>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="card-footer">

                <!-- Heading -->
                <h6 class="mb-7">주문 상품 상세</h6>

                <!-- Divider -->
                <hr class="my-5">

                <!-- List group -->
                <ul class="list-group list-group-lg list-group-flush-y list-group-flush-x">
                  <li class="list-group-item">
                    <div class="row align-items-center">
                      <div class="col-4 col-md-3 col-xl-2">

                        <!-- Image -->
                        <a href="product.html"><img src="/upload/board/${order.sellthumbnail}" alt="..." class="img-fluid"></a>

                      </div>
                      <div class="col">

                        <!-- Title -->
                        <p class="mb-4 fs-sm fw-bold">
                          <a class="text-body" href="product.html">${order.selltitle }</a> <br>
                          <span class="text-muted">
                          	<fmt:formatNumber type="number" maxFractionDigits="3" value="${order.price }" />원
                          </span>
                        </p>

                        <!-- Text -->
                        <div class="fs-sm text-muted">
                          옵션: ${order.optionrank } <br><br>
                          옵션상세:<br> ${order.optioncontent }
                        </div>

                      </div>
                    </div>
                  </li>
                </ul>
                	<!-- 환불 버튼 -->
	                <div class="refund-request" >
				        <a data-bs-toggle="collapse" href="#refundForm">환불 요청</a>
				    </div>
                
                	<!-- 환불 사유 작성 폼 -->
		            <!-- New Review -->
		            <div class="collapse" id="refundForm">
		
		              <!-- Divider -->
		              <hr class="my-8">
		
		              <!-- Form -->
		              <form method="post" name="frm" action="/refund/insert.do" enctype="multipart/form-data">
		                <div class="row">
		                  <div class="col-12 mb-6 text-center">
							
		        			<!-- Hidden field -->
		        			<input type="hidden" name="buyno" value="${order.buyno }">
		        			<input type="hidden" name="refund_amount" value="${order.price }">
		                    <!-- Text -->
		                    <p class="mb-1 fs-xs">
		                      환불 사유
		                    </p>
		
		                  </div>
		                  <div class="col-12">
		
		                    <!-- 환불 내용 -->
		                    <div class="form-group">
		                      <label class="visually-hidden" for="reviewText">Review:</label>
		                      <textarea class="form-control form-control-sm" name="content" id="reviewText" rows="5" placeholder="환불 사유를 상세히 작성해주세요 *" required></textarea>
		                    </div>
		
		                  </div>
		                  <div class="col-12 text-center">
		
		                    <!-- 신고 등록 -->
		                    <button class="btn btn-outline-dark" type="submit">
		                      환불 요청하기
		                    </button>
		
		                  </div>
		                </div>
		              </form>

            		</div>
              </div>
            </div>

            <!-- Total -->
            <div class="card card-lg mb-5 border">
              <div class="card-body">

                <!-- Heading -->
                <h6 class="mb-7">결제 정보:</h6>

                <!-- List group -->
                <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
                  <li class="list-group-item d-flex">
                    <span>Subtotal</span>
                    <span class="ms-auto">$128.00</span>
                  </li>
                  <li class="list-group-item d-flex">
                    <span>Tax</span>
                    <span class="ms-auto">$0.00</span>
                  </li>
                  <li class="list-group-item d-flex">
                    <span>Shipping</span>
                    <span class="ms-auto">$8.00</span>
                  </li>
                  <li class="list-group-item d-flex fs-lg fw-bold">
                    <span>Total</span>
                    <span class="ms-auto">$136.00</span>
                  </li>
                </ul>

              </div>
            </div>

            <!-- Details -->
            <div class="card card-lg border">
              <div class="card-body">

                <!-- Heading -->
                <h6 class="mb-7">판매자 정보:</h6>

                <!-- Content -->
                <div class="row">
                  <div class="col-12 col-md-4">

                    <!-- Heading -->
                    <p class="mb-4 fw-bold">
                      Billing Address:
                    </p>

                    <p class="mb-7 mb-md-0 text-gray-500">
                      Daniel Robinson, <br>
                      3997 Raccoon Run, <br>
                      Kingston, 45644, <br>
                      United States, <br>
                      6146389574
                    </p>

                  </div>
                  <div class="col-12 col-md-4">

                    <!-- Heading -->
                    <p class="mb-4 fw-bold">
                      Shipping Address:
                    </p>

                    <p class="mb-7 mb-md-0 text-gray-500">
                      Daniel Robinson, <br>
                      3997 Raccoon Run, <br>
                      Kingston, 45644, <br>
                      United States, <br>
                      6146389574
                    </p>

                  </div>
                  <div class="col-12 col-md-4">

                    <!-- Heading -->
                    <p class="mb-4 fw-bold">
                      Shipping Method:
                    </p>

                    <p class="mb-7 text-gray-500">
                      Standart Shipping <br>
                      (5 - 7 days)
                    </p>

                    <!-- Heading -->
                    <p class="mb-4 fw-bold">
                      Payment Method:
                    </p>

                    <p class="mb-0 text-gray-500">
                      Debit Mastercard
                    </p>

                  </div>
                </div>

              </div>
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