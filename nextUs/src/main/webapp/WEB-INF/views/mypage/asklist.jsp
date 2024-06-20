<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더푸터 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/contents.css" />
<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />
<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- MODALS -->

    <!-- BREADCRUMB -->
    <nav class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 fs-xs text-gray-400">
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="index.html">Home</a>
              </li>
              <li class="breadcrumb-item active">
                마이페이지
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

    <!-- CONTENT -->
    <section class="pt-7 pb-12">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">

            <!-- Heading -->
            <h3 class="mb-10">문의 내역</h3>

          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-3">

            <!-- Nav -->
            <nav class="mb-10 mb-md-0">
              <div class="list-group list-group-sm list-group-strong list-group-flush-x">
                <a class="list-group-item list-group-item-action dropend-toggle active" href="orderlist.do">
                  주문 내역
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="wishlist.do">
                  찜 목록
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="pinfo.do">
                  내 정보 수정
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="asklist.do">
                  문의 내역
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="couponlist.do">
                  보유 쿠폰
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle" href="#!">
                  회원 탈퇴
                </a>
              </div>
            </nav>

          </div>
          <div class="col-12 col-md-9 col-lg-8 offset-lg-1">
			
			<c:if test="${empty asklist.list }">
							<div>문의 내역이 없습니다.</div>
						</c:if>
						<c:forEach var="asklist" items="${asklist.list }">
							<tr>
								<!-- List group -->
								<ul class="list-group list-group-flush-x mb-9" id="faqCollapseParentOne">
									<li class="list-group-item">
										
										<!-- Toggle --> 
										<a class="dropdown-toggle d-block fs-lg fw-bold text-reset" data-bs-toggle="collapse" href="#faqCollapse${asklist.no}"> 
										Q. ${asklist.title } 
										 <c:choose>
										 	<c:when test="${asklist.answer == null}">
										 		<span style="font-size: 14px; color: red;">[답변 대기중]</span>
										 	</c:when>
					    					<c:otherwise>
					    						<span style="font-size: 14px; color: blue;">[답변 완료]</span>
					    					</c:otherwise>
					  					</c:choose></a>
										<br>
										<span style="font-size: 12px; color: gray;">작성일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${asklist.write_date }" />&emsp;카테고리: ${asklist.category }</span>
										<!-- Collapse -->
										<div class="collapse" id="faqCollapse${asklist.no}" data-bs-parent="#faqCollapseParentOne">
											<div class="mt-5">
												<p class="mb-0 fs-lg text-gray-500">
													${asklist.text }
												</p>
												<hr>
											</div>
											<c:choose>
										 		<c:when test="${asklist.answer == null}">
										 			<p class="mb-0 fs-lg text-500">
													</p>
										 		</c:when>
					    						<c:otherwise>
					    							<div class="mt-5">
														<span style="font-size: 12px; color: gray;">&emsp;답변일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${asklist.answer_date }" /></span>
														<br>
														<p class="mb-0 fs-lg text-500">
															&emsp;A. ${asklist.answer }
														</p>
											</div>
					    						</c:otherwise>
					  						</c:choose>
											
											
										</div>
									</li>
								</ul>
							</tr>
						</c:forEach>
						<div class="btnSet" style="text-align: right;">
						</div>
						
						<!-- 페이지 처리 -->
			            <nav class="d-flex justify-content-center mt-10">
			              <ul class="pagination pagination-sm text-gray-400">
			              	<c:if test="${asklist.prev }">
			                <li class="page-item">
			                  <a class="page-link page-link-arrow" href="asklist.do?page=${asklist.startPage-1 }&searchType=${AskListVO.searchType}&searchWord=${AskListVO.searchWord}">
			                    <i class="fa fa-caret-left"></i>
			                  </a>
			                </li>
			                </c:if>
			                
			                <c:forEach var="p" begin="${asklist.startPage}" end="${asklist.endPage}">
			                	<c:if test="${p == askListVO.page}">
				                <li class="page-item active">
				                  <a class="page-link" href="#">${p}</a>
				                </li>
				                </c:if>
								
								<c:if test="${p != askListVO.page}">
				                <li class="page-item">
				                  <a class="page-link" href="asklist.do?page=${p}&searchType=${AskListVO.searchType}&searchWord=${AskListVO.searchWord}">${p}</a>
				                </li>
				                </c:if>
				            </c:forEach>
			                
			                <c:if test="${asklist.next }">
			                <li class="page-item">
			                  <a class="page-link page-link-arrow" href="asklist.do?page=${asklist.endPage+1 }&searchType=${AskListVO.searchType}&searchWord=${AskListVO.searchWord}">
			                    <i class="fa fa-caret-right"></i>
			                  </a>
			                </li>
			                </c:if>
			              </ul>
			            </nav>
						
						
						<!-- 검색 기능 -->
						<div class="bbsSearch">
							<form method="get" name="searchForm" id="searchForm" action="asklist.do">
								<span class="srchSelect"> <select id="stype"
									name="searchType" class="dSelect" title="검색분류 선택">
										<option value="all">전체</option>
										<option value="title"
											<c:if test="${asklistVO.searchType == 'title'}">selected</c:if>>제목</option>
										<option value="text"
											<c:if test="${asklistVO.searchType == 'text'}">selected</c:if>>내용</option>
								</select>
								</span> <span class="searchWord"> <input type="text" id="sval"
									name="searchWord" value="${asklistVO.searchWord}" title="검색어 입력"><br>
									<input type="submit" id="" value="검색" title="검색">
								</span>
							</form>
						</div>
			
			
			
			
	

          </div>
        </div>
      </div>
    </section>
	
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
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