<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>쿠폰지급 | Admin</title>
<script src="../resources/js/admin/memberStatus.js"></script>
<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

<script src="../resources/js/admin/couponManagement.js"></script>
<script src="../resources/js/admin/coupon.js"></script>
<script src="../resources/js/admin/memberBanManagement.js"></script>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}

.checkbox{
 transform: scale(1.5);
}
t1{font-size:20px;}
</style>
</head>
<body>
<div id="preloader">
        <div class="loader"></div>
    </div>
	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content" style="background-color:#f0fffe;">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<form method="post" name="couponForm" id="couponForm"
									action="giveCoupon.do">
									<t1>&emsp;&ensp;&ensp;쿠폰 이름&emsp;:</t1><input type="text" name="name"
										placeholder=' 쿠폰 이름을 입력하세요' />&emsp;
									<input type="radio"class="fc" name="type" value=1 checked="checked"><t1>고정할인&emsp;</t1>
									&emsp;&emsp;
									<input type="radio" class="pc" name="type" value=2><t1>%할인</t1>

									<br> <br>
									
									<t1>&emsp;&ensp;&ensp;할&emsp;&nbsp;&emsp;인&emsp;:</t1>
									<input type="text" name="discount" placeholder='할인 금액(원)을 입력해주세요' /> <br> <br>
									
									<t1>발급대상자:</t1>
									<div class="data-tables datatable-dark">
										<table id="dataTable3" class="text-center">
											<thead class="text-capitalize">
												<tr>
													<th><input id="checkAll" class="selectAll_button checkbox"
														type="checkbox"></th>
													<th>이메일</th>
													<th>닉네임</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="vo" items="${memberlist.list}">
													<tr class="clickable-row">
														<td><input class="checkbox" name="memberEmails"
															type="checkbox" value='${vo.email}'></td>
														<td>${vo.email != null ? vo.email : '(미입력)'}</td>
														<td>${vo.nickname != null ? vo.nickname : '(미입력)'}</td>
													</tr>
												</c:forEach>
											</tbody>	
										</table>

									</div>
									<br><br>
									<input type="submit" class="btn btn-success btn-lg btn-block" style="width:98%;" value="쿠폰 지급">
								</form>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div><%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
	</div>


	<script>
		$(document).ready(function() {
			// 각 tr 요소에 대해 클릭 이벤트를 추가
			$('.clickable-row').click(function(event) {
				// 클릭된 tr 요소에서 체크박스를 찾아서 클릭 이벤트 발생시키기
				$(this).find('.checkbox').click();
			});
		});

		document.addEventListener('DOMContentLoaded', function() {
			var checkAll = document.getElementById('checkAll');
			var checkboxes = document.querySelectorAll('tbody .checkbox');

			checkAll.addEventListener('click', function() {
				checkboxes.forEach(function(checkbox) {
					checkbox.checked = checkAll.checked;
				});
			});

			checkboxes.forEach(function(checkbox) {
				checkbox.addEventListener('click', function() {
					// 모든 체크박스가 선택되었는지 확인
					var allChecked = true;
					checkboxes.forEach(function(cb) {
						if (!cb.checked) {
							allChecked = false;
						}
					});
					checkAll.checked = allChecked;
				});
			});
		});
	</script>







<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>






</body>
</html>