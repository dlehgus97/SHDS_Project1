<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고객센터 QnA</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

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
table tr{height:46px;}
table a{
	color:black;
	display: inline-block; /* <a> 태그를 inline-block으로 설정하여 중앙 정렬에 맞추기 */
    text-align: center; /* <a> 태그 내 텍스트를 중앙 정렬 */
    width: 100%;
}

.mybutton {
	width: 250px;
	font-size: 45px;
	height: 45px;
	font-weight: bold;
}
</style>

</head>
<body>
	<div id="preloader">
		<div class="loader"></div>
	</div>


	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content" style="background-color: #485465;">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<div style="display: flex; justify-content: space-between;">
									<h1 class="header-title" style="font-size: 35px">고객센터(QnA)</h1>
									<!-- 검색 -->
									<form method="get" name="searchForm" id="searchForm"
										action="index.do">
										<span class="srchSelect"> <select id="stype"
											name="searchType" class="dSelect" title="검색분류 선택">
												<option value="all">전체</option>
												<option value="title"
													<c:if test="${QnAVO.searchType == 'title'}">selected</c:if>>제목</option>
												<option value="text"
													<c:if test="${QnAVO.searchType == 'text'}">selected</c:if>>내용</option>
										</select>
										</span> <span class="searchWord"> <input type="text" id="sval"
											name="searchWord" value="${QnAVO.searchWord}" title="검색어 입력">
											<input type="submit" class="btn btn-flat btn-secondary mb-3" value="검색" title="검색">
										</span>
									</form>
								</div>

								<p>
									<span><strong>총 ${map.count }개</strong> | ${qnAVO.page }/${map.totalPage }페이지</span>
								</p>
								<div class="data-tables datatable-dark">
									<table id="dataTable3" class="text-center">
										<thead class="text-capitalize">

											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>카테고리</th>
												<th>작성일</th>
												<th>답변상태</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty map.list }">
												<tr>
													<td class="first" colspan="8">등록된 글이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="vo" items="${map.list }">
												<tr>
													<td>${vo.no }</td>
													<td style="text-align: left;"><a
														href="view.do?no=${vo.no}">${vo.title }</a></td>
													<td class="writer">${vo.writer_name }</td>
													<td>${vo.category }</td>
													<td class="date"><fmt:formatDate
															value="${vo.write_date }" pattern="YYYY-MM-dd" /></td>
													<td class="status"><c:choose>
															<c:when test="${empty vo.answer}">
				                            답변대기
				                        </c:when>
															<c:otherwise>
				                            답변완료
				                        </c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- 페이지처리 -->
									<div class="pagenate">
										<ul class='paging'>
											<c:if test="${map.prev }">
												<li><a
													href="index.do?page=${map.startPage-1 }&searchType=${QnAVO.searchType}&searchWord=${QnAVO.searchWord}">
														<< </a></li>
											</c:if>
											<c:forEach var="p" begin="${map.startPage}"
												end="${map.endPage}">
												<c:if test="${p == QnAVO.page}">
													<li><a href='#;' class='current'>${p}</a></li>
												</c:if>
												<c:if test="${p != QnAVO.page}">
													<li><a
														href='index.do?page=${p}&searchType=${QnAVO.searchType}&searchWord=${QnAVO.searchWord}'>${p}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${map.next }">
												<li><a
													href="index.do?page=${map.endPage+1 }&searchType=${QnAVO.searchType}&searchWord=${QnAVO.searchWord}">
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
		<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
	</div>


	<!-- bootstrap -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
</body>
</html>