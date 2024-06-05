function updatePrices(productPrice, couponDiscount) {
    const productPriceElement = document.getElementById('product_price');
    const couponDiscountElement = document.getElementById('coupon_discount');
    const totalPriceElement = document.getElementById('total_price');

    // 가격 설정
    productPriceElement.textContent = `${productPrice}원`;
    couponDiscountElement.textContent = `${couponDiscount}원`;

    // 총 결제금액 계산
    const totalPrice = productPrice - couponDiscount;
    totalPriceElement.textContent = `${totalPrice}원`;
}

// 예제 가격 업데이트
updatePrices(10000, 2000);

function requestPayment() {
    // 결제 로직 구현
    alert('결제를 진행합니다.');
}