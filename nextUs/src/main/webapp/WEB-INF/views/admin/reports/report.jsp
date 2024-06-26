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
<title>신고내역 | Admin</title>
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


<script src="../resources/js/admin/reportPopup.js"></script>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}

.mybutton {
	margin-top:13px;
}
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
								<h2 class="header-title" style="font-size: 35px">신고접수내역</h2>
								<div class="data-tables datatable-dark">
									<table id="dataTable3" class="text-center">
										<thead class="text-capitalize">
											<tr>
												<th>신고번호</th>
												<th>이메일</th>
												<th>신고자</th>
												<th>글 유형</th>
												<th>신고 날짜</th>
												<th>상세내용</th>
											</tr>
										</thead>
										<tbody>
						<c:if test="${empty map.list}">
							<tr>
								<td class="first" colspan="8">신고내역이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty map.list }">
							<c:forEach var="vo" items="${map.list}">
								<tr>
									<td>${vo.no}</td>
									<td>${vo.reportedmemberEmail != null ? vo.reportedmemberEmail : '(미입력)'}</td>
									<td>${vo.reportermemberEmail != null ? vo.reportermemberEmail : '(미입력)'}</td>
									<td><c:choose>
											<c:when test="${vo.reviewno == 0}">
												판매글
           									</c:when>

											<c:otherwise>
           										리뷰
        									</c:otherwise>
										</c:choose></td>
									<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${vo.date}" /></td>
									<td><button class="btn btn-outline-secondary mb-3 mybutton"
										onclick="openPopup(event); return false;" type="button">상세내용보기</button></td>
								</tr>


							</c:forEach>
						</c:if>
					</tbody>
 
									</table>
									<!-- paging -->
									<div class="pagenate" style="margin-top: 10px;">
										<c:forEach var="p" begin="${map.startPage}"
											end="${map.endPage}">
											<c:if test="${p == ReportVO.page}">
												<li><a href='#;' class='current'>${p}</a></li>
											</c:if>
											<c:if test="${p != ReportVO.page}">
												<li><a href='report?page=${p}'>${p}</a></li>
											</c:if>
										</c:forEach>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
	</div>




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