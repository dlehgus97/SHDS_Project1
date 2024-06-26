<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매글 관리</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <base href="${pageContext.request.contextPath}/">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .wrap {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

		.header-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
            color: #555;
        }

        .header-container h1 {
            flex: 1;
            text-align: center;
            margin: 0;
            margin-left: 60px; /* h1 요소를 오른쪽으로 이동 */
        }

        .header-container button {
            margin-left: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 15px;
        }

        .header-container button:hover {
            background-color: #0056b3;
        }

        .header, .footer {
            flex-shrink: 0;
        }

        .content {
            display: flex;
            flex-grow: 1;
        }

        .sidebar {
            width: 200px;
            min-width: 200px;
            background-color: #404040;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            min-height: 500px;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        .main-content {
            margin-left: 150px;
			margin-right: 150px;
            padding: 20px;
            flex-grow: 1;
        }
        
		h1 {
            text-align: center;
            margin: 20px 0;
            color: #555;
        }

        .store-name {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

		.product-grid {
		    display: grid;
		    /* grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); /* 각 카드의 최소 너비를 260px, 최대 너비를 1fr로 설정 */
		    grid-template-columns: repeat(auto-fill, 260px); /* 각 카드의 가로 길이를 260px로 고정 */
		    gap: 20px;
		    justify-items: start;
		}

		.product-card {
		    width: 260px; /* 카드의 가로 길이를 260px로 고정 */
    		height: 520px; /* 카드의 세로 길이를 520px로 고정 */
		    background-color: white;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		    overflow: hidden;
		    display: flex;
		    flex-direction: column;
		}

		.product-card img {
		    width: 100%;
		    height: 200px;
		    object-fit: cover;
		    border-top-left-radius: 8px;
		    border-top-right-radius: 8px;
		}
        
		.title-container {
		    padding: 10px;
		    font-size: 20px;
		    font-weight: bold;
		    color: #333;
		    /*text-align: center;*/
		    margin-top: 10px;
		}
        
        /*
		.product-picture {
            width: 600px;
            height: 600px;
            border-radius: 10px;
            margin-right: 20px;
            object-fit: cover;
        }
		*/
		
		.product-details {
		    padding: 20px;
		    flex-grow: 1;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		}

        .product-details h3 {
            font-size: 25px;
            margin: 10px 0;
            color: #333;
        }
/*
        .product-details p {
            font-size: 16px;
            margin: 5px 0;
            color: #666;
        }
*/     
        .product-details .price {
        	font-size: 30px;
        	font-weight: bold;
        }
        
		.button-container {
			width: 260px;
			height: 60px;
			display: flex;
		    justify-content: space-between; /* 버튼을 컨테이너 내에서 좌우로 정렬 */
		    align-items: center; /* 버튼을 세로 중앙 정렬 */
		}

		.btn-edit, .btn-delete {
		    display: inline-block;
		    width: 110px;
		    height: 36px;
		    /*padding: 8px 20px;*/
		    margin: 12px;
		    border-radius: 12px; /* 모서리 둥글게 */
		    font-size: 16px;
		    text-align: center;
		    text-decoration: none;
		    transition: background-color 0.3s;
		    line-height: 36px; /* 텍스트를 세로 중앙 정렬 */
    		vertical-align: middle; /* 인라인 요소의 세로 정렬 방식 설정 */
		}
		
		.btn-edit {
		    background-color: #007bff; /* 파란색 */
		    color: white !important;
		}
		
		.btn-delete {
		    background-color: #dc3545; /* 빨간색 */
		    color: white !important;
		}
		
		.btn-edit:hover, .btn-delete:hover {
		    background-color: #0056b3; /* 파란색 (더 진한) */
		}
		
		.btn-delete:hover {
		    background-color: #c82333; /* 빨간색 (더 진한) */
		}
		
		.mini-header {
		    background-color: #4CAF50; /* 배경색 변경 */
		    color: white; /* 텍스트 색상 변경 */
		    padding: 15px 20px; /* 내부 여백 수정 */
		    border-radius: 8px; /* 테두리 둥글게 만들기 */
		    margin-bottom: 30px; /* 하단 마진 추가 */
		    text-align: center;
		    font-weight: bold;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
		}
		
		.mini-header span {
		    margin-right: 100px; /* 각 항목 사이 여백 설정 */
		}
		
		.star-rating {
            display: inline-block;
            font-size: 24px; /* 별 사이의 공백을 제거하기 위해 0으로 설정 */
            position: relative;
        }

        .star-rating .back-stars {
            color: #d3d3d3; /* 회색 */
            position: relative;
            z-index: 1;
        }

        .star-rating .front-stars {
            color: #f8ce0b; /* 금색 */
            position: absolute;
            z-index: 2;
            top: 0;
            left: 0;
            overflow: hidden;
            width: 0;
		}
		
		.star-container{
			display: flex;
		}
		
		.star-container p {
			font-size: 20px;
			
		}	
		
		.product-picture {
		    cursor: pointer;
		}
    </style>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        
        <div class="content">
            <div class="sidebar">
                <a href="seller/sellerWeeklyMetrics">판매자 주간 지표</a>
                <a href="seller/sellerBuyList">거래 관리</a>
                <a href="seller/selllistManagement">판매글 관리</a>
                <a href="seller/sellerReviews">리뷰 관리</a>
                <a href="seller/sellerEdit">셀러 정보 수정</a>
            </div>
            
            <div class="main-content">
				<div class="mini-header">
                    <span>신규 주문: ${miniHeaderData.today_orders_count}</span>
					<span>취소 주문: ${miniHeaderData.today_refund_count}</span>
					<span>신규 채팅: ${miniHeaderData.new_chat}</span>
					<span>정산 신청 가능: ${miniHeaderData.settlement_eligible}</span>
                </div>
                <div class="header-container">
			        <h1>판매글 관리</h1>
			        <button onclick="location.href='http://13.125.219.9:8090/selllistRegister'">+</button>
			    </div>
                <div class="product-grid">
                    <c:forEach var="sellproduct" items="${sellList}">
                        <div class="product-card">
                            <img class="product-picture" src="/upload/thumbnail/${sellproduct.thumbnail_real}" alt="상품 사진" onclick="location.href='http://13.125.219.9:8090/selllist/view.do?sellno=${sellproduct.sellno}'">
                           	<div class="title-container">${sellproduct.title}</div>

                            <div class="product-details">
                            	<h4>찜하기: ${sellproduct.like_count}건 &nbsp;&nbsp;&nbsp; 조회수: ${sellproduct.view_cnt}회</h4>
								<div class="star-container">
									<div class="star-rating">
							            <span class="back-stars">
											&#9733;&#9733;&#9733;&#9733;&#9733; <!-- 빈 별 -->
							            </span>
							            <span class="front-stars" style="width: calc(${sellproduct.rating_avg} / 5 * 100%);">
							                &#9733;&#9733;&#9733;&#9733;&#9733; <!-- 채워진 별 -->
							            </span>
							        </div>
                                	<p><fmt:formatNumber value="${sellproduct.rating_avg}" type="number" maxFractionDigits="1" minFractionDigits="1" /> (${sellproduct.review_cnt})</p>
                 				</div>
                                <p class=price">${sellproduct.price}원 ~</p>
                            </div>
							<div class="button-container">
								<a href="" class="btn-edit">수정하기</a>
								<button class="btn-delete" onclick="confirmDelete(${sellproduct.sellno})">삭제하기</button>
							</div>                           
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>

	<script>
	    $(document).ready(function() {
	        $('p.price').each(function() {
	            var price = $(this).text();
	            var formattedPrice = formatPrice(price);
	            $(this).text(formattedPrice + '원');
	        });
	    }); // document.ready의 닫는 괄호 추가
	
	    function formatPrice(price) {
	        return parseInt(price).toLocaleString('ko-KR');
	    } // formatPrice 함수의 닫는 괄호 추가
	
	    function confirmDelete(sellno) {
	        if (confirm("정말 삭제하시겠습니까?")) {
	            // 확인 버튼을 눌렀을 때, 삭제 요청을 서버로 보내는 AJAX 요청
	            $.ajax({
	                url: '/seller/deleteSellList', // 삭제 처리를 담당하는 컨트롤러 매핑 URL
	                type: 'POST',
	                data: { sellno: sellno }, // 삭제할 판매글 번호를 전송
	                success: function(response) {
	                    if (response === "success") {
	                        // 성공적으로 삭제되었을 경우, 화면에서 해당 판매글 제거
	                        alert("삭제되었습니다.");
	                        location.reload(); // 페이지 새로고침
	                    } else {
	                        alert("삭제 실패했습니다.");
	                    }
	                },
	                error: function() {
	                    alert("삭제 과정에서 오류가 발생했습니다.");
	                }
	            });
	        } else {
	            // 취소 버튼을 눌렀을 때 아무 동작 없음
	            return false;
	        }
	    } // confirmDelete 함수의 닫는 괄호 추가
	
	    function setRating(rating) {
	        const starWidth = (rating / 5) * 100;
	        document.querySelector('.front-stars').style.width = `${starWidth}%`;
	    }
	</script>

</body>
</html>