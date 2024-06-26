<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 영수증 | Admin</title>
<link rel="shortcut icon" type="image/png"
	href="admin/assets/images/icon/favicon.ico">
<link rel="stylesheet"
	href="../resources/admin/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../resources/admin/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="../resources/admin/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="../resources/admin/assets/css/metisMenu.css">
<link rel="stylesheet"
	href="../resources/admin/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../resources/admin/assets/css/slicknav.min.css">
<!-- amchart css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet"
	href="../resources/admin/assets/css/typography.css">
<link rel="stylesheet"
	href="../resources/admin/assets/css/default-css.css">
<link rel="stylesheet" href="../resources/admin/assets/css/styles.css">
<link rel="stylesheet"
	href="../resources/admin/assets/css/responsive.css">
<!-- modernizr css -->
<script src="../resources/admin/assets/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<div id="preloader">
        <div class="loader"></div>
    </div>
	<div class="main-content-inner">
		<c:forEach var="vo" items="${map.list}">
			<div class="row">
				<div class="col-lg-12 mt-5">
					<div class="card">
						<div class="card-body">
							<div class="invoice-area">
								<div class="invoice-head">
									<div class="row">
										<div class="iv-left col-6">
											<span>환불 영수증</span>
										</div>

										<div class="iv-right col-6 text-md-right">
											<span>#${vo.refundno}</span>
										</div>
									</div>
								</div>
								<div class="row align-items-center">
									<div class="col-md-6">
										<div class="invoice-address">
											<h3>Receipt to</h3>
											<h5>${vo.email != null ? vo.email : '(미입력)'}</h5>
											<p>환불사유:</p>
											<p>${vo.content != null ? vo.content : '(미입력)'}</p>
											<br>
											<p>답변:</p>
											<p>${vo.reply != null ? vo.reply : '(미입력)'}</p>
										</div>
									</div>
									<div class="col-md-6 text-md-right">
										<ul class="invoice-date">
											<li>신청 날짜 : <fmt:formatDate
													pattern="HH:MM   yy | MM | dd" value="${vo.date}" /></li>
											<li>환불 날짜 : <fmt:formatDate
													pattern="HH:MM   yy | MM | dd" value="${vo.refundDate}" /></li>
										</ul>
									</div>
								</div>
								<div class="invoice-table table-responsive mt-5">
									<table class="table table-bordered table-hover text-right">
										<thead>
											<tr class="text-capitalize">
												<th class="text-left" style="width: 45%; min-width: 130px;">품목이름</th>
												<th class="text-center"></th>
												<th class="text-center">qty</th>
												<th class="text-center"></th>
												<th class="text-center" style="min-width: 100px">구매금액</th>
												<th class="text-center">환불금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<!-- <td class="text-center">1</td> -->
												<td class="text-left">${vo.title != null ? vo.title : '(미입력)'}</td>
												<td class="text-center">&emsp;</td>
												<td class="text-center">1</td>
												<td class="text-center">&emsp;</td>
												<td class="text-center">${vo.refund_amount != null ? vo.refund_amount : '(미입력)'}</td>
												<td class="text-center">${vo.refund_amount != null ? vo.refund_amount : '(미입력)'}</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="6">처리상태: 환불 완료</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<div class="invoice-buttons text-right">
								<a href="#" class="invoice-btn">닫기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>



	<script>
		$(document).ready(function() {
			$('.invoice-btn').click(function(e) {
				e.preventDefault();
				window.close();
			});
		});
	</script>







	<!-- jquery latest version -->
	<script src="../resources/admin/assets/js/vendor/jquery-2.2.4.min.js"></script>
	<!-- bootstrap 4 js -->
	<script src="../resources/admin/assets/js/popper.min.js"></script>
	<script src="../resources/admin/assets/js/bootstrap.min.js"></script>
	<script src="../resources/admin/assets/js/owl.carousel.min.js"></script>
	<script src="../resources/admin/assets/js/metisMenu.min.js"></script>
	<script src="../resources/admin/assets/js/jquery.slimscroll.min.js"></script>
	<script src="../resources/admin/assets/js/jquery.slicknav.min.js"></script>

	<!-- start chart js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
	<!-- start highcharts js -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<!-- start zingchart js -->
	<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
	<script>
		zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
		ZC.LICENSE = [ "569d52cefae586f634c54f86dc99e6a9",
				"ee6b7db5b51705a13dc2339db3edaf6d" ];
	</script>
	<!-- all line chart activation -->
	<script src="../resources/admin/assets/js/line-chart.js"></script>
	<!-- all pie chart -->
	<script src="../resources/admin/assets/js/pie-chart.js"></script>
	<!-- others plugins -->
	<script src="../resources/admin/assets/js/plugins.js"></script>
	<script src="../resources/admin/assets/js/scripts.js"></script>
</body>
</html>