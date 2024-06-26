<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기 | NEXt Us</title>
<link rel="stylesheet" type="text/css" href="/resources/css/paymentSelect.css">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/payment/payment.js"></script>
<script>
	//서버에서 전달받은 값을 JavaScript 변수로 설정 개인정보 입력용
	var loginNo = '${login.no}';
	var loginName = '${login.name}';
	var loginHp = '${login.hp}';
	var loginEmail = '${login.email}';
	var loginzipcode = '${login.zipcode}';
	var loginAddr1 = '${login.addr1}';
	var loginAddr2 = '${login.addr2}';
	var sumPrice = 0;
	var productTitles = [];
	var products = [];
	
	// 가격합산
	function calculateTotalPrice() {
	    var prices = document.querySelectorAll('.product_right_container .price');
	    var total = 0;
	    prices.forEach(function(priceElement) {
	        var price = parseFloat(priceElement.textContent.replace('원', '').trim());
	        total += price;
	    });
	    updatePrices(total, 0);
	}
	
	//콤마찍기
	function formatNumberWithCommas(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function updatePrices(pp, cd) {
        const productPrice = pp;  // 실제 상품가격을 여기에 입력
        const couponDiscount = cd; // 실제 쿠폰할인을 여기에 입력
        const totalPrice = productPrice - couponDiscount; // 실제 총 결제금액 계산

        document.getElementById('product_price').innerText = formatNumberWithCommas(productPrice) + '원';
        document.getElementById('coupon_discount').innerText = formatNumberWithCommas(couponDiscount) + '원';
        document.getElementById('total_price').innerText = formatNumberWithCommas(totalPrice) + '원';
    }

	// 페이지 로드 후 가격 합산 함수 호출
	window.onload = function() {
	    calculateTotalPrice();
	    var productName = document.getElementById("firstP").text;
	 	// 각 상품 제목을 배열에 추가
		<c:forEach var="cartVO" items="${selectedProducts}">
			productTitles.push('${cartVO.title}');
			products.push({
				sellerno: "${cartVO.sellerno}",
                sellno: "${cartVO.sellno}",
                optionno: "${cartVO.optionno}",
                thumbnail_real: "${cartVO.thumbnail_real}",
                title: "${cartVO.title}",
                price: "${cartVO.price}",
                content: "${cartVO.content}"
            });
		</c:forEach>
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div id="p_container">
	<h3 class="text_center">[Payment]</h3>
	<div id="payment_container">
		<div id="payment_left_container">
			<div id="product_detail" class="payment_border">
				<h2>주문 상품 정보</h2>
				<hr style="margin: 10px 0;">
				<!-- 주문 상품 상세 불러오기 필요-->
				<c:forEach var="cartVO" items="${selectedProducts }">
					<div class="products">
					<!-- todo setting img file route -->
						<div class="thumbnail_container">
							<a href="/selllist/view.do?no=${cartVO.sellno}">
								<img src="/upload/board/${cartVO.thumbnail_real }" alt="product_thumbnail" class="thumbnail">
							</a>
						</div>
						<div class="product_center_container">
							<a href="../selllist/view.do?no=${cartVO.sellno }" style="text-decoration: none !important;">
								<span id="firstP" class="product_title">${cartVO.title }</span>
							</a>
							<p class="content">${cartVO.content }</p>
						</div>
						<div class="product_right_container">
							<p class="price">${cartVO.price }원</p>
						</div>
					</div>
					<hr style="margin: 10px 0;">
				</c:forEach>
			</div>
			<div id="costomer_info_container" class="payment_border">
				<h2>주문자 정보</h2>
				<!-- 주문자 정보 불러오기 필요-->
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<div id="info_detail">
					<p style="font-weight: bold;">주문자 성함</p>
					<input type="text" id="memberName" class="info_size"><br>
					<p style="font-weight: bold;">휴대폰 번호 (- 제외 입력)</p>
					<input type="text" id="memberHp"  class="info_size" size="80%"><br>
					<p style="font-weight: bold;">이메일</p>
					<input type="text" id="memberEmail"  class="info_size" size="80%"><br>
					<p style="font-weight: bold;">주소</p>
					<input type="text" id="zipcode" readonly>
					<input type="text" id="memberAddr1" readonly><br>
					<p style="font-weight: bold;">상세주소</p>
					<input type="text" id="memberAddr2"  class="info_size" size="80%"><br>
					<button id="set_addr" onclick="zipcode()">주소 재설정</button>
					<button id="call_userInfo" onclick="getBasicInfo()">기본 정보 불러오기</button>
					<b style="color: red;">결제 전 주소를 한번 더 확인해주세요.</b>
				</div>
			</div>
			<div id="coupon_container" class="payment_border">
				<h2>쿠폰</h2>
				<div id="coupon_detail">
					<p style="font-weight: bold;">쿠폰</p>
					<select id="coupon_select">
					</select>
					
					<button id="coupon_confirm_button" onclick="confirmCoupon()">적용</button>
					<button id="coupon_undo_button" onclick="undoCoupon()">취소</button>
					
					<p style="font-weight: bold;">적용된 쿠폰</p>
					<input type="text" id="applied_coupon" class="info_size" size="80%" readonly><br>
					<b style="color: red;">쿠폰 사용 후 환불 시 쿠폰은 환불되지 않습니다.</b><br>
				</div>
			</div>
		</div>
		<div id="payment_right_container">
			<div id="cost_info_container" class="payment_border">
				<h2>최종 결제 금액</h2>
				<!-- 주문자 정보 불러오기 필요-->
				<div id="cost_detail">
					<p style="font-weight: bold;">상품가격: <span class="price" id="product_price">0원</span></p>
					<p style="font-weight: bold;">쿠폰할인: <span class="price" id="coupon_discount">0원</span></p>
					<hr style="margin: 10px 0;">
					<p style="font-weight: bold;">총 결제금액: <span class="price" id="total_price">0원</span></p><br>
				</div>
				<button id="payment_button" onclick="requestPayment()">결제하기</button>
			</div>
		</div>
	</div>
</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>