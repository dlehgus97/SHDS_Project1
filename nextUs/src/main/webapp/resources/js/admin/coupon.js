function updatePlaceholder() {
    var fixedRadio = document.querySelector('input[name="type"][class="fc"]');
    var discountInput = document.querySelector('input[name="discount"]');
    var currencySpan = document.querySelector('.input-group-text.TYPE');

    if (fixedRadio.checked) {
        discountInput.placeholder = ' 할인 금액(원)을 입력해주세요';
        currencySpan.textContent = '₩'; // 변경할 텍스트 설정
    } else {
        discountInput.placeholder = ' 할인 비율(%)을 입력해주세요';
        currencySpan.textContent = '%'; // 변경할 텍스트 설정
    }
}

document.addEventListener('DOMContentLoaded', function () {
    var radioButtons = document.querySelectorAll('input[name="type"]');
    radioButtons.forEach(function (radio) {
        radio.addEventListener('change', updatePlaceholder);
    });

    // Initialize placeholder on page load
    updatePlaceholder();
});

    

    function handleClick(divClass) {
            const div1 = document.querySelector('.c1');
            const div2 = document.querySelector('.c2');

            if (divClass === 'c1') {
                // 페이지 이동 (예: 쿠폰 발급 내역 페이지)
                window.location.href = '/couponManagement'; // 실제 페이지 경로로 변경
            } else if (divClass === 'c2') {
                // 페이지 이동 (예: 쿠폰 지급 페이지)
                window.location.href = '/giveCoupon'; // 실제 페이지 경로로 변경
            }
        }
       