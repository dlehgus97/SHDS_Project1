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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style type="text/css">
.custom-card {
  border: none;  /* 테두리 제거 */
  background: url('/resources/imgs/coupon.png') no-repeat center center;  /* 배경 이미지 */
  background-size: 130%;  /* 배경 이미지 크기 조정 */
  background-color: transparent;  /* 배경색 투명 */
}

.custom-card h6 {
  font-size: 1.5rem;  /* 제목 크기 */
  margin-top: 10px;
  margin-bottom: 8px;
  font-family: "Nanum Pen Script", cursive;
}

.custom-card p {
  font-size: 2.5rem;  /* 본문 크기 */
  text-align: right;
  padding-right: 60px;
  color: purple;  /* 텍스트 색상 보라색 */
  font-weight: bold;  /* 텍스트 굵게 */
}

</style>

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
            <h3 class="mb-10">보유 쿠폰</h3>

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
                <a class="list-group-item list-group-item-action dropend-toggle" href="withdrawal.do">
                  회원 탈퇴
                </a>
              </div>
            </nav>

          </div>

			<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
	            <div class="row">
	              	<c:if test="${empty couponlist }">
						<div>보유 쿠폰이 없습니다.</div>
					</c:if>
					
					<c:forEach var="coupon" items="${couponlist }">
					<div class="col-12 col-lg-6">
					<!-- 반복 시작 -->
	                <!-- Card -->
	                	<div class="card card-lg mb-8 custom-card">
		                  <div class="card-body">
		
		                    <!-- Heading -->
		                    <h6 class="mb-6">
		                      ${coupon.name }
		                    </h6>
		
		                    <!-- Text -->
		                    <p class="mb-0">
		                    	<c:choose>
								 	<c:when test="${coupon.type == 1}">
								 		${coupon.discount }원
								 	</c:when>
			    					<c:otherwise>
			    						${coupon.discount }%
			    					</c:otherwise>
			  					</c:choose>
		                    </p>
		
		                  </div>
	                	</div>
	                </div>
	                <!-- 반복 끝 -->
	                </c:forEach>
	
	              </div>
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