<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매자 프로필 | NEXt Us</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <base href="${pageContext.request.contextPath}/">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            color: #333;
        }

        .profile-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            max-width: 800px;
            margin: 50px auto;
        }

        .profile-picture {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }

        .store-info {
            flex: 1;
            margin-left: 20px;
        }

        .store-name {
            font-size: 26px;
            font-weight: bold;
            color: #333;
        }

        .rating-container {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .average-rating, .count-rating {
            font-size: 18px;
            margin-right: 10px;
        }

        .profile {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
        }

        .profile p {
            margin: 10px 0;
        }

        .profile strong {
            font-size: 18px;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #555;
        }

        table {
            width: 80%;
            margin: 0 auto 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f4f4f4;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .profile-picture-small {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }

        .stars-outer {
            display: inline-block;
            position: relative;
            font-family: FontAwesome;
        }

        .stars-outer::before {
		    content: "\f005 \f005 \f005 \f005 \f005";
		    font-family: FontAwesome;
		    color: #ccc;
		    display: block;
		}

        .stars-inner {
            position: absolute;
            top: 0;
            left: 0;
            white-space: nowrap;
            overflow: hidden;
            width: 0;
            color: #f8ce0b;
        }

        .stars-inner::before {
		    content: "\f005 \f005 \f005 \f005 \f005";
		    font-family: FontAwesome;
		    display: block;
		}
    </style>
    <script>
        $(document).ready(function() {
            $('.stars-inner').each(function() {
                var rating = $(this).data('rating');
                var starPercentage = (rating / 5) * 100;
                $(this).css('width', starPercentage + '%');
            });
        });
    </script>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>

        <div class="profile-container">
            <img src="/profile-images/${seller.profile_real}" alt="프로필 사진" class="profile-picture">
            <div class="store-info">
                <div class="store-name">${seller.nickname}</div>
                <div class="rating-container">
                    <div class="average-rating">평균 별점: ${seller.rating_avg}</div>
                    <div class="count-rating">리뷰 수: ${seller.review_cnt}</div>
                </div>
            </div>
        </div>

        <div class="profile">
            <p><strong>전문가 한마디</strong><br>${seller.info}</p>
            <br>
            <p><strong>전문분야 1:</strong> ${seller.category1}</p>
            <p><strong>전문분야 2:</strong> ${seller.category2}</p>
        </div>

        <h1>서비스</h1>
        <table>
            <thead>
                <tr>
                    <th>상품 사진</th>
                    <th>상품 이름</th>
                    <th>상품 평균별점</th>
                    <th>상품 리뷰개수</th>
                    <th>찜하기</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sellproduct" items="${sellList}">
                    <tr>
                        <td><img src="/profile-images/${sellproduct.thumbnail_real}" alt="상품 사진" class="profile-picture-small"></td>
                        <td>${sellproduct.title}</td>
                        <td>${sellproduct.rating_avg}</td>
                        <td>${sellproduct.review_cnt}</td>
                        <td>${sellproduct.like_count}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h1>받은 리뷰</h1>
        <table>
            <thead>
                <tr>
                    <th>닉네임</th>
                    <th>평점</th>
                    <th>리뷰 제목</th>
                    <th>리뷰 내용</th>
                    <th>상품 제목</th>
                    <th>상품 사진</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="review" items="${sellerReviews}">
                    <tr>
                        <td>${review.nickname}</td>
                        <td>
                            <div class="stars-outer">
                                <div class="stars-inner" data-rating="${review.score}"></div>
                            </div>
                        </td>
                        <td>${review.title}</td>
                        <td>${review.text}</td>
                        <td>${review.productTitle}</td>
                        <td><img src="/profile-images/${review.thumbnail_real}" class="profile-picture-small"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>
