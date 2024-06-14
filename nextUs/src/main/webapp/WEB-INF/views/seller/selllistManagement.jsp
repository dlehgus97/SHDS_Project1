<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매글 관리</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <base href="${pageContext.request.contextPath}/">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .wrap {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .header, .footer {
            flex-shrink: 0;
        }

        .content {
            display: flex;
            flex-grow: 1;
        }

        .sidebar {
            width: 200px;
            min-width: 200px;
            background-color: #404040;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        .main-content {
            margin-left: 200px; /* 사이드바 너비 */
            padding: 20px;
            flex-grow: 1;
        }

        .profile-container {
            display: flex;
            align-items: center;
            padding: 20px;
            background-color: #e0e0e0;
            border-radius: 8px;
            max-width: 800px;
            margin: 50px auto;
        }

        .profile-picture {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-right: 20px;
        }

        .store-name {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-around;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: calc(40% - 40px); /* 한 줄에 두 개의 상품 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .product-card img {
            width: 100%;
            height: auto;
            max-height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
        }

        .product-details {
            padding: 10px;
            text-align: center;
        }

        .product-details h3 {
            font-size: 20px;
            margin: 10px 0;
            color: #333;
        }

        .product-details p {
            font-size: 16px;
            margin: 5px 0;
            color: #666;
        }
		.button-container {
		    margin-top: 10px;
		}

		.btn-edit, .btn-delete {
		    display: inline-block;
		    padding: 8px 20px;
		    border-radius: 30px; /* 알약 모양으로 설정 */
		    font-size: 16px;
		    text-align: center;
		    text-decoration: none;
		    transition: background-color 0.3s;
		    margin-right: 10px;
		}
		
		.btn-edit {
		    background-color: #007bff; /* 파란색 */
		    color: white !important;
		}
		
		.btn-delete {
		    background-color: #dc3545; /* 빨간색 */
		    color: white !important;
		}
		
		.btn-edit:hover, .btn-delete:hover {
		    background-color: #0056b3; /* 파란색 (더 진한) */
		}
		
		.btn-delete:hover {
		    background-color: #c82333; /* 빨간색 (더 진한) */
		}
		
    </style>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        
        <div class="content">
            <div class="sidebar">
                <a href="seller/sellerMain">메인 페이지</a>
                <a href="seller/selllistManagement">판매글 관리</a>
                <a href="seller/sellerReviews">리뷰 모음</a>
                <a href="seller/sellerEdit">셀러 정보 수정</a>
            </div>
            
            <div class="main-content">
                <h1>판매글 관리</h1>
                <div class="product-grid">
                    <c:forEach var="sellproduct" items="${sellList}">
                        <div class="product-card">
                            <img src="/profile-images/${sellproduct.thumbnail_real}" alt="상품 사진">
                            <div class="product-details">
                                <h3>${sellproduct.title}</h3>
                                <p>평균 별점: ${sellproduct.rating_avg}</p>
                                <p>리뷰 개수: ${sellproduct.review_cnt}</p>
                                <p>찜하기: ${sellproduct.like_count}</p>
                            </div>
                            <div class="button-container">
								<a href="" class="btn-edit">수정하기</a>
								<a href="" class="btn-delete">삭제하기</a>
							</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>

