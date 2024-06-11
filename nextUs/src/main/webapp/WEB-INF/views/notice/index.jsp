<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
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
<link rel="stylesheet" href="/resources/css/reset.css"/>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link rel="stylesheet" href="/resources/css/contents.css"/>


</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
		<div class="sub">
			<div class="size">
				<h3 class="sub_title">공지사항</h3>
				<div class="bbs">
					<table class="list">
						<p>
							<span><strong>총 ${map.count }개</strong> | ${noticeVO.page }/${map.totalPage }페이지</span>
						</p>
						<caption>게시판 목록</caption>
						<colgroup>
							<col width="80px" />
							<col width="*" />
							<col width="100px" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
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
									<td class="date"><fmt:formatDate value="${vo.writedate }"
											pattern="YYYY-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="btnSet" style="text-align: right;">
						<c:if test="${!empty login}">
							<a class="btn" href="write.do">글작성 </a>
						</c:if>
					</div>
					<div class="pagenate">
						<ul class='paging'>
							<c:if test="${map.prev }">
								<li><a
									href="index.do?page=${map.startPage-1 }&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}">
										<< </a></li>
							</c:if>
							<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
								<c:if test="${p == NoticeVO.page}">
									<li><a href='#;' class='current'>${p}</a></li>
								</c:if>
								<c:if test="${p != NoticeVO.page}">
									<li><a
										href='index.do?page=${p}&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}'>${p}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${map.next }">
								<li><a
									href="index.do?page=${map.endPage+1 }&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}">
										>> </a></li>
							</c:if>
						</ul>
					</div>

					<!-- 페이지처리 -->
					<div class="bbsSearch">
						<form method="get" name="searchForm" id="searchForm"
							action="index.do">
							<span class="srchSelect"> <select id="stype"
								name="searchType" class="dSelect" title="검색분류 선택">
									<option value="all">전체</option>
									<option value="title"
										<c:if test="${NoticeVO.searchType == 'title'}">selected</c:if>>제목</option>
									<option value="content"
										<c:if test="${NoticeVO.searchType == 'content'}">selected</c:if>>내용</option>
							</select>
							</span> 
							<span class="searchWord"> 
								<input type="text" id="sval" name="searchWord" value="${NoticeVO.searchWord}" title="검색어 입력">
								<input type="submit" id="" value="검색" title="검색">
							</span>
						</form>

					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</div>
</body>
</html>