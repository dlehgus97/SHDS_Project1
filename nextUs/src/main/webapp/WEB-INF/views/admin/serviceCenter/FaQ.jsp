<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaQ</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/serviceCenter.css" />
<style>
	#serviceCenter{color:purple;}
	#FaQ{color:purple;}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<!-- CONTENT -->
		<section class="pt-7 pb-12">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-10 col-xl-8">

						<!-- Heading -->
						<h3 class="mb-10 text-center">F A Q</h3>
						<p><span><strong>총 ${map.count }개</strong>  |  ${AdfaqVO.page }/${map.totalPage }페이지</span></p>
						<c:if test="${empty map.list }">
							<div>등록된 글이 없습니다. ${map.count }</div>
						</c:if>
						<c:forEach var="vo" items="${map.list }">
							<tr>
								<!-- List group -->
								<ul class="list-group list-group-flush-x mb-9"
									id="faqCollapseParentOne">
									<li class="list-group-item">
										<!-- Toggle --> <a
										class="dropdown-toggle d-block fs-lg fw-bold text-reset"
										data-bs-toggle="collapse" href="#faqCollapse${vo.no}"> Q.
											${vo.question } </a> <!-- Collapse -->
										<div class="collapse" id="faqCollapse${vo.no}"
											data-bs-parent="#faqCollapseParentOne">
											<div class="mt-5">
												<p class="mb-0 fs-lg text-gray-500">
													A. ${vo.answer }
												</p>
											</div>
										</div>
									</li>
								</ul>
							</tr>
						</c:forEach>
						<div class="btnSet" style="text-align: right;">
						</div>
						<div class="pagenate clear">
							<ul class='paging'>
								<c:if test="${map.prev }">
									<li><a
										href="FaQ.do?page=${map.startPage-1 }&searchType=${AdfaqVO.searchType}&searchWord=${AdfaqVO.searchWord}">
											<< </a></li>
								</c:if>
								<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
									<c:if test="${p == AdfaqVO.page}">
										<li><a href='#;' class='current'>${p}</a></li>
									</c:if>
									<c:if test="${p != AdfaqVO.page}">
										<li><a
											href='faqindex.do?page=${p}&searchType=${AdfaqVO.searchType}&searchWord=${AdfaqVO.searchWord}'>${p}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${map.next }">
									<li><a
										href="FaQ.do?page=${map.endPage+1 }&searchType=${AdfaqVO.searchType}&searchWord=${AdfaqVO.searchWord}">
											>> </a></li>
								</c:if>
							</ul>
						</div>
						<div class="bbsSearch">
							<form method="get" name="searchForm" id="searchForm"
								action="FaQ.do">
								<span class="srchSelect"> <select id="stype"
									name="searchType" class="dSelect" title="검색분류 선택">
										<option value="all">전체</option>
										<option value="title"
											<c:if test="${AdfaqVO.searchType == 'title'}">selected</c:if>>제목</option>
										<option value="content"
											<c:if test="${AdfaqVO.searchType == 'content'}">selected</c:if>>내용</option>
								</select>
								</span> <span class="searchWord"> <input type="text" id="sval"
									name="searchWord" value="${AdfaqVO.searchWord}" title="검색어 입력"><br>
									<input type="submit" id="" value="검색" title="검색">
								</span>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- JAVASCRIPT -->
		<!-- Map (replace the API key to enable) -->
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>

		<!-- Vendor JS -->
		<script src="/resources/js/board/vendor.bundle.js"></script>

		<!-- Theme JS -->
		<script src="/resources/js/board/theme.bundle.js"></script>
	</div>
</body>
<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
</html>