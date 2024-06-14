<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Libs CSS -->
    <link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />
    
    <!-- Theme CSS --> 
    <link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
    <!-- Title -->
    <title>Shopper</title>
    
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
                <a class="text-gray-400" href="/index.do">Home</a>
              </li>
              <li class="breadcrumb-item active">
                Shopping Cart
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
          <div class="col-12">

            <!-- Heading -->
            <h3 class="mb-10 text-center">Shopping Cart</h3>

          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-7">

            <!-- List group -->
            <ul class="list-group list-group-lg list-group-flush-x mb-6">
            <c:forEach var="vo" items="${list}">
              <li class="list-group-item">
                <div class="row align-items-center">
                  <div class="col-3">
		
                    <!-- Image -->
                    <a href="product.html">
                       <img src="/upload/board/${vo.thumbnail_real }" id="썸네일">
                    </a>

                  </div>
                  <div class="col">

                    <!-- Title -->
                    <div class="d-flex mb-2 fw-bold">
                      <a class="text-body" href="product.html">${vo.title}</a> <span class="ms-auto">${vo.price}</span>
                    </div>

                    <!-- Text -->
                    <p class="mb-7 fs-sm text-muted">
                      ${vo.content}
                    </p>

                    <!--Footer -->
                    <div class="d-flex align-items-center">

                      <!-- Remove -->
                      <a class="fs-xs text-gray-400 ms-auto remove-btn" href="#" data-sellno="${vo.sellno}" data-optionno="${vo.optionno}">
                        <i class="fe fe-x"></i> 삭제하기
                      </a>

                    </div>

                  </div>
                </div>
              </li>
            </c:forEach>
              
            </ul>

            <!-- Footer -->
            <div class="row align-items-end justify-content-between mb-10 mb-md-0">
              <div class="col-12 col-md-7">

                <!-- Coupon -->
                <form class="mb-7 mb-md-0">
                  <label class="form-label fs-sm fw-bold" for="cartCouponCode">
                    Coupon code:
                  </label>
                  <div class="row row gx-5">
                    <div class="col">

                      <!-- Input -->
                      <input class="form-control form-control-sm" id="cartCouponCode" type="text" placeholder="쿠폰코드를 입력하세요*">

                    </div>
                    <div class="col-auto">

                      <!-- Button -->
                      <button class="btn btn-sm btn-dark" type="submit">
                        적용
                      </button>

                    </div>
                  </div>
                </form>

              </div>
              <div class="col-12 col-md-auto">


              </div>
            </div>

          </div>
          <div class="col-12 col-md-5 col-lg-4 offset-lg-1">

            <!-- Total -->
            <div class="card mb-7 bg-light">
              <div class="card-body">
                <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
                  <li class="list-group-item d-flex">
                    <span>Subtotal</span> <span class="ms-auto fs-sm">$89.00</span>
                  </li>
                  <li class="list-group-item d-flex">
                    <span>Tax</span> <span class="ms-auto fs-sm">$00.00</span>
                  </li>
                  <li class="list-group-item d-flex fs-lg fw-bold">
                    <span>Total</span> <span class="ms-auto fs-sm">$89.00</span>
                  </li>
                  <li class="list-group-item fs-sm text-center text-gray-500">
                    구매하시기를 원하신다면 아래의 버튼을 눌러주세요 *
                  </li>
                </ul>
              </div>
            </div>

            <!-- Button -->
            <a class="btn w-100 btn-dark mb-2" href="checkout.html">구매하기</a>

          </div>
        </div>
      </div>
    </section>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    

    <!-- JAVASCRIPT -->
    <!-- Map (replace the API key to enable) -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>
    
    <!-- Vendor JS -->
    <script src="/resources/js/board/vendor.bundle.js"></script>
    
    <!-- Theme JS -->
    <script src="/resources/js/board/theme.bundle.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
      $(document).ready(function() {
        $('.remove-btn').click(function(event) {
          event.preventDefault();
          var sellno = $(this).data('sellno');
          var optionno = $(this).data('optionno');

          $.ajax({
            url: '/cart/delete.do',
            type: 'POST',
            data: {
              sellno: sellno,
              optionno: optionno
            },
            success: function(response) {
              alert('상품이 삭제되었습니다.');
              location.reload();
            },
            error: function(xhr, status, error) {
              alert('삭제 중 오류가 발생했습니다.');
            }
          });
        });
      });
    </script>
  </body>
</html>