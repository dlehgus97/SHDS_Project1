<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Event</title>
<META name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/contents.css" />

<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />

<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />

<link rel="stylesheet" type="text/css" href="/resources/css/board/event.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<!-- CONTENT -->
		<section class="pt-7 pb-12">
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
						<div class="card mb-7">

							<!-- Image -->
							<a href="view.do?no=${vo.no}">
								<img class="card-img-top" src="/upload/board/${vo.thumbnail_real}"
									alt="..." style="width: 100%; height: 500px; object-fit: cover;">
							</a>
							<!-- Body -->
							<div class="card-body px-0">

								<!-- Heading -->
								<h5>${vo.title }</h5>
								<h10>${vo.start } ~ ${vo.end }</h10>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
                </div>
                    <div class="pagenate clear">
                        <ul class='paging'>
                        <c:if test="${map.prev }">
                        	<li><a href="index.do?page=${map.startPage-1 }&searchType=${eventVO.searchType}&searchWord=${eventVO.searchWord}"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                        	<c:if test="${p == eventVO.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != eventVO.page}">
                            <li><a href='index.do?page=${p}&searchType=${eventVO.searchType}&searchWord=${eventVO.searchWord}'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${map.next }">
                        	<li><a href="index.do?page=${map.endPage+1 }&searchType=${eventVO.searchType}&searchWord=${eventVO.searchWord}"> >> </a></li>
                        </c:if>
                        </ul> 
                    </div>
                    
                    <div class="bbsSearch">
                        <form method="get" name="searchForm" id="searchForm" action="index.do">
                            <span class="srchSelect">
                                <select id="stype" name="searchType" class="dSelect" title="검색분류 선택">
                                    <option value="all">전체</option>
                                    <option value="title" <c:if test="${eventVO.searchType == 'title'}">selected</c:if>>제목</option>
                                    <option value="content" <c:if test="${eventVO.searchType == 'content'}">selected</c:if>>내용</option>
                                </select>
                            </span>
                            <span class="searchWord">
                                <input type="text" id="sval" name="searchWord" value="${eventVO.searchWord}"  title="검색어 입력"><br>
                                <input type="submit" id="" value="검색" title="검색">
                            </span>
                        </form>
                    </div>
			</div>
		</section>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
	<!--부트스트랩 JAVASCRIPT -->
	<!-- Map (replace the API key to enable) -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>

	<!-- Vendor JS -->
	<script src="/resources/js/board/vendor.bundle.js"></script>

	<!-- Theme JS -->
	<script src="/resources/js/board/theme.bundle.js"></script>
</body>
</html>