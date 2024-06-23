<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">

<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 메인 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/metisMenu.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="assets/css/typography.css">
<link rel="stylesheet" href="assets/css/default-css.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<!-- modernizr css -->
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>

<style>
tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}
</style>
</head>
<body>
	<div id="preloader">
		<div class="loader"></div>
	</div>
	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content" style="background-color: #f0fffe;">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner" >
				<div class="row">
					
					
					<!-- 1-1 -->

					<div class="col-lg-8">
						<div class="row">
							<div class="col-md-6 mt-5 mb-3">
								<div class="card">
									<div class="seo-fact sbg1">
										<div
											class="p-4 d-flex justify-content-between align-items-center">
											<div class="seofct-icon">
												<i class="fa fa-line-chart"></i>Total Revenue
											</div>
											<h2>2,3112312312315₩</h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 mt-md-5 mb-3">
								<div class="card">
									<div class="seo-fact sbg2">
										<div
											class="p-4 d-flex justify-content-between align-items-center">
											<div class="seofct-icon">
												<i class="fa fa-users"></i>Members
											</div>
											<h2>3,984명</h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 mb-3 mb-lg-0">
								<div class="card">
									<div class="seo-fact sbg3">
										<div
											class="p-4 d-flex justify-content-between align-items-center">
											<div class="seofct-icon">
												<i class="fa fa-line-chart"></i>Today's Revenue
											</div>
											<h2>3,984₩</h2>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card">
									<div class="seo-fact sbg4">
										<div
											class="p-4 d-flex justify-content-between align-items-center">
											<div class="seofct-icon">
												<i class="fa fa-user"></i>Today's Sign-up
											</div>
											<h2>3,984명</h2>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 1-2 -->
					<div class="col-lg-4 mt-5">
						<div class="card">
							<div class="card-body pb-0">
								<h6 class="header-title">Social ads Campain</h6>
								<div id="socialads" style="height: 155px;"></div>
							</div>
						</div>
					</div>


					<!-- 2-1 -->
<div class="col-lg-8 mt-5">
    <div class="card">
        <div class="card-body">
            <h4 class="header-title">최근 7일 매출</h4>
            <canvas id="salesChart"></canvas>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var ctx = document.getElementById('salesChart').getContext('2d');

                    var dates = [];
                    var prices = [];

                    <c:forEach var="vo" items="${sales.seven_days_sales}">
                        dates.push('<fmt:formatDate pattern="yy-MM-dd" value="${vo.date}" />');
                        prices.push(${vo.totalprice});
                    </c:forEach>

                    var salesChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: dates,
                            datasets: [{
                                label: '매출',
                                data: prices,
                                fill: false,
                                borderColor: 'rgba(54, 162, 235, 1)',
                                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                pointBackgroundColor: 'rgba(54, 162, 235, 1)',
                                pointRadius: 5,
                                pointHoverRadius: 7,
                                tension: 0.4
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    grid: {
                                        color: 'rgba(0, 0, 0, 0.1)',
                                        borderWidth: 1
                                    },
                                    ticks: {
                                        color: 'rgba(0, 0, 0, 0.7)'
                                    }
                                },
                                x: {
                                    grid: {
                                        display: false
                                    },
                                    ticks: {
                                        color: 'rgba(0, 0, 0, 0.7)'
                                    }
                                }
                            },
                            plugins: {
                                title: {
                                    display: true,
                                    text: '최근 7일 매출',
                                    font: {
                                        size: 18,
                                        family: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
                                        weight: 'bold'
                                    },
                                    color: 'rgba(0, 0, 0, 0.9)'
                                },
                                legend: {
                                    display: true,
                                    labels: {
                                        color: 'rgba(0, 0, 0, 0.7)'
                                    }
                                },
                                tooltip: {
                                    callbacks: {
                                        label: function (tooltipItem) {
                                            return tooltipItem.formattedValue + '원';
                                        }
                                    }
                                }
                            },
                            animation: {
                                duration: 1500,
                                easing: 'easeOutQuart'
                            }
                        }
                    });
                });
            </script>
        </div>
    </div>
</div>



					<!-- 2-2 -->
					<div class="col-lg-4 mt-5">
						<div class="card h-full">
							<div class="card-body">
								<h4 class="header-title">매출 현황</h4>
								<div class="single-table">
									<div class="table-responsive">
										<table class="table text-center">
											<thead class="text-uppercase bg-success"style="color:white">
												<tr>
													<th>날짜</th>
													<th>매출</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty sales.seven_days_sales}">
													<tr>
														<td class="first" colspan="8">최근 7일 매출이 없습니다.</td>
													</tr>
												</c:if>
												<c:if test="${!empty sales.seven_days_sales }">
													<c:forEach var="vo" items="${sales.seven_days_sales}">

														<tr>
															<td class="date"><fmt:formatDate pattern="yy-MM-dd"
																	value="${vo.date}" /></td>
															<td>
																<fmt:formatNumber value="${vo.totalprice}" type="number" groupingUsed="true" />원
															</td>

														</tr>
													</c:forEach>
												</c:if>
											</tbody>

										</table>
										<!-- <div class="totalsale">
											<i class="fa fa-thumbs-o-up">Revenue:<span id="totalRevenue"></span></i>
											
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 3-1 -->
						<div class="col-lg-8 mt-5">
							<div class="card">
								<div class="card-body">
									<h4 class="header-title">최근 7일 가입자 수</h4>
									<div id="user-statistics"></div>
								</div>
							</div>
						</div>

						<!-- 3-2 -->
						<div class="col-lg-4 mt-5">
							<div class="card h-full">
								<div class="card-body">
									<h4 class="header-title">가입자 현황</h4>
									<canvas id="seolinechart8" height="233"></canvas>
								</div>
							</div>
						</div>




					</div>
				</div></div>
				<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
		</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- offset area end -->
<!-- bootstrap 4 js -->
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/metisMenu.min.js"></script>
<script src="assets/js/jquery.slimscroll.min.js"></script>
<script src="assets/js/jquery.slicknav.min.js"></script>

<!-- start chart js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<!-- start highcharts js -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<!-- start amcharts -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/ammap.js"></script>
<script src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<!-- all line chart activation -->
<script src="assets/js/line-chart.js"></script>
<!-- all pie chart -->
<script src="assets/js/pie-chart.js"></script>
<!-- all bar chart -->
<script src="assets/js/bar-chart.js"></script>
<!-- all map chart -->
<script src="assets/js/maps.js"></script>
<!-- others plugins -->
<script src="assets/js/plugins.js"></script>
<script src="assets/js/scripts.js"></script>
</body>
</html>