<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/paymentSelect.css">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div id="p_container">
	<div id="payment_container">
		<div id="payment_left_container">
			<div id="product_detail" class="payment_border">
				<h2>주문 상품 정보</h2>
				<!-- 주문 상품 상세 불러오기 필요-->
				<img src="" alt="product_thumbnail">
				<div>
					<h2 id="product_title">하루 안에 로고 제작</h2>
					<p>200,000원</p>
					<p>시안 2개 / 수정무제한 / 명함200매(무료이벤트) + 로고전용폰트 + 응용이미지 + 원본파일(로고)</p>
				</div>
			</div>
			<div id="costomer_info_container" class="payment_border">
				<h2>주문자 정보</h2>
				<!-- 주문자 정보 불러오기 필요-->
				<div id="info_detail">
					<p style="font-weight: bold;">주문자 성함</p>
					<input type="text" class="info_size" readonly><br>
					<p style="font-weight: bold;">휴대폰 번호</p>
					<input type="text" class="info_size" size="80%" readonly><br>
					<p style="font-weight: bold;">이메일</p>
					<input type="text" class="info_size" size="80%" readonly><br>
					<p style="font-weight: bold;">주소</p>
					<input type="text" class="info_size" size="80%" readonly>
				</div>
			</div>
			<div id="coupon_container" class="payment_border">
				<h2>쿠폰</h2>
				<!-- 쿠폰 정보 불러오기 필요-->
				<div id="coupon_detail">
					<p style="font-weight: bold;">쿠폰</p>
					<select id="coupon_select">
						<option>-----선택------</option>
						<option>가입 축하 쿠폰 ! (5%)</option>
					</select>
					<button id="coupon_confirm_button" onclick="confirmCoupon()">적용</button>
					<script>
						function confirmCoupon() {
							// select 요소와 input 요소를 가져옴
							const couponSelect = document.getElementById('coupon_select');
							const appliedCouponInput = document.getElementById('applied_coupon');
							
							// 선택된 옵션의 텍스트를 가져옴
							const selectedCoupon = couponSelect.value;
							
							// input 필드에 선택된 쿠폰을 설정
							appliedCouponInput.value = selectedCoupon;
						}
					</script>
					<p style="font-weight: bold;">적용된 쿠폰</p>
					<input type="text" id="applied_coupon" class="info_size" size="80%" readonly><br>
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
			
			<script>
				const data = {
					// Store ID 설정
					storeId: "store-eabaed12-5a6a-426a-9e92-39cbba427130",
					// 채널 키 설정
					channelKey: "channel-key-187b545b-54be-45df-bd07-bf6714a325f7",
					//paymentId: `payment-${crypto.randomUUID()}`,
					paymentId: `testlx19b6i7`,
					orderName: "나이키 와플 트레이너 2 SD",
					totalAmount: 1000,
					currency: "CURRENCY_KRW",
					payMethod: "CARD", 
					customer: {
						fullName: "양재혁",
						phoneNumber: "010-5128-9120",
						email: "yjh5128@gmail.com",
					}
				}

				async function requestPayment() {
				console.log(data);
				const response = await PortOne.requestPayment(data);
				console.log(response);
				
				}
			</script>
		</div>
		<div id="right">
		
		</div>
	</div>
</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>