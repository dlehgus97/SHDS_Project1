<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>거래 관리</title>
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
			margin-left: 100px;
			margin-right: 100px;
            padding: 20px;
            flex-grow: 1;
        }
        
        .status-1 {
            font-weight: bold;
            color: black;
        }

        .status-2 {
            font-weight: bold;
            color: red;
        }

        .status-3 {
            font-weight: bold;
            color: blue;
        }

        .status-4 {
            font-weight: bold;
            color: green;
        }
        
		.status-5 {
            font-weight: bold;
            color: gray;
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
        
        /* 정산신청 불가 버튼 */
        .disabled-button {
            background-color: #A8A8A8; /* 회색 */
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
        
        .disabled-button:hover {
            background-color: #969696;
        }
        
		.mini-header {
		    background-color: #4CAF50; /* 배경색 변경 */
		    color: white; /* 텍스트 색상 변경 */
		    padding: 15px 20px; /* 내부 여백 수정 */
		    border-radius: 8px; /* 테두리 둥글게 만들기 */
		    margin-bottom: 30px; /* 하단 마진 추가 */
		    margin-right: 50px;
		    margin-left: 50px;
		    text-align: center;
		    font-weight: bold;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
		}
		
		.mini-header span {
		    margin-right: 100px; /* 각 항목 사이 여백 설정 */
		}
    </style>
    <script>
        $(document).ready(function() {
            $('.stars-inner').each(function() {
                var rating = $(this).data('rating');
                var starPercentage = (rating / 5) * 100;
                $(this).css('width', starPercentage + '%');
            });
            
            $('td.price').each(function() {
                var price = $(this).text();
                var formattedPrice = formatPrice(price);
                $(this).text(formattedPrice + '원');
            });
            
            $('.buydate').each(function() {
                var dateString = $(this).text();
                var formattedDate = dateString.substring(0, 16); // 2024-06-14 05:54
                $(this).text(formattedDate);
            });
            
            // 구매확정인 상태에서만 정산 신청이 가능
            $('.enabled-button').click(function() {
                var buyno = $(this).data('buyno');
                var status = $(this).data('status');

                $.ajax({
                    url: '${pageContext.request.contextPath}/seller/updateStatus',
                    type: 'POST',
                    data: { buyno: buyno, status: 5 },
                    success: function(response) {
                        alert('정산 신청이 완료되었습니다.');
                        location.reload(); // 페이지 새로고침
                    },
                    error: function(error) {
                        alert('상태 변경 중 오류가 발생했습니다.');
                    }
                });
            });
            
            
            // 정산 신청을 불가능한 상태인 경우 상태에 맞는 경고창 띄움
            $('.disabled-button').click(function() {
                var buyno = $(this).data('buyno');
                var status = $(this).data('status');

                var message;
                switch (status) {
                    case 1:
                        message = "구매확정이 이루어지지 않은 상태입니다.";
                        break;
                    case 2:
                        message = "구매취소/환불 처리가 진행 중인 주문입니다.";
                        break;
                    case 3:
                        message = "구매가 취소되었거나 환불된 상태입니다.";
                        break;
                    case 5:
                        message = "이미 정산 신청이 완료되었습니다.";
                        break;
                    case 6:
                        message = "정산이 완료된 상태입니다.";
                        break;
                    default:
                        message = "알 수 없는 상태입니다.";
                }
                alert(message);
            });
        });
        
        function formatPrice(price) {
            return parseInt(price).toLocaleString('ko-KR');
        }
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
            	<h1>거래 목록</h1>
		        <table>
		            <thead>
		                <tr>
		                    <th>주문번호</th>
		                    <th>주문시간</th>
		                    <th>구매자</th>
		                    <th>상품명</th>
		                    <th>옵션등급</th>
		                    <th>옵션상세</th>
		                    <th>결제금액</th>
		                    <th>구매확정일자</th>
		                    <th>거래상태</th>
		                    <th>정산신청</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="buyitem" items="${buyList}">
		                    <tr>
		                        <td>${buyitem.buyno}</td>
		                        <td class="buydate">${buyitem.buydate}</td>
		                        <td>${buyitem.nickname}</td>
		                        <td>${buyitem.title}</td>
		                        <td>${buyitem.optionrank}</td>
		                        <td>${buyitem.content}</td>		
		                        <td class="price">${buyitem.price}원</td>
		                        <td>
			                        <c:choose>
									    <c:when test="${empty buyitem.decidedate}">
									        -
									    </c:when>
									    <c:otherwise>
									        <fmt:formatDate value="${buyitem.decidedate}" pattern="yyyy.MM.dd" />
									    </c:otherwise>
									</c:choose>
		                        </td>
		                        <td>
                                    <c:choose>
                                        <c:when test="${buyitem.status == 1}">
                                            <span class="status-1">결제완료</span>
                                        </c:when>
                                        <c:when test="${buyitem.status == 2}">
                                            <span class="status-2">취소/환불 대기</span>
                                        </c:when>
                                        <c:when test="${buyitem.status == 3}">
                                            <span class="status-2">취소/환불 완료</span>
                                        </c:when>
                                        <c:when test="${buyitem.status == 4}">
                                            <span class="status-3">구매확정</span>
                                        </c:when>
                                        <c:when test="${buyitem.status == 5}">
                                            <span class="status-4">정산 심의 중</span>
                                        </c:when>
                                        <c:when test="${buyitem.status == 6}">
                                            <span class="status-5">정산완료</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>알 수 없음</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                             	    <c:choose>
						                <c:when test="${buyitem.status == 4}">
						                    <button class="enabled-button" data-buyno="${buyitem.buyno}" data-status="${buyitem.status}">정산신청</button>
						                </c:when>
						                <c:otherwise>
						                    <button class="disabled-button" data-buyno="${buyitem.buyno}" data-status="${buyitem.status}">신청불가</button>
						                </c:otherwise>
						            </c:choose>
                                </td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
            </div>
		</div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>