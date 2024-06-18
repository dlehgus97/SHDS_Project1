<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>셀러 정보 수정</title>
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
            margin-left: 150px;
			margin-right: 150px;
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
            justify-content: space-between;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: calc(40% - 10px); /* 한 줄에 두 개의 상품 */
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


		.edit-form {
        max-width: 600px;
        margin: 20px auto;
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        padding: 20px;
    	}

	    .edit-form label {
	        font-weight: bold;
	        margin-top: 10px;
	        display: block;
	    }
	
	    .edit-form input[type="text"],
	    .edit-form textarea {
	        width: 100%;
	        padding: 8px;
	        margin-top: 5px;
	        border: 1px solid #ddd;
	        border-radius: 4px;
	        box-sizing: border-box;
	        font-size: 16px;
	    }
	
	    .edit-form textarea {
	        height: 150px;
	        resize: vertical;
	    }
	
	    .button-container {
	        text-align: center;
	        margin-top: 20px;
	    }
	
	    .btn-submit, .btn-cancel {
	        display: inline-block;
	        padding: 10px 20px;
	        border-radius: 30px;
	        font-size: 16px;
	        text-align: center;
	        text-decoration: none;
	        transition: background-color 0.3s;
	        margin-right: 10px;
	    }
	
	    .btn-submit {
	        background-color: #28a745; /* 초록색 */
	        color: white;
	        border: none;
	    }
	
	    .btn-cancel {
	        background-color: #bdbdbd; /* 회색 */
	        color: white;
	        border: none;
	    }
	
	    .btn-submit:hover, .btn-cancel:hover {
	        opacity: 0.8;
	    }
	    
	    h1 {
            text-align: center;
            margin: 20px 0;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        
        <div class="content">
            <div class="sidebar">
                <a href="seller/sellerWeeklyMetrics">판매자 주간 지표</a>
                <a href="seller/sellerBuyList">거래 관리</a>
                <a href="seller/selllistManagement">판매글 관리</a>
                <a href="seller/sellerReviews">리뷰 관리</a>
                <a href="seller/sellerEdit">셀러 정보 수정</a>
            </div>
            <div class="main-content">
                <h1>셀러 정보 수정</h1>
			    <form action="/seller/update" method="post">
			        <div class="edit-form">
			    		<label for="info">설명</label>
			            <textarea id="info" name="info">${seller.info}</textarea>
			            
			            <label for="category1">카테고리 1</label>
			            <input type="text" id="category1" name="category1" value="${seller.category1}">
			            
			            <label for="category2">카테고리 2</label>
			            <input type="text" id="category2" name="category2" value="${seller.category2}">
			            
			            <label for="bank">은행</label>
			            <input type="text" id="bank" name="bank" value="${seller.bank}">
			            
			            <label for="account">계좌번호</label>
			            <input type="text" id="account" name="account" value="${seller.account}">
			            
			            <div class="button-container">
			                <button type="submit" class="btn-submit">확인</button>
			                <a href="seller/selllistManagement" class="btn-cancel">취소</a>
			            </div>
			        </div>
			    </form>
			</div>

        </div>

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>