/**
 * 
 */
function getBasicInfo() {
    // 해당 변수를 input 필드에 설정
    $('#memberName').val(loginName);
    $('#memberHp').val(loginHp);
    $('#memberEmail').val(loginEmail);
    $('#memberAddr1').val(loginAddr1);
    $('#memberAddr2').val(loginAddr2);
}
// 마우스 오버 이벤트
$(document).ready(function() {
    // 모든 버튼 요소를 선택하고 마우스오버 이벤트 추가
    $('button').hover(
        function() {
            // 마우스오버 시 수행할 작업 작성
            console.log('Mouse over on button:', this);
            $(this).css('background-color', '#f9dbff'); // 예: 배경색 변경
        }, 
        function() {
            // 마우스가 버튼에서 벗어날 때 수행할 작업
            $(this).css('background-color', 'white'); // 원래 배경색 복원
        }
    );
});

//주소 재설정
function zipcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            $('#zipcode').val(data.zonecode);
            $('#memberAddr1').val(roadAddr);
        }
    }).open();
}

// <!-- 쿠폰 정보 불러오기-->
$(document).ready(function() {
	$.ajax({
		url: '/couponListToMember',
		method: 'GET',
		success: function(data) {
			console.log('쿠폰 불러오기 성공', data);
			//쿠폰 select에 넣어주기
			const couponSelect = $('#coupon_select');
            data.forEach(function(cvo) {
                const option = new Option(cvo.name, cvo.no);
                $(option).data('discount', cvo.discount);
                $(option).data('type', cvo.type);
                couponSelect.append(option);
            });
		},
		error: function(jqXHR, textStatus, errorThrown) {
            console.error('쿠폰 불러오기 실패', textStatus, errorThrown);
        }
	});
});

//쿠폰 적용시키기
function confirmCoupon() {
	 // select 요소와 input 요소를 가져옴
    const couponSelect = document.getElementById('coupon_select');
    const appliedCouponInput = document.getElementById('applied_coupon');
    const selectedOption = couponSelect.selectedOptions[0];
    
    // 선택된 옵션의 텍스트를 가져옴
    const selectedCoupon = selectedOption.text;
    const couponType = $(selectedOption).data('type');
    const couponDiscount = $(selectedOption).data('discount');
    couponSelectedNo = selectedOption.value;
    
    // input 필드에 선택된 쿠폰을 설정
    appliedCouponInput.value = selectedCoupon;
    
    const productPrice = parseFloat(document.getElementById('product_price').textContent.replace('원', '').trim());
    const couponDis = document.getElementById('coupon_discount');
    const total = document.getElementById('total_price');
    let discountPrice;

    if (couponType === 2) {
        discountPrice = productPrice * (parseFloat(couponDiscount) / 100);
    } else {
        discountPrice = parseFloat(couponDiscount);
    }
	console.log(discountPrice);
	discountPrice = Math.floor(discountPrice);
	console.log(discountPrice);
    couponDis.textContent = discountPrice + '원';
    total.textContent = (productPrice - discountPrice) + '원';
    
    // 총 결제 금액을 data 객체에 업데이트
    // 현재는 결제금액을 100원으로 고정시키기 위해 업데이트 하지 않음
    //data.totalAmount = totalPrice;
}

function createOrderName() {
	if (productTitles.length === 0) return '';

	let orderName = productTitles[0];
	if (productTitles.length > 1) {
		orderName += ' 외 ' + (productTitles.length - 1) + '개';
	}
	return orderName;
}

// 12자리 랜덤 문자열 생성 함수
function generateRandomString(length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

//결제 전용
const data = {
	// Store ID 설정
	storeId: "store-eabaed12-5a6a-426a-9e92-39cbba427130",
	// 채널 키 설정
	channelKey: "channel-key-187b545b-54be-45df-bd07-bf6714a325f7",
	paymentId: "",
	orderName: "",
	totalAmount: 100,
	currency: "CURRENCY_KRW",
	payMethod: "CARD", 
	customer: {
		fullName: "",
		phoneNumber: "",
		email: "",
	}
};

var pI = generateRandomString(12);
let couponSelectedNo = 0;

async function requestPayment() {
	// 입력 필드의 값을 data 객체에 설정
	
    
    data.customer.fullName = $('#memberName').val();
    data.customer.phoneNumber = $('#memberHp').val();
    data.customer.email = $('#memberEmail').val();
    data.paymentId = pI;
    
    var oN = createOrderName();
    data.orderName = oN;
    
    //결제완료시에 보낼 값 정하기
    const transformedProducts = products.map(product => {
        return {
            memberno: loginNo,
            optionno: product.optionno,
            price: product.price,
            paymentId: pI,
            buydate: "",
            decidedate: 0,
            sellno: product.sellno,
            hp: $('#memberHp').val(),
            email: $('#memberEmail').val(),
            addr1: $('#memberAddr1').val(),
            addr2: $('#memberAddr2').val(),
            couponNo: couponSelectedNo,
            orderName: product.title
        };
    });
    
	console.log(data);
	console.log('under');
    console.log(transformedProducts);
	const response = await PortOne.requestPayment(data);
	console.log(response);

    
	
	if (!response.hasOwnProperty('code')) {
		$.ajax({
            url: '/payment/paySuccess',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(transformedProducts),
            success: function(response) {
                
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('요청 실패:', textStatus, errorThrown);
            }
        });
	} else {
		console.log(response.code);
	}
	
}