<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 제재 내역</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet"
	href="../resources/css/admin/simpleTable.css" />
<script src="../resources/js/admin/memberBanManagement.js"></script>
<style>
	#memberBanManagement{color:purple;}
	#memberStatus_M{color:purple;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="m_right">
			<div class="header">
			
				<h2>회원 제재 내역</h2>
				<button class="button1" onclick="openPopup(member); return false;">제재내역 추가</button>
			</div>
				<div class="bg-wh Ban_div">
				<table class="member_list">
						<colgroup>
							<col width="325px" />
							<col width="325px" />
							<col width="325px" />
							<col width="325px" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>이메일</th>
								<th>사유</th>
								<th>기간</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty map.list}">
							<tr>
								<td class="first" colspan="8">제재 내역이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty map.list }">
							<c:forEach var="vo" items="${map.list}">
									<tr>
										<td>${vo.no != null ? vo.no : '(미입력)'}</td>
										<td>${vo.email != null ? vo.email : '(미입력)'}</td>
										<td>${vo.content != null ? vo.content : '(미입력)'}</td>
										<td class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.date}" /></td>
	
									</tr>
								

							</c:forEach>
						</c:if>
						</tbody>
					</table>
					<!-- paging -->
                    <div class="pagenate">
                        <ul class='paging'>
                        <c:if test="${map.prev }">
                        	<li><a href="memberBanManagement.do?page=${map.startPage-1 }&searchType=${BanVO.searchType}&searchWord=${BanVO.searchWord}"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                        	<c:if test="${p == MemberVO.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != MemberVO.page}">
                            <li><a href='memberBanManagement.do?page=${p}&searchType=${BanVO.searchType}&searchWord=${BanVO.searchWord}'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${map.next }">
                        	<li><a href="memberBanManagement.do?page=${map.endPage+1 }&searchType=${BanVO.searchType}&searchWord=${BanVO.searchWord}"> >> </a></li>
                        </c:if>
                        </ul> 
                    </div>
				</div>

			
		</div>
	</div>

</body>
</html>