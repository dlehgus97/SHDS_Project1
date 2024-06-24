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
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- HEADER -->
    <header class="py-13 jarallax" data-jarallax data-speed=".8" style="background-image: url(assets/img/covers/cover-31.jpg);">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Heading -->
            <h3 class="text-center text-white">Women's Clothing</h3>

            <!-- Breadcrumb -->
            <ol class="breadcrumb justify-content-center mb-0 text-center text-white fs-xs">
              <li class="breadcrumb-item">
                <a class="text-reset" href="#">Home</a>
              </li>
              <li class="breadcrumb-item active">
                Women's Clothing
              </li>
            </ol>

          </div>
        </div>
      </div>
    </header>
	
	<!-- FILTERS -->
    <section class="py-7 border-bottom">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 col-md">

            <!-- Categories -->
            <nav class="nav nav-overflow mb-6 mb-md-0">
              <a class="nav-link active" data-bs-toggle="tab" href="#">All</a>
              <a class="nav-link" data-bs-toggle="tab" href="#">Dresses</a>
              <a class="nav-link" data-bs-toggle="tab" href="#">Coats</a>
              <a class="nav-link" data-bs-toggle="tab" href="#">T-Shirts</a>
              <a class="nav-link" data-bs-toggle="tab" href="#">Jeans</a>
              <a class="nav-link" data-bs-toggle="tab" href="#">Jumpers</a>
            </nav>

          </div>
          <div class="col-12 col-md-auto text-center">

            <!-- Sort -->
            <div class="dropdown ms-6">

              <!-- Toggle -->
              <a class="dropdown-toggle text-body" data-bs-toggle="dropdown" href="#">Default</a>

              <!-- Menu -->
              <form class="dropdown-menu">
                <div class="card">
                  <div class="card-body">

                    <!-- Form group -->
                    <div class="form-group-overflow">
                      <div class="form-check form-check-text mb-3">
                        <input class="form-check-input" id="sortOne" name="sort" type="radio" value="Default">
                        <label class="form-check-label" for="sortOne">Default</label>
                      </div>
                      <div class="form-check form-check-text mb-3">
                        <input class="form-check-input" id="sortTwo" name="sort" type="radio" value="Newest">
                        <label class="form-check-label" for="sortTwo">Newest</label>
                      </div>
                      <div class="form-check form-check-text mb-3">
                        <input class="form-check-input" id="sortThree" name="sort" type="radio" value="Most Popular">
                        <label class="form-check-label" for="sortThree">Most Popular</label>
                      </div>
                      <div class="form-check form-check-text mb-3">
                        <input class="form-check-input" id="sortFour" name="sort" type="radio" value="Default Price">
                        <label class="form-check-label" for="sortFour">Default Price</label>
                      </div>
                      <div class="form-check form-check-text">
                        <input class="form-check-input" id="sortFive" name="sort" type="radio" value="Highest Price">
                        <label class="form-check-label" for="sortFive">Highest Price</label>
                      </div>
                    </div>

                  </div>
                </div>
              </form>
            </div>

          </div>
        </div>
      </div>
    </section>
	
	
	<!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        
      </div>
    </section>
    
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