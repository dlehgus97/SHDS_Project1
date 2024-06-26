<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 관리 | NEXt Us</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <base href="${pageContext.request.contextPath}/">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            color: #333;
        }

        .profile-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            max-width: 800px;
            margin: 50px auto;
        }

        .profile-picture {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }

        .store-info {
            flex: 1;
            margin-left: 20px;
        }

        .store-name {
            font-size: 26px;
            font-weight: bold;
            color: #333;
        }

        .rating-container {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .average-rating, .count-rating {
            font-size: 18px;
            margin-right: 10px;
        }

        .profile {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
        }

        .profile p {
            margin: 10px 0;
        }

        .profile strong {
            font-size: 18px;
        }
        
        /* 정산신청 버튼 */
        .enabled-button {
            background-color: #4CAF50; /* 녹색 */
            border: none;
            color: white;
            padding: 7px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .enabled-button:hover {
            background-color: #45a049;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #555;
        }

        table {
            width: 80%;
            margin: 0 auto 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f4f4f4;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .profile-picture-small {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }

        .stars-outer {
            display: inline-block;
            position: relative;
            font-family: FontAwesome;
        }

        .stars-outer::before {
            content: "\f005 \f005 \f005 \f005 \f005";
            font-family: FontAwesome;
            color: #ccc;
            display: block;
        }

        .stars-inner {
            position: absolute;
            top: 0;
            left: 0;
            white-space: nowrap;
            overflow: hidden;
            width: 0;
            color: #f8ce0b;
        }

        .stars-inner::before {
            content: "\f005 \f005 \f005 \f005 \f005";
            font-family: FontAwesome;
            display: block;
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

        .content {
            display: flex;
            flex-grow: 1;
        }

        .main-content {
			margin-left: 150px;
			margin-right: 150px;
            padding: 20px;
            flex-grow: 1;
        }

        /* 리뷰 내용이 길 경우 ... 처리 */
        .text-truncate {
            display: block;
            width: 200px; /* 원하는 너비로 설정 */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: left; /* 텍스트의 시작점을 동일하게 설정 */
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
		
		/* 신고 팝업 창 스타일 */
		#reportPopup {
		    display: none; /* 기본적으로 숨김 */
		    position: fixed;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    width: 400px;
		    max-width: 90%;
		    background-color: #fff;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    border-radius: 10px;
		    z-index: 1000;
		    padding: 20px;
		    box-sizing: border-box;
		}
		
		#reportPopup h2 {
		    margin-top: 0;
		    color: #333;
		    font-size: 24px;
		    text-align: center;
		}
		
		#reportPopup textarea {
		    width: 100%;
		    height: 100px;
		    margin: 10px 0;
		    padding: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 16px;
		    box-sizing: border-box;
		    resize: none;
		}
		
		#reportPopup .button-container {
		    display: flex;
		    justify-content: space-between;
		    margin-top: 20px;
		}
		
		#reportPopup button {
		    width: 48%;
		    height: 40px;
		    border: none;
		    border-radius: 20px;
		    font-size: 16px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		    color: white;
		    background-color: #6c757d; /* 기본 배경색을 중간 회색으로 설정 */
		}
		
		#reportPopup button[type="button"]:nth-child(1) {
		    background-color: #343a40; /* 어두운 회색 */
		}
		
		#reportPopup button[type="button"]:nth-child(2) {
		    background-color: #6c757d; /* 중간 회색 */
		}
		
		#reportPopup button[type="button"]:nth-child(1):hover {
		    background-color: #495057; /* 어두운 회색 (hover) */
		}
		
		#reportPopup button[type="button"]:nth-child(2):hover {
		    background-color: #adb5bd; /* 밝은 회색 (hover) */
		}
		
		/* 알림 팝업 창 스타일 */
		#alertPopup {
		    display: none; /* 기본적으로 숨김 */
		    position: fixed;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    width: 300px;
		    max-width: 90%;
		    background-color: #fff;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    border-radius: 10px;
		    z-index: 1001;
		    padding: 20px;
		    text-align: center;
		    box-sizing: border-box;
		}
		
		#alertPopup p {
		    margin: 0 0 20px;
		    font-size: 16px;
		    color: #333;
		}
		
		#alertPopup button {
		    width: 80px;
		    height: 36px;
		    border: none;
		    border-radius: 18px;
		    font-size: 16px;
		    cursor: pointer;
		    background-color: #6c757d;
		    color: white;
		    transition: background-color 0.3s ease;
		}
		
		#alertPopup button:hover {
		    background-color: #adb5bd; /* 밝은 회색 (hover) */
		}
    </style>
    <script>
        $(document).ready(function() {
            $('.stars-inner').each(function() {
                var rating = $(this).data('rating');
                var starPercentage = (rating / 5) * 100;
                $(this).css('width', starPercentage + '%');
            });
        });
    </script>
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
                <h1>리뷰 목록</h1>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>상품명</th>
                            <th>평점</th>
                            <th>닉네임</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="review" items="${sellerReviews}">
                            <tr>
                                <td><img src="/profile-images/${review.thumbnail_real}" class="profile-picture-small"></td>
                                <td>${review.productTitle}</td>
                                <td>
                                    <div class="stars-outer">
                                        <div class="stars-inner" data-rating="${review.score}"></div>
                                    </div>
                                </td>
                                <td>${review.nickname}</td>
                                <td>${review.title}</td>
                                <td><span class="text-truncate">${review.text}</td>
                                <td><button class="enabled-button" onclick="openReportPopup(${review.sellno}, ${review.reviewno}, ${review.seller})">신고</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
    
    <!-- 신고 팝업 창 HTML -->
	<div id="reportPopup" style="display:none;">
	    <form id="reportForm">
	        <h2>신고 사유</h2>
	        <textarea id="reportContent" name="content" placeholder="신고 사유를 입력하세요" required></textarea>
	        <input type="hidden" id="reportSellno" name="sellno">
	        <input type="hidden" id="reportReviewno" name="reviewno">
	        <input type="hidden" id="reportMemberno" name="memberno">
	        <input type="hidden" id="reportStatus" name="status" value="1">
			<div class="button-container">
	            <button type="button" onclick="submitReport()">확인</button>
	            <button type="button" onclick="closeReportPopup()">취소</button>
	        </div>
	    </form>
	</div>
	
	<!-- 알림 팝업 창 HTML -->
	<div id="alertPopup" style="display:none;">
	    <p id="alertMessage">내용을 입력해주세요.</p>
	    <button onclick="closeAlertPopup()">확인</button>
	</div>
