<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/reset.css"/>
<link rel="stylesheet" href="/resources/css/contents.css"/>
<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />

<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
<script>
    function submitForm() {
      document.getElementById('searchForm').submit();
    }
</script>


<style>
	.bg-purple {background-color: #d3d3d3;}
    .section-bg-light-purple,
    .section-bg-light-purple * {
        background-color: #F8F8FF;
    }
</style>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- 카테고리 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-purple border-bottom">
      <div class="container">
    
        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
    
          <!-- 웹 -->
          <ul class="navbar-nav mx-auto">
            <li class="nav-item dropdown">
    
              <!-- Toggle -->
              <a class="nav-link fw-bold fs-6" data-bs-toggle="dropdown" href="#">웹</a>
    
              <!-- 홈페이지 -->
              <div class="dropdown-menu" style="margin-top: 24px;">
                <div class="card card-lg">
                  <div class="card-body">
                    <ul class="list-styled fs-sm">
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=5">- 홈페이지</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=6">- UI, 퍼블리싱</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=7">- 검색최적화</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=8">- 애널리틱스</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>
          </ul>
          
          <!-- 모바일 -->
          <ul class="navbar-nav mx-auto">
            <li class="nav-item dropdown">
    
              <!-- Toggle -->
              <a class="nav-link fw-bold fs-6" data-bs-toggle="dropdown" href="#">모바일</a>
    
              <!-- Menu -->
              <div class="dropdown-menu" style="margin-top: 24px;">
                <div class="card card-lg">
                  <div class="card-body">
                    <ul class="list-styled fs-sm">
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=9">- 안드로이드</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=10">- iOS</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=11">- 기타</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>
          </ul>
          
          <!-- 인공지능 -->
          <ul class="navbar-nav mx-auto">
            <li class="nav-item dropdown">
    
              <!-- Toggle -->
              <a class="nav-link fw-bold fs-6" data-bs-toggle="dropdown" href="#">인공지능</a>
    
              <!-- Menu -->
              <div class="dropdown-menu" style="margin-top: 24px;">
                <div class="card card-lg">
                  <div class="card-body">
                    <ul class="list-styled fs-sm">
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=12">- 생성형 AI</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=13">- 머신러닝, 딥러닝</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>
          </ul>
          
          <!-- Nav -->
          <ul class="navbar-nav mx-auto">
            <li class="nav-item dropdown">
    
              <!-- Toggle -->
              <a class="nav-link fw-bold fs-6" data-bs-toggle="dropdown" href="#">기타</a>
    
              <!-- Menu -->
              <div class="dropdown-menu" style="margin-top: 24px;">
                <div class="card card-lg">
                  <div class="card-body">
                    <ul class="list-styled fs-sm">
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=14">- 보안</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=15">- QA</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=16">- 기술지원</a>
                      </li>
                      <li class="list-styled-item">
                        <a class="list-styled-link" href="/selllist/index.do?categoryno=17">- 파일변환</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </li>
          </ul>
          
          
        </div>
      </div>
    </nav>
	
	
	<!-- HEADER -->
    <header class="py-13 jarallax" data-jarallax data-speed=".8" style="background-image: url(/resources/imgs/homepage.png);">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <!-- Heading -->
            <h2 class="text-center text-white">${categoryname}</h2>

          </div>
        </div>
      </div>
    </header>
	
    <!-- 실시간 인기 서비스 -->
	<section class="py-12">
		<div class="container">
			
			
			<!-- FILTERS -->
		    <!-- Form -->
        	<form class="navbar-form" method="get" name="searchForm" id="searchForm" action="/selllist/index.do">
		    
		    <section class="py-7 border-bottom">
		      <div class="container">
		        <div class="row align-items-center">
		          <div class="col-12 col-md" style="margin-top: 30px;">
					<!-- 검색창 -->
				    <div class="navbar navbar-boxed navbar-expand-md navbar-dark mb-7">
				      <div class="container">
				        <div class="flex-grow-1 position-relative">
				    
				            <div class="input-group">
				            	<!-- Input -->
				    			<input type="hidden" id="categoryno" name="categoryno" value="${vo.categoryno }">
				              	
				              	<input type="text" class="form-control form-control-lg" id="sval" name="searchWord" value="${sellListVO.searchWord}" 
				              	placeholder="Search for items and brands">
				              <!-- Button -->
				              <div class="input-group-append">
				                <button type="submit" class="btn btn-outline-border btn-lg">
				                  <img src="/resources/imgs/search.png" alt="Search Icon" height="20px" width="20px">
				                </button>
				              </div>
				    
				            </div>
					          
					        </div>
					      </div>
					    </div>
			          </div>
			          <div class="col-12 col-md-auto text-center">
						
			            <div class="col-12 col-md-auto">
		
		                <!-- 정렬기준 -->
		            	
	            			<select class="form-select form-select-xs" id="stype" name="searchType" class="dSelect" title="검색분류 선택" onchange="submitForm()">
                              <option value="like_cnt">인기순</option>
						      <option value="rating_avg" <c:if test="${sellListVO.searchType == 'rating_avg'}">selected</c:if>>평점순</option>
						      <option value="view_cnt" <c:if test="${sellListVO.searchType == 'view_cnt'}">selected</c:if>>조회수순</option>
						      <option value="review_cnt" <c:if test="${sellListVO.searchType == 'review_cnt'}">selected</c:if>>리뷰많은순</option>
						      <option value="postdate" <c:if test="${sellListVO.searchType == 'postdate'}">selected</c:if>>최신순</option>
                            </select>
			
			            </div>
			          </div>
			        </div>
			      </div>
			      
			    </section>
		    </form>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="topSellersTab">
					<div class="row">
						<c:forEach var="vo" items="${vo.list}">
							<!-- 반복 시작 -->
							<div class="col-6 col-md-4 col-lg-3 card-bg-light-purple">
								<!-- Card -->
								<div class="card mb-7">

									<!-- Badge -->
							        <c:choose>
									    <c:when test="${vo.view_cnt >= 1000}">
									        <div class="badge bg-white text-body card-badge card-badge-start text-uppercase">
									            조회수 1000+
									        </div>
									    </c:when>
									    <c:when test="${vo.review_cnt >= 100}">
									        <div class="badge bg-white text-body card-badge card-badge-start text-uppercase">
									            리뷰 100+
									        </div>
									    </c:when>
									</c:choose>

									

									<!-- Image -->
									<div class="card-img">

										<!-- Image -->
										<a class="card-img" href="/selllist/view.do?sellno=${vo.sellno }"> <img
											class="card-img-top card-img-front"
											src="/upload/thumbnail/${vo.thumbnail_real}"
											style="width: 90%; height: 250px; object-fit: cover;">
										</a>
									</div>

									<!-- Body -->
									<div class="card-body px-0">

										<!-- Category -->
										<div class="fs-xs">
											<a class="text-muted" href="/selllist/view.do?sellno=${vo.sellno }">
												<div class="col-auto">
							                    <div class="rating fs-xs text-dark" data-value="<fmt:formatNumber value="${vo.rating_avg}" type="number" maxFractionDigits="0" minFractionDigits="0" />">
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                      <div class="rating-item">
							                        <i class="fas fa-star"></i>
							                      </div>
							                    </div>
							
							                  </div>
											</a>
										</div>

										<!-- Title -->
										<div class="fw-bold">
											<a class="text-body" href="/selllist/view.do?sellno=${vo.sellno }"> ${vo.title } </a>
										</div>

										<!-- Price -->
										<div class="fw-bold text-muted"><fmt:formatNumber value="${vo.price}" type="number" groupingUsed="true" />원</div>

									</div>

								</div>

							</div>
							<!-- 반복 끝 -->
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 페이지 처리 -->
          <nav class="d-flex justify-content-center mt-10">
            <ul class="pagination pagination-sm text-gray-400">
            	<c:if test="${vo.prev }">
              <li class="page-item">
                <a class="page-link page-link-arrow" href="/selllist/index.do?categoryno=${vo.categoryno }&page=${vo.startPage-1 }&searchWord=${sellListVO.searchWord}&searchType=${sellListVO.searchType}">
                  <i class="fa fa-caret-left"></i>
                </a>
              </li>
              </c:if>
              
              <c:forEach var="p" begin="${vo.startPage}" end="${vo.endPage}">
              	<c:if test="${p == sellListVO.page}">
               <li class="page-item active">
                 <a class="page-link" href="#">${p}</a>
               </li>
               </c:if>
			
			<c:if test="${p != sellListVO.page}">
               <li class="page-item">
                 <a class="page-link" href="/selllist/index.do?categoryno=${vo.categoryno }&page=${p}&searchWord=${sellListVO.searchWord}&searchType=${sellListVO.searchType}">${p}</a>
               </li>
               </c:if>
           </c:forEach>
              
              <c:if test="${vo.next }">
              <li class="page-item">
                <a class="page-link page-link-arrow" href="/selllist/index.do?categoryno=${vo.categoryno }&page=${vo.endPage+1 }&searchWord=${sellListVO.searchWord}&searchType=${sellListVO.searchType}">
                  <i class="fa fa-caret-right"></i>
                </a>
              </li>
              </c:if>
            </ul>
          </nav>
	
	

    
    <!-- FOOTER -->
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