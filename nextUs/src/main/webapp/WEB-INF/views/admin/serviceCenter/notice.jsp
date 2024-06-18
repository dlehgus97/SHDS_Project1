<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/serviceCenter.css" />
<style>
    #serviceCenter{color:purple;}
    #notice{color:purple;}
    
	/* 테이블 스타일 */
	table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	th, td {
	    padding: 10px;
	    text-align: left;
	    border-bottom: 1px solid #ddd;
	}
	
	th {
	    background-color: #f2f2f2;
	    text-align: center;
	}
	
	tr:hover {
	    background-color: #f5f5f5;
	}
	
	.title_notice {
	    font-size: 24px;
	}
	
	.button1 {
	    font-size: 16px;
	}
	
	.col-number {
		font-size : 20px;
	    text-align: right;
	    width: 10%;
	}
	
	.col-title {
		font-size : 20px;
	    text-align: center;
	    width: 60%;
	}
	
	.col-date {
		font-size : 20px;
	    text-align: left;
	    padding-left: 50px;
	    width: 30%;
	}
	.col-number2 {
	    text-align: right;
	    padding-right:20px;
	    width: 10%;
	}
	
	.col-title2 {
	    text-align: center;
	    width: 60%
	}
	.col-date2 {
	    text-align: left;
	    width: 20%;
	}
	.col-action {
	    text-align: center;
	    width: 10%;
	}
	.no_row{
		height : 50px;
	}
	.delete-button {
	    background-color: red;
	    color: white;
	    border: none;
	    padding: 5px 10px;
	    cursor: pointer;
	    border-radius: 3px;
	}
</style>
<script>
    function deleteNotice(noticeNo) {
        if (confirm('정말 삭제하시겠습니까?')) {
            window.location.href = 'deleteNotice.do?no=' + noticeNo;
        }
    }
</script>
</head>
<body>
	<div class="wrap">
		<div class="sub">
			<div class="size">
				<h3 class="sub_title">공지사항</h3>
				<button class="button1" onclick="location.href='/notice/register.do'; return false;">공지 등록</button>
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
										href="notice/adview.do?no=${vo.no}">${vo.title }</a></td>
									<td class="date"><fmt:formatDate value="${vo.writedate }"
											pattern="YYYY-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- 페이지처리 -->
					<div class="pagenate">
						<ul class='paging'>
							<c:if test="${map.prev }">
								<li><a
									href="notice.do?page=${map.startPage-1 }&searchType=${AdminVO.searchType}&searchWord=${AdminVO.searchWord}">
										<< </a></li>
							</c:if>
							<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
								<c:if test="${p == AdminVO.page}">
									<li><a href='#;' class='current'>${p}</a></li>
								</c:if>
								<c:if test="${p != AdminVO.page}">
									<li><a
										href='notice.do?page=${p}&searchType=${AdminVO.searchType}&searchWord=${AdminVO.searchWord}'>${p}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${map.next }">
								<li><a
									href="notice.do?page=${map.endPage+1 }&searchType=${AdminVO.searchType}&searchWord=${AdminVO.searchWord}">
										>> </a></li>
							</c:if>
						</ul>
					</div>

					<!-- 검색 -->
					<div class="bbsSearch">
						<form method="get" name="searchForm" id="searchForm"
							action="notice.do">
							<span class="srchSelect"> <select id="stype"
								name="searchType" class="dSelect" title="검색분류 선택">
									<option value="all">전체</option>
									<option value="title"
										<c:if test="${AdminVO.searchType == 'title'}">selected</c:if>>제목</option>
									<option value="content"
										<c:if test="${AdminVO.searchType == 'content'}">selected</c:if>>내용</option>
							</select>
							</span> 
							<span class="searchWord"> 
								<input type="text" id="sval" name="searchWord" value="${AdminVO.searchWord}" title="검색어 입력">
								<input type="submit" id="" value="검색" title="검색">
							</span>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>