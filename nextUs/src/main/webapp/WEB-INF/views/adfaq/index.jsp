<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>자주 묻는 질문</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/reset.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link rel="stylesheet" href="/resources/css/contents.css"/>
<link rel="stylesheet" href="/resources/css/contents.css" />

<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />

<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
<script>
        function confirmDelete() {
            return confirm('삭제하시겠습니까?');
        }
</script>
<style>
.bg{
background-color:white;
border-radius:5px;
}
.mb-3{
width:100px;
font-size:25px;
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
		<section class="pt-7 pb-12">
			<div class="container bg">
				<div class="row justify-content-center" >
					<div class="col-12 col-lg-10 col-xl-8">

						<!-- Heading -->
						<h1 class="header-title text-center" style="font-size: 35px">자주 묻는 질문</h1>

							<div style="display: flex; justify-content: space-between;">

								<p>
									<span><strong>총 ${map.count }개</strong> | ${FAQVO.page }/${map.totalPage }페이지</span>
								</p>
								<div class="btnSet" style="text-align: right;margin-top:-10px;">
									<a href="/adfaq/write.do" 
									style="width:130px;"
									class="btn btn-info mb-3">FAQ작성</a>
								</div>

							</div>
							<c:if test="${empty map.list }">
							<div>등록된 글이 없습니다.</div>
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
												<span class="btnSet" style="float: right; margin-left: 5px;">
												    <a href="/adfaq/delete.do?no=${vo.no }" class="btn btn-danger mb-3" onclick="return confirmDelete();">삭제</a>
												</span>
												<span class="btnSet" style="float: right; margin-left: 5px;">
												    <a href="/adfaq/edit.do?no=${vo.no }" class="btn btn-success mb-3">수정</a>
												</span>
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
										href="index.do?page=${map.startPage-1 }&searchType=${faqVO.searchType}&searchWord=${faqVO.searchWord}">
											<< </a></li>
								</c:if>
								<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
									<c:if test="${p == faqVO.page}">
										<li><a href='#;' class='current'>${p}</a></li>
									</c:if>
									<c:if test="${p != faqVO.page}">
										<li><a
											href='index.do?page=${p}&searchType=${faqVO.searchType}&searchWord=${faqVO.searchWord}'>${p}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${map.next }">
									<li><a
										href="index.do?page=${map.endPage+1 }&searchType=${faqVO.searchType}&searchWord=${faqVO.searchWord}">
											>> </a></li>
								</c:if>
							</ul>
						</div>
						<div class="bbsSearch">
							<form method="get" name="searchForm" id="searchForm"
								action="index.do">
								<span class="srchSelect"> <select id="stype"
									name="searchType" class="dSelect" title="검색분류 선택">
										<option value="all">전체</option>
										<option value="title"
											<c:if test="${faqVO.searchType == 'title'}">selected</c:if>>제목</option>
										<option value="content"
											<c:if test="${faqVO.searchType == 'content'}">selected</c:if>>내용</option>
								</select>
								</span> <span class="searchWord"> <input type="text" id="sval"
									name="searchWord" value="${faqVO.searchWord}" title="검색어 입력"><br>
									<input type="submit" id="" value="검색" title="검색">
								</span>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
</div>
		<!-- JAVASCRIPT -->
		<!-- Map (replace the API key to enable) -->
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>

		<!-- Vendor JS -->
		<script src="/resources/js/board/vendor.bundle.js"></script>

		<!-- Theme JS -->
		<script src="/resources/js/board/theme.bundle.js"></script>
	</div>
	
	<!-- alertdesign -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!-- bootstrap -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>	
    
</body>
</html>