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
<title>셀러 등록 요청 | Admin</title>
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


<script src="../resources/js/admin/sellerRequest.js"></script>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}
#date{
	height:48px;
 	margin-top:2px;
}
.mybutton{
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
								<div style="display: flex; justify-content: space-between;">
									<h1 class="header-title" style="font-size: 35px">샐러 등록 요청</h1>

								</div>
									<form method="get" name="searchForm" id="searchForm"
										action="sellerRequestManagement.do">
										<select name="searchType">
											<option value="all">전체</option>
											<option value="email">이메일</option>
											<option value="nickname">닉네임</option>
										</select>
										<input type="text" name="searchWord"/> &emsp;
										<input
											type="date" name="date1" id="date"> &nbsp; ~ &nbsp; <input
											type="date" name="date2" id="date"> <input type="submit"
											class="btn btn-flat btn-secondary mb-3"
											style="font-size: 18px;" value="Search!!">
									</form>
								
								<div class="data-tables datatable-dark">
									<table id="dataTable3" class="text-center">
										<thead class="text-capitalize">
											<tr>
												<th>회원번호</th>
												<th>이메일</th>
												<th>닉네임</th>
												<th>요청일자</th>
												<th>내용</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty sellerRequestMap.list}">
												<tr>
													<td class="first" colspan="8">검색 결과가 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty sellerRequestMap.list }">
												<c:forEach var="vo" items="${sellerRequestMap.list}">

													<tr>
														<td>${vo.memberno != null ? vo.memberno : '(미입력)'}</td>
														<td>${vo.email != null ? vo.email : '(미입력)'}</td>
														<td>${vo.nickname != null ? vo.nickname : '(미입력)'}</td>
														<td class="date"><fmt:formatDate
																pattern="yyyy-MM-dd HH:MM" value="${vo.regdate}" /></td>
														<td>
															<button class="btn btn-outline-secondary mb-3 mybutton" type="button"
																onclick="openPopup(event); return false;">상세보기</button>
														</td>
													</tr>


												</c:forEach>
											</c:if>
										</tbody>

									</table>
									<!-- paging -->
									<div class="pagenate">
										<ul class='paging'>
											<c:forEach var="p" begin="${sellerRequestMap.startPage}"
												end="${sellerRequestMap.endPage}">
												<c:if test="${p == SellerRequestVO.page}">
													<li><a href='#;' class='current'>${p}</a></li>
												</c:if>
												<c:if test="${p != SellerRequestVO.page}">
													<li><a
														href='sellerRequestManagement.do?page=${p}&searchType=${SellerRequestVO.searchType}&searchWord=${SellerRequestVO.searchWord}'>${p}</a></li>
												</c:if>
											</c:forEach>
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