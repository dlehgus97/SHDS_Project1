<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" type="text/css" href="/resources/css/cart.css">
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
              <li>&nbsp;&nbsp;>&nbsp;&nbsp;</li>
              <li>
                <a class="text-gray-400" href="/cart/view.do">Shopping Cart</a>
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
	        <h3 class="mb-10 text-center">[Shopping Cart]</h3>
	
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-12 col-md-7">
	
	        <!-- List group -->
	        <ul class="list-group list-group-lg list-group-flush-x mb-6">
	          <c:set var="total" value="0" />
	          <c:forEach var="vo" items="${list}">
	            <c:set var="total" value="${total + vo.price}"/>
	            <li class="list-group-item">
	              <div class="row align-items-center">
	                <div class="col-1">
	                  <!-- Checkbox -->
	                  <input type="checkbox" class="form-check-input product-checkbox" data-sellno="${vo.sellno}" data-optionno="${vo.optionno}" data-thumbnail="${vo.thumbnail_real}" data-title="${vo.title}" data-price="${vo.price}" data-content="${vo.content}">
	                </div>
	                <div class="col-3">
	                  <!-- Image -->
	                  <a>
	                    <img src="/upload/board/${vo.thumbnail_real }" id="thumbnail-img">
	                  </a>
	                </div>
	                <div class="col">
	                  <!-- Title -->
	                  <div class="d-flex mb-2 fw-bold">
	                    <a class="text-body" href="../selllist/view.do?no=${vo.sellno }">${vo.title}</a> <span class="ms-auto"><fmt:formatNumber value="${vo.price}" type="currency" currencySymbol=""/>원</span>
	                  </div>
	
	                  <!-- Text -->
	                  <p class="mb-7 fs-sm text-muted">
	                    ${vo.content}
	                  </p>
	
	                  <!--Footer -->
	                  <div class="d-flex align-items-center">
	                    <!-- Remove -->
	                    <a class="fs-xs text-gray-400 ms-auto remove-btn" href="#" data-sellno="${vo.sellno}" data-optionno="${vo.optionno}" id ="delete-btn">
	                      삭제하기 <!-- <i class="fe fe-x"></i> 삭제 & id ="delete-btn" 추가 -->
	                    </a>
	                  </div>
	                </div>
	              </div>
	            </li>
	          </c:forEach>
	        </ul>
	        <!-- 장바구니가 비었을 때 표시할 메시지 -->
	        <div id="empty-cart-message" style="display: none;">
	          <h5 class="text-center">장바구니에 담긴 상품이 없습니다</h5>
	        </div>
	      </div>
	      <div class="col-12 col-md-5 col-lg-4 offset-lg-1">
	        <!-- Total -->
	        <div class="card mb-7 bg-light">
	          <div class="card-body">
	            <ul class="list-group list-group-sm list-group-flush-y list-group-flush-x">
	              <li class="list-group-item d-flex">
	                <span>장바구니 총 금액</span>
	                <span id="subtotal" class="ms-auto fs-sm" data-subtotal="${total }"><fmt:formatNumber value="${total}" type="currency" currencySymbol=""/>원</span> <!-- data-subtotal 속성 추가 및 소수점 제거 -->
	              </li>
	              <li class="list-group-item d-flex fs-lg fw-bold">
	                <span>선택상품 총 금액</span>
	                <span id="total" class="ms-auto fs-sm"><fmt:formatNumber value="${total}" type="currency" currencySymbol=""/></span>
	                <span id="won">원</span>
	              </li>
	              <li class="list-group-item fs-sm text-center text-gray-500">
	                구매하시기를 원하신다면<br>
	                아래의 버튼을 눌러주세요 :)
	              </li>
	            </ul>
	          </div>
	        </div>
	
	        <!-- Button -->
	        <form id="buyForm" action="/payment/paymentSelect" method="post">
	        	<button type="submit" class="btn w-100 btn-dark mb-2" id="buy_btn">구매하기</button>
	        </form>
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
	            var listItem = $(this).closest('li.list-group-item');
	
	            $.ajax({
	                url : '/cart/delete.do',
	                type : 'POST',
	                data : {
	                    sellno : sellno,
	                    optionno : optionno
	                },
	                success : function(response) {
	                    alert('상품이 삭제되었습니다.');
	                    listItem.remove();
	
	                    // 장바구니가 비었는지 확인
	                    if ($('.list-group-item').length === 0) {
	                        $('#empty-cart-message').show();
	                    }
	                },
	                error : function(xhr, status, error) {
	                    alert('삭제 중 오류가 발생했습니다.');
	                }
	            });
	        });
	
	        // 페이지 로드 시 장바구니가 비었는지 확인
	        if ($('.list-group-item').length === 0) {
	            $('#empty-cart-message').show();
	        }
	    });
	</script>
	  <script>
    	$(document).ready(function() {
    		  // 체크박스가 변경될 때마다 호출되는 함수
    		  function updateSelectedTotal() {
    		    let selectedTotal = 0;
    		    // 체크된 체크박스의 가격을 합산
    		    $(".product-checkbox:checked").each(function() {
    		      let priceText = $(this).closest("li").find(".fw-bold .ms-auto").text();
    		      // 쉼표와 화폐 기호를 제거하고 숫자로 변환
    		      let price = parseFloat(priceText.replace(/[^0-9.-]+/g,""));
    		      selectedTotal += price;
    		    });
    		    // 합산된 가격을 '선택상품 총 금액'에 표시
    		    $("#total").text(selectedTotal.toLocaleString());
    		  }

    		  // 페이지 로드 시 초기화
    		  updateSelectedTotal();

    		  // 체크박스 상태가 변경될 때마다 updateSelectedTotal 함수 호출
    		  $(".product-checkbox").change(updateSelectedTotal);
    		});
	  </script>
	  <script>
	        document.addEventListener("DOMContentLoaded", function() {
	            document.getElementById("buy_btn").addEventListener("click", function(event) {
	                event.preventDefault();
	
	                // 선택된 상품의 정보를 담을 배열
	                var selectedProducts = [];
	
	                // 체크박스 선택된 항목을 찾기
	                var checkboxes = document.querySelectorAll(".product-checkbox:checked");
	                checkboxes.forEach(function(checkbox) {
	                    var productInfo = {
	                        sellno: checkbox.getAttribute("data-sellno"),
	                        optionno: checkbox.getAttribute("data-optionno"),
	                        thumbnail_real: checkbox.getAttribute("data-thumbnail"),
	                        title: checkbox.getAttribute("data-title"),
	                        price: checkbox.getAttribute("data-price"),
	                        content: checkbox.getAttribute("data-content")
	                    };
	                    selectedProducts.push(productInfo);
	                });
	
	                if (selectedProducts.length === 0) {
	                    alert("구매할 상품을 선택해주세요.");
	                    return;
	                }
	
	             	// hidden input에 JSON 데이터 삽입
	                var input = document.createElement('input');
	                input.type = 'hidden';
	                input.name = 'selectedProducts';
	                input.value = JSON.stringify(selectedProducts);
	                document.getElementById('buyForm').appendChild(input);

	                // 폼 제출
	                document.getElementById('buyForm').submit();
	            });
	        });
	    </script>
  </body>
</html>