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
              <li>
                <a class="text-gray-400" href="index.html">Home ></a>
              </li>
              <li>
                &ensp; 마이페이지
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
                <a class="list-group-item list-group-item-action dropend-toggle active" href="orderlist.do">
                  주문 내역
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="wishlist.do">
                  찜 목록
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="pinfo.do">
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
			<c:forEach var="order" items="${order.list }">
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

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">구매일자:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 fs-sm fw-bold">
                          <time datetime="2019-10-01">
                            <fmt:formatDate pattern="yyyy-MM-dd" value="${order.buydate }" />
                          </time>
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">결제 상태:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          ${order.status == 1 ? '결제완료' : order.status == 2 ? '환불 대기중' : order.status == 3 ? '환불 완료' : order.status == 4 ? '구매 확정' : ''}
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
                <div class="row align-items-center">
                
                  <div class="col-12 col-lg-6">
                    주문 상품: ${order.selltitle }
                    
                    
                  </div>
                  
                  <div class="col-12 col-lg-6">
                    <div class="row gx-5">
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm w-100 btn-outline-dark" href="orderdetail.do?no=${order.buyno }">
                          주문상세
                        </a>

                      </div>
                      <script>
						    document.addEventListener("DOMContentLoaded", function() {
						        console.log("DOMContentLoaded event fired");
						        var orderStatus = ${order.status}; // 서버로부터 전달된 order.status 값
						        var purchaseButton = document.getElementById("purchase-button${order.buyno }");
						
						        console.log("orderStatus: " + orderStatus);
						        
						        if (orderStatus === 1) {
						            console.log("Displaying purchase button");
						            purchaseButton.style.display = "block";
						        } else {
						            console.log("Not displaying purchase button");
						        }
						        
						        purchaseButton.addEventListener("click", function(event) {
						            event.preventDefault(); // 기본 동작을 막음
						            console.log("Purchase button clicked");
						            var userConfirmed = confirm("구매를 확정하시겠습니까?");
						            
						            if (userConfirmed) {
						                console.log("User confirmed purchase");
						                window.location.href = "confirm.do?no=${order.buyno }";
						            } else {
						                console.log("User cancelled purchase");
						            }
						        });
						    });
						</script>
                      
                      
					  <div class="col-6">
						    <!-- Button -->
						    <button id="purchase-button${order.buyno }" class="btn btn-sm w-100 btn-primary" style="display: none;">
						        구매확정
						    </button>
						</div>
						
                  
                  	</div>
                </div>
              </div>
              </div>
              </c:forEach>
            </div>
            
          <!-- 페이지 처리 -->
            
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