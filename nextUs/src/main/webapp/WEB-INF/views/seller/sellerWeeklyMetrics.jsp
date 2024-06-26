<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매자 주간 지표 | NEXt Us</title>
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
            width: 100%;
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
            margin-left: 150px;
			margin-right: 150px;
            padding: 20px;
            flex-grow: 1;
            /* display: flex; */
        }

        .chart-container, .table-container {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
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
		
		.flex-container {
            display: flex;
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        $(document).ready(function() {
            // 차트 데이터를 JSP에서 가져와서 자바스크립트 배열로 변환
            var labels = [
                <c:forEach var="orderCounts" items="${orderCounts}">
                    '<fmt:formatDate value="${orderCounts.date}" pattern="yyyy-MM-dd"/>',
                </c:forEach>
            ].reverse();
            var orderCountsData = [
                <c:forEach var="orderCounts" items="${orderCounts}">
                    ${orderCounts.daily_order_count},
                </c:forEach>
            ].reverse();
            var dailySalesData = [
                <c:forEach var="orderCounts" items="${orderCounts}">
                    ${orderCounts.daily_sales},
                </c:forEach>
            ].reverse();
            var dailyRefundCountsData = [
                <c:forEach var="orderCounts" items="${orderCounts}">
                    ${orderCounts.daily_refund_count},
                </c:forEach>
            ].reverse();
            var dailyReviewCountsData = [
                <c:forEach var="orderCounts" items="${orderCounts}">
                    ${orderCounts.daily_review_count},
                </c:forEach>
            ].reverse();

            // 차트를 그리기 위해 Chart.js 사용
            var ctx = document.getElementById('weeklyMetricsChart').getContext('2d');
            var weeklyMetricsChart = new Chart(ctx, {
                type: 'line', // 차트 유형: line, bar, etc.
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: '주문 수',
                            data: orderCountsData,
                            borderColor: 'rgba(75, 192, 192, 1)',
                            yAxisID: 'y1',
                            fill: false
                        },
                        {
                            label: '매출액',
                            data: dailySalesData,
                            borderColor: 'rgba(255, 159, 64, 1)',
                            yAxisID: 'y2',
                            fill: false
                        },
                        {
                            label: '환불 수',
                            data: dailyRefundCountsData,
                            borderColor: 'rgba(255, 99, 132, 1)',
                            yAxisID: 'y1',
                            fill: false
                        },
                        {
                            label: '리뷰',
                            data: dailyReviewCountsData,
                            borderColor: 'rgba(54, 162, 235, 1)',
                            yAxisID: 'y1',
                            fill: false
                        }
                    ]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            display: true,
                            title: {
                                display: true,
                                text: '날짜'
                            }
                        },
                        y1: {
                            type: 'linear',
                            position: 'left',
                            title: {
                                display: true,
                                text: '주문 수, 환불 수, 리뷰 수'
                            },
                            ticks: {
                                stepSize: 1  // 눈금 단위를 1로 설정
                            }
                        },
                        y2: {
                            type: 'linear',
                            position: 'right',
                            title: {
                                display: true,
                                text: '매출액'
                            },
                            grid: {
                                drawOnChartArea: false
                            }
                        }
                    }
                }
            });
        });
    </script>
</head>
<body>
    <%
        int totalOrderCount = 0;
        int totalSales = 0;
        int totalRefundCount = 0;
        int totalReviewCount = 0;
    %>
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
				<div class="flex-container">
                <div class="chart-container">
                    <canvas id="weeklyMetricsChart" width="400" height="200"></canvas>
                </div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>날짜</th>
                                <th>주문 수</th>
                                <th>매출액</th>
                                <th>환불 수</th>
                                <th>리뷰</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="orderCounts" items="${orderCounts}">
                                <c:set var="dailyOrderCount" value="${orderCounts.daily_order_count}" />
                                <c:set var="dailySales" value="${orderCounts.daily_sales}" />
                                <c:set var="dailyRefundCount" value="${orderCounts.daily_refund_count}" />
                                <c:set var="dailyReviewCount" value="${orderCounts.daily_review_count}" />

                                <c:set var="totalOrderCount" value="${totalOrderCount + dailyOrderCount}" scope="page" />
                                <c:set var="totalSales" value="${totalSales + dailySales}" scope="page" />
                                <c:set var="totalRefundCount" value="${totalRefundCount + dailyRefundCount}" scope="page" />
                                <c:set var="totalReviewCount" value="${totalReviewCount + dailyReviewCount}" scope="page" />

                                <tr>
                                    <td><fmt:formatDate value="${orderCounts.date}" pattern="yyyy-MM-dd"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${orderCounts.daily_order_count == 0}">
                                                -
                                            </c:when>
                                            <c:otherwise>
                                                ${orderCounts.daily_order_count}건
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${orderCounts.daily_sales == 0}">
                                                -
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${orderCounts.daily_sales}" type="number" pattern="###,###"/>원
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${orderCounts.daily_refund_count == 0}">
                                                -
                                            </c:when>
                                            <c:otherwise>
                                                ${orderCounts.daily_refund_count}건
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${orderCounts.daily_review_count == 0}">
                                                -
                                            </c:when>
                                            <c:otherwise>
                                                ${orderCounts.daily_review_count}개
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td><strong>최근 7일 합계</strong></td>
                                <td><strong>${totalOrderCount}건</strong></td>
                                <td><strong><fmt:formatNumber value="${totalSales}" type="number" pattern="###,###"/>원</strong></td>
                                <td><strong>${totalRefundCount}건</strong></td>
                                <td><strong>${totalReviewCount}개</strong></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>

</html>

