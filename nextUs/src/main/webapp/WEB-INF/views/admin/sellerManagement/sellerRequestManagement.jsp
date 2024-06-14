<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샐러 등록 관리</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet"
	href="../resources/css/admin/sellerRegistManagement.css" />
<script src="../resources/js/admin/memberStatus.js"></script>
<script src="../resources/js/admin/sellerRegist.js"></script>
<style>
	#sellerRegistManagement{color:purple;}
	#sellerRegistManagement_M{color:purple;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>
	<div class="container">
		<div class="ad-menu">
			<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		</div>
		<div class="right">
			<div class="bg-wh seller_div">
				<h1 style="margin-left: 30px;margin-top: 10px;font-size:30px;">샐러 등록 요청</h1>
				<p class="NUM_1">&nbsp;${map.count}&nbsp;</p>
				<!-- 여기 미승인 건수 넣기 -->
				<p class="NUM_2">미승인 건수</p>
				<!-- form 수정필요 -->
				<form method="get" name="searchForm" id="searchForm" action="">
					<select name="searchType">
						<option value="all">전체</option>
						<option value="email">이메일</option>
						<option value="nickname">닉네임</option>
					</select>
					<input type="text" name="searchWord" />
					<input type="date" name="date1" id="date"> &nbsp; ~ &nbsp;
					<input type="date" name="date2" id="date"> <input type="submit" value="검색">
				</form>
				<br>
				&ensp;&ensp;&ensp;&ensp;
				<table class="sellerRegist_table">
					<colgroup>
						<col width="253px" />
						<col width="283px" />
						<col width="253px" />
						<col width="253px" />
						<col width="253px" />
					</colgroup>
					<thead>
						<tr>
							<th>회원번호</th>
							<th>이메일</th>
							<th>닉네임</th>
							<th>요청일자</th>
							<th>내용</th>
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
										<td>${vo.memberno != null ? vo.memberno : '(미입력)'}</td>
										<td>${vo.email != null ? vo.email : '(미입력)'}</td>
										<td>${vo.nickname != null ? vo.nickname : '(미입력)'}</td>
										<td class="date"><fmt:formatDate pattern="yyyy-MM-dd HH:MM" value="${vo.regdate}" /></td>
										<td>
											<button class="rev_button" type="button"onclick="openPopup(event); return false;">상세보기</button>
										</td>
									</tr>
								

							</c:forEach>
						</c:if>
					</tbody>
				</table>


				<!-- paging -->
                    <div class="pagenate">
                        <ul class='paging'>
                        <c:if test="${map.prev }">
                        	<li><a href="sellerRegistManagement.do?page=${map.startPage-1 }&searchType=${SellerRequestVO.searchType}&searchWord=${SellerRequestVO.searchWord}"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                        	<c:if test="${p == SellerRequestVO.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != SellerRequestVO.page}">
                            <li><a href='sellerRegistManagement.do?page=${p}&searchType=${SellerRequestVO.searchType}&searchWord=${SellerRequestVO.searchWord}'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${map.next }">
                        	<li><a href="sellerRegistManagement.do?page=${map.endPage+1 }&searchType=${SellerRequestVO.searchType}&searchWord=${SellerRequestVO.searchWord}"> >> </a></li>
                        </c:if>
                        </ul> 
                    </div>

			</div>
		</div>
	</div>
</body>
</html>