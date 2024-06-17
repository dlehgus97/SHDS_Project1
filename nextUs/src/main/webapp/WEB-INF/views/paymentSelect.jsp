<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/paymentSelect.css">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div id="p_container">
	<div id="payment_container">
		<div id="payment_left_container">
			<div id="product_detail" class="payment_border">
				<h2>주문 상품 정보</h2>
				<!-- 주문 상품 상세 불러오기 필요-->
				<c:forEach var="cartVO" items="${selectedProducts }">
					<div>
					<!-- todo setting img file route -->
						<img src="${cartVO.thumbnail_real }" alt="product_thumbnail">
						<h2 id="product_title">${cartVO.title }</h2>
						<p>${cartVO.price }</p>
					<p>${cartVO.content }</p>
					</div>
				</c:forEach>
			</div>
			<script>
				$(document).ready(function() {
					// 서버에서 상품 정보를 받아와서 페이지에 표시
					$.ajax({
						url: '/payment/paymentSelect',
						method: 'GET',
						success: function(data) {
							displaySelectedProducts(data.selectedProducts);
						},
						error: function(jqXHR, textStatus, errorThrown) {
							console.error('상품 정보를 불러오는데 실패했습니다.', textStatus, errorThrown);
						}
					});
		
					function displaySelectedProducts(products) {
						var orderProductsDiv = document.getElementById("order_products");
						orderProductsDiv.innerHTML = ""; // 기존 내용 제거
		
						products.forEach(function(product) {
							var productDiv = document.createElement("div");
							productDiv.classList.add("product_detail_item");
		
							var img = document.createElement("img");
							img.src = product.thumbnail;
							img.alt = product.title;
		
							var title = document.createElement("h2");
							title.textContent = product.title;
		
							var price = document.createElement("p");
							price.textContent = product.price + "원";
		
							var content = document.createElement("p");
							content.textContent = product.content;
		
							productDiv.appendChild(img);
							productDiv.appendChild(title);
							productDiv.appendChild(price);
							productDiv.appendChild(content);
		
							orderProductsDiv.appendChild(productDiv);
						});
					}
				});
			</script>
			<div id="costomer_info_container" class="payment_border">
				<h2>주문자 정보</h2>
				<!-- 주문자 정보 불러오기 필요-->
				<div id="info_detail">
					<p style="font-weight: bold;">주문자 성함</p>
					<input type="text" id="memberName" class="info_size" readonly><br>
					<p style="font-weight: bold;">휴대폰 번호</p>
					<input type="text" id="memberHp"  class="info_size" size="80%" readonly><br>
					<p style="font-weight: bold;">이메일</p>
					<input type="text" id="memberEmail"  class="info_size" size="80%" readonly><br>
					<p style="font-weight: bold;">주소</p>
					<input type="text" id="memberAddr1"  class="info_size" size="80%" readonly><br>
					<p style="font-weight: bold;">상세주소</p>
					<input type="text" id="memberAddr2"  class="info_size" size="80%" readonly><br>
					<button onclick="getBasicInfo()">기본 정보 불러오기</button>
					<!-- script for get memberInfo -->
					<script>
                        function getBasicInfo() {
                            // 서버에서 전달받은 값을 JavaScript 변수로 설정
                            var loginName = '${login.name}';
                            var loginHp = '${login.hp}';
                            var loginEmail = '${login.email}';
                            var loginAddr1 = '${login.addr1}';
                            var loginAddr2 = '${login.addr2}';
                            
                            // 해당 변수를 input 필드에 설정
                            $('#memberName').val(loginName);
                            $('#memberHp').val(loginHp);
                            $('#memberEmail').val(loginEmail);
                            $('#memberAddr1').val(loginAddr1);
                            $('#memberAddr2').val(loginAddr2);
                        }
                    </script>
				</div>
			</div>
			<div id="coupon_container" class="payment_border">
				<h2>쿠폰</h2>
				<div id="coupon_detail">
					<p style="font-weight: bold;">쿠폰</p>
					<select id="coupon_select">
					</select>
					<!-- 쿠폰 정보 불러오기-->
					<script>
						$(document).ready(function() {
							$.ajax({
								url: '/couponListToMember',
								method: 'GET',
								success: function(data) {
									console.log('쿠폰 불러오기 성공', data);
									//쿠폰 select에 넣어주기
									const couponSelect = $('#coupon_select');
                                    data.forEach(function(cvo) {
                                        const option = new Option(cvo.name, cvo.no, cvo.discount, cvo.type);
                                        couponSelect.append(option);
                                    });
								},
								error: function(jqXHR, textStatus, errorThrown) {
					                console.error('쿠폰 불러오기 실패', textStatus, errorThrown);
					            }
							});
						});
					</script>
					<button id="coupon_confirm_button" onclick="confirmCoupon()">적용</button>
					<script>
						function confirmCoupon() {
							 // select 요소와 input 요소를 가져옴
						    const couponSelect = document.getElementById('coupon_select');
						    const appliedCouponInput = document.getElementById('applied_coupon');
						    
						    // 선택된 옵션의 텍스트를 가져옴
						    const selectedCoupon = couponSelect.selectedOptions[0].text;
						    
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