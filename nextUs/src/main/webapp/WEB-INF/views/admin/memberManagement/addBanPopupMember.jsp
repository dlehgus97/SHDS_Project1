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
<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />
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

<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />

<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}

.checkbox {
	transform: scale(1.5);
}

.center-align {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

.ban_lower {
	position: fixed;
	bottom: 0;
	width: 90%;
	padding: 20px;
	z-index: 1000;
}

.lower_div {
	width: 50%; /* Each inner div takes 50% width */
	/* Include padding and border in width calculation */
	padding: 5px; /* Optional: Add padding */
	margin-left: 15px;
}
</style>

</head>
<body>
	<div class="main-content-inner">
		<div class="row">
			<div class="col-12 mt-5">
				<div class="card">
					<div class="card-body">
						<h2 class="header-title" style="margin-top: -40px;">제재 내역 추가</h2>

						<form method="get" name="searchForm" id="searchForm"
							action="addBanPopupMember.do"
							style="margin-top: -40px; margin-left: 200px;">
							<select name="searchType">
								<option value="all">전체</option>
								<option value="email">이메일</option>
								<option value="nickname">닉네임</option>
							</select> <input type="text" name="searchWord" /> <input type="submit"
								class="btn btn-flat btn-secondary mb-3" style="font-size: 18px;"
								value="검색">
						</form>

						<form method="post" name="banForm" id="banForm" action="BAN0.do">
							<div class="data-tables datatable-dark">
								<table id="dataTable3" class="text-center">
									<thead class="text-capitalize">
										<tr>
											<th><input type="checkbox"
												class="selectAll_button checkbox" name="select"
												id="checkAll"></th>
											<th>이메일</th>
											<th>닉네임</th>
											<th>가입일</th>
											<th>누적 신고횟수</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="vo" items="${map.list }">
											<tr class="clickable-row">
												<td><input name="membernos" type="checkbox"
													class="checkbox" value='${vo.no}'></td>
												<td>${vo.email != null ? vo.email : '(미입력)'}</td>
												<td>${vo.nickname != null ? vo.nickname : '(미입력)'}</td>
												<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
														value="${vo.regdate}" /></td>
												<td>${vo.reportcount != null ? vo.reportcount : '0'}</td>
												<td>
													<button class="btn btn-warning mb-3"
														style="margin-top: 13px;"
														onclick="loadReportDetails('${vo.email}'); return false;"
														type="button">신고내역 보기</button>
												</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>

							</div>


							<div class="ban_lower" style="display: flex;">
								<div class="lower_div">
									<div class="data-tables datatable-dark">
										<table id="dataTable3" class="text-center"
											style="width: 100%;">
											<thead class="text-capitalize">
												<tr>
													<th>시간</th>
													<th>신고내용</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty map2.list}">
													<tr>
														<td class="first" colspan="8">검색 내역이 없습니다.</td>
													</tr>
												</c:if>
												<c:if test="${!empty map2.list }">
													<c:forEach var="vo" items="${map2.list}">
														<tr>
															<td class="date"><fmt:formatDate
																	pattern="yy-MM-dd HH:MM" value="${vo2.date}" /></td>
															<td>${vo2.content != null ? vo2.content : '(미입력)'}</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>

										</table>

									</div>
								</div>
								<div class="doBan lower_div" style="font-size: 20px;">
									제재 사유<input class="form-control" type="text" name="content"
										id="example-text-input" style="width: 100%; margin-left: 0px">
									제재 기간<input class="form-control" name="date" id="date"
										type="date"> <br> <input type="submit"
										class="btn  btn-success btn-lg btn-block"
										style="margin-left: -5px;" id="banSubmit" value="등록하기">

								</div>
							</div>
						</form>




					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(
				function() {
					// Clickable row to toggle checkbox
					$('.clickable-row').click(
							function(e) {
								// Avoid triggering checkbox click when clicking inside the row
								if (!$(e.target).is('input[type="checkbox"]')
										&& !$(e.target).is('button')) {
									let checkbox = $(this).find(
											'input[type="checkbox"]');
									checkbox.prop('checked', !checkbox
											.prop('checked'));
								}
							});

					// Prevent row click event when button is clicked
					$('.clickable-row button').click(
							function(e) {
								e.stopPropagation();
								let email = $(this).closest('tr').find(
										'td:nth-child(2)').text().trim(); // 이메일 가져오기
								loadReportDetails(email); // AJAX 함수 호출
							});

					// Select all checkboxes when the header checkbox is clicked
					$('#checkAll').click(
							function() {
								$('input:checkbox').not(this).prop('checked',
										this.checked);
							});
				});

		// Function to load report details via AJAX
		function loadReportDetails(email) {
			$
					.ajax({
						type : 'GET',
						url : '/loadReportDetails', // 실제 서버 요청 URL로 변경해야 합니다.
						data : {
							email : email
						}, // 서버에 전달할 데이터
						success : function(response) {
							// 서버로부터 데이터를 성공적으로 받았을 때 실행됩니다.
							// 데이터를 테이블에 추가하는 코드를 여기에 작성합니다.
							if (response && response.length > 0) {
								// 테이블의 tbody 선택 후 내용 추가
								let tbody = $('#dataTable2 tbody');
								tbody.empty(); // 기존 내용 삭제

								$.each(response, function(index, item) {
									let row = '<tr>' + '<td>' + item.date
											+ '</td>' + '<td>' + item.content
											+ '</td>' + '</tr>';
									tbody.append(row);
									console.log(item.date);
									console.log(item.content);
									console.log('===============');
								});
							} else {
								// 데이터가 없을 경우 예외 처리
								let tbody = $('#dataTable2 tbody');
								tbody.empty();
								tbody
										.append('<tr><td colspan="2">검색 내역이 없습니다.</td></tr>');
							}
						},
						error : function(xhr, status, error) {
							// 오류 처리
							console.error('AJAX Error: ' + status, error);
						}
					});
		}
	</script>








	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
</body>
</html>