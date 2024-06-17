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

<style>
table {
	width: 100%;
	border-collapse: collapse;
	font-size: 18px;
}

tbody tr:hover {
	background-color: #f1f1f1; /* 배경색 변경 */
}
</style>
</head>
<body>
	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<div style="display: flex; justify-content: space-between;">
									<h1 class="header-title" style="font-size: 35px">회원 목록</h1>
									<form method="get" name="searchForm" id="searchForm"
										action="memberStatus.do">
										<select name="searchType">
											<option value="all">전체</option>
											<option value="no">번호</option>
											<option value="email">이메일</option>
											<option value="nickname">닉네임</option>
										</select> <input type="text" name="searchWord" /> <input type="submit"
											class="btn btn-flat btn-secondary mb-3"
											style="font-size: 18px;" value="Search!!">
									</form>
								</div>
								<div class="data-tables datatable-dark">
									<table id="dataTable3" class="text-center">
										<thead class="text-capitalize">
											<tr>
												<th>번호</th>
												<th>이메일</th>
												<th>닉네임</th>
												<th>가입일</th>
												<th>최근 구매일(확정)</th>
												<th>누적 구매수</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty map.list}">
												<tr>
													<td class="first" colspan="8">검색 결과가 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty map.list }">
												<c:forEach var="vo" items="${map.list}">

													<tr>
														<td>${vo.no != null ? vo.no : '(미입력)'}</td>
														<td>${vo.email != null ? vo.email : '(미입력)'}</td>
														<td>${vo.nickname != null ? vo.nickname : '(미입력)'}</td>
														<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
																value="${vo.regdate}" /></td>

														<!-- 최근구매일로 바꾸기 -->
														<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
																value="${vo.regdate}" /></td>

														<td>${vo.purchaseCount}</td>
													</tr>


												</c:forEach>
											</c:if>
										</tbody>

									</table>
									<!-- paging -->
									<div class="pagenate">
										<ul class='paging'>
											<c:if test="${map.prev }">
												<li><a
													href="memberStatus.do?page=${map.startPage-1 }&searchType=${MemberVO.searchType}&searchWord=${MemberVO.searchWord}">
														<< </a></li>
											</c:if>
											<c:forEach var="p" begin="${map.startPage}"
												end="${map.endPage}">
												<c:if test="${p == MemberVO.page}">
													<li><a href='#;' class='current'>${p}</a></li>
												</c:if>
												<c:if test="${p != MemberVO.page}">
													<li><a
														href='memberStatus.do?page=${p}&searchType=${MemberVO.searchType}&searchWord=${MemberVO.searchWord}'>${p}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${map.next }">
												<li><a
													href="memberStatus.do?page=${map.endPage+1 }&searchType=${MemberVO.searchType}&searchWord=${MemberVO.searchWord}">
														>> </a></li>
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