</body>
<script>
	function openReportPopup(sellno, reviewno, memberno) {
	    document.getElementById('reportSellno').value = sellno;
	    document.getElementById('reportReviewno').value = reviewno;
	    document.getElementById('reportMemberno').value = memberno;
	    document.getElementById('reportPopup').style.display = 'block';
	}
	
	function closeReportPopup() {
	    document.getElementById('reportPopup').style.display = 'none';
	}
	
	function submitReport() {
	    var content = document.getElementById("reportContent").value.trim();
	    if (content === "") {
	        showAlertPopup("내용을 입력해주세요.");
	        return false;
	    }
	
	    const reportForm = document.getElementById('reportForm');
	    const formData = new FormData(reportForm);
	
	    fetch('/seller/reportReview', {
	        method: 'POST',
	        body: formData
	    })
	    .then(response => response.text()) // fetch() 함수의 반환된 promise 객체를 처리, 응답(response)을 텍스트 형식으로 변환하여 반환
	    .then(result => {
	        console.log('Response from server:', result); // result 값을 콘솔에 출력
	        
	        if (result === '"success"') {
	            alert('신고가 접수되었습니다.');
	            closeReportPopup();
	            location.reload();
	        } else {
	            alert('신고 접수에 실패했습니다.');
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error); // 실제 오류 메시지 출력
	        alert('신고 과정에서 오류가 발생했습니다.');
	    });
	}
	
	function showAlertPopup(message) {
	    document.getElementById("alertMessage").innerText = message;
	    document.getElementById("alertPopup").style.display = "block";
	}
	
	function closeAlertPopup() {
	    document.getElementById("alertPopup").style.display = "none";
	}
</script>
</html>
