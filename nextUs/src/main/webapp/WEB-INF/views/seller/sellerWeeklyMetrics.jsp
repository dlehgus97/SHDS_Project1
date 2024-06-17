<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매자 주간 지표</title>
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
            margin-left: 200px; /* 사이드바 너비 */
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
            	<h1>주문</h1>
		        <table>
		            <thead>
		                <tr>          
		                    <th>주문발생날</th>
		                    <th>주문 개수</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="orderCounts" items="${orderCounts}">
		                    <tr>
								<td>${orderCounts.order_date}</td>            
								<td>${orderCounts.daily_order_count}</td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		        
		        <h1>매출</h1>
		        <table>
		            <thead>
		                <tr>          
		                    <th>매출발생날</th>
		                    <th>매출액</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="incomeCounts" items="${incomeCounts}">
		                    <tr>
								<td>${incomeCounts.sales_date}</td>            
								<td>${incomeCounts.daily_sales}</td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		        
		        <h1>환불</h1>
		        <table>
		            <thead>
		                <tr>          
		                    <th>환불일</th>
		                    <th>환불 건수</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="refundCounts" items="${refundCounts}">
		                    <tr>
								<td>${refundCounts.refund_date}</td>            
								<td>${refundCounts.daily_refund_count}</td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		        
		        <h1>리뷰</h1>
		        <table>
		            <thead>
		                <tr>          
		                    <th>리뷰 받은 날</th>
		                    <th>리뷰 건수</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="reviewCounts" items="${reviewCounts}">
		                    <tr>
								<td>${reviewCounts.review_date}</td>            
								<td>${reviewCounts.daily_review_count}</td>
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