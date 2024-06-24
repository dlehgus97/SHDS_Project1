<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>이벤트</title>
<META name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/contents.css" />

<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />

<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />

<link rel="stylesheet" type="text/css" href="/resources/css/board/event.css">
<style>
.bg{
background-color:white;
border-radius:5px;
width:65%;
margin-top:30px;
justify-content: center;
}
.all{
display: flex;
justify-content: center;
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
			<!-- CONTENT -->
			<div class="all">
				<div class="bg">
					<div class="container">
						<div class="row">
							<div class="col-12">

								<!-- Heading -->
								<h3 class="mb-7 text-center">EVENT</h3>

							</div>
						</div>
						<div class="row">
							<c:if test="${empty map.list }">
								<tr>
									<td class="first" colspan="8">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="vo" items="${map.list }">
								<div class="col-12 col-md-6">

									<!-- Card -->
									<a href="view.do?no=${vo.no}" class="card mb-7"
										style="text-decoration: none; color: inherit;"> <!-- Image -->
										<img class="card-img-top"
										src="/upload/board/${vo.thumbnail_real}" alt="..."
										style="width: 100%; height: 500px; object-fit: cover;">

										<!-- Body -->
										<div class="card-body px-0">

											<!-- Heading -->
											<h5>${vo.title }</h5>
											<h10>${vo.start } ~ ${vo.end }</h10>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="btnSet" style="text-align: right;">
							<a class="btn" href="write.do">글작성 </a>
							<!--<c:if test="${!empty login}">-->
							<!--</c:if>-->
						</div>
					</div>
				</div>
			</div>
			<div class="pagenate clear">
					<ul class='paging'>
						<c:if test="${map.prev }">
							<li><a
								href="index.do?page=${map.startPage-1 }&searchType=${eventVO.searchType}&searchWord=${eventVO.searchWord}">
									<< </a></li>
						</c:if>
						<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
							<c:if test="${p == eventVO.page}">
								<li><a href='#;' class='current'>${p}</a></li>
							</c:if>
							<c:if test="${p != eventVO.page}">
								<li><a
									href='index.do?page=${p}&searchType=${eventVO.searchType}&searchWord=${eventVO.searchWord}'>${p}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${map.next }">
							<li><a
								href="index.do?page=${map.endPage+1 }&searchType=${eventVO.searchType}&searchWord=${eventVO.searchWord}">
									>> </a></li>
						</c:if>
					</ul>
				</div>

				<div class="bbsSearch" style="height:60px;">
					<form method="get" name="searchForm" id="searchForm"
						action="index.do">
						<span class="srchSelect"> <select id="stype"
							name="searchType" class="dSelect" title="검색분류 선택">
								<option value="all">전체</option>
								<option value="title"
									<c:if test="${eventVO.searchType == 'title'}">selected</c:if>>제목</option>
								<option value="content"
									<c:if test="${eventVO.searchType == 'content'}">selected</c:if>>내용</option>
						</select>
						</span> <span class="searchWord"> <input type="text" id="sval"
							name="searchWord" value="${eventVO.searchWord}" title="검색어 입력"><br>
							<input type="submit" id="" value="검색" title="검색">
						</span>
					</form>
				</div>
		</div>

		<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
	</div>

	<!--부트스트랩 JAVASCRIPT -->
	<!-- Map (replace the API key to enable) -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>

	<!-- Vendor JS -->
	<script src="/resources/js/board/vendor.bundle.js"></script>

	<!-- Theme JS -->
	<script src="/resources/js/board/theme.bundle.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

</body>
</html>