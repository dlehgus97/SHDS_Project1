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
<title>관리자 메인 페이지</title>
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
	 vertical-align: middle; 
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
								<h1 class="header-title" style="font-size: 35px">쿠폰 발급 내역</h1>
								<div class="data-tables datatable-dark">
									<table id="dataTable3" class="text-center">
										<thead class="text-capitalize">
											<tr>
												<th>번호</th>
												<th>쿠폰이름</th>
												<th>유형</th>
												<th>할인액/할인율</th>
												<th>발급 대상자</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty map.list}">
												<tr>
													<td class="first" colspan="8">발급된 쿠폰이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty map.list }">
												<c:forEach var="vo" items="${map.list}">

													<tr>
														<td>${vo.no }</td>
														<td id="couponName">${vo.name }</td>
														<td>${vo.type == 1?"고정할인":"%할인"}</td>
														<td><c:choose>
																<c:when test="${vo.type == 1}">
																	${vo.discount}원
           														</c:when>
																<c:otherwise>
           															${vo.discount}%
        														</c:otherwise>
															</c:choose></td>
														<td>
															<button class="btn btn-success mb-3" type="button" 
															style="margin-top:13px;"onclick="openPopup(event); return false;">발급내역</button>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									<!-- paging -->
									
							
									<div class="pagenate" style="margin-top:10px;">
										<ul class='paging'>
											<c:if test="${map.prev }">
												<li><a href="couponManagement?page=${map.startPage-1 }">
														<< </a></li>
											</c:if>
											<c:forEach var="p" begin="${map.startPage}"
												end="${map.endPage}">
												<c:if test="${p == CouponVO.page}">
													<li><a href='#;' class='current'>${p}</a></li>
												</c:if>
												<c:if test="${p != CouponVO.page}">
													<li><a href='couponManagement?page=${p}'>${p}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${map.next }">
												<li><a
													href="couponManagement?page=${map.endPage+1 }"> >> </a></li>
											</c:if>
										</ul>
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