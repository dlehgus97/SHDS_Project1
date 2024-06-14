<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샐러 제재 내역</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/simpleTable.css" />
<script src="../resources/js/admin/memberBanManagement.js"></script>
<style>
#report {
	color: purple;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="m_right">
			<div class="header">

				<h2>신고접수내역</h2>
			</div>
			<div class="bg-wh Ban_div">
				<table class="member_list">
					<colgroup>
						<col width="236px" />
						<col width="306px" />
						<col width="236px" />
						<col width="276px" />
						<col width="246px" />
					</colgroup>
					<thead>
						<tr>
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
									<td><button class="del_button" type="button">상세내용보기</button></td>
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
								href="report.do?page=${map.startPage-1 }&searchType=${ReportVO.searchType}&searchWord=${ReportVO.searchWord}">
									<< </a></li>
						</c:if>
						<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
							<c:if test="${p == ReportVO.page}">
								<li><a href='#;' class='current'>${p}</a></li>
							</c:if>
							<c:if test="${p != ReportVO.page}">
								<li><a
									href='report.do?page=${p}&searchType=${ReportVO.searchType}&searchWord=${ReportVO.searchWord}'>${p}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${map.next }">
							<li><a
								href="report.do?page=${map.endPage+1 }&searchType=${ReportVO.searchType}&searchWord=${ReportVO.searchWord}">
									>> </a></li>
						</c:if>
					</ul>
				</div>

			</div>
		</div>
</body>
</html>