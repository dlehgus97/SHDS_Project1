<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매자 프로필</title>
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
            <img src="/upload/profile/${seller.profile_real}" alt="프로필 사진" class="profile-picture">
            <div class="store-info">
                <div class="store-name">${seller.nickname}</div>
                <div class="rating-container">
					<div class="average-rating">
                        <div class="stars-outer">
                            <div class="stars-inner" data-rating="${seller.rating_avg}"></div>
                        </div>
                    </div>
                    <div class="count-rating"><fmt:formatNumber value="${sellerRating.rating_avg}" type="number" maxFractionDigits="1" minFractionDigits="1" /> (${sellerRating.review_cnt})</div>
                </div>
            </div>
        </div>

        <div class="profile">
            <p><strong>전문가 한마디</strong><br>${seller.info}</p>
            <br>
	        <p><strong>전문분야</strong>
	        <br>
	            <c:choose>
	                <c:when test="${seller.category1 == 1}">웹</c:when>
	                <c:when test="${seller.category1 == 2}">모바일</c:when>
	                <c:when test="${seller.category1 == 3}">인공지능</c:when>
	                <c:when test="${seller.category1 == 4}">기타</c:when>
	                <c:when test="${seller.category1 == 5}">홈페이지</c:when>
	                <c:when test="${seller.category1 == 6}">UI, 퍼블리싱</c:when>
	                <c:when test="${seller.category1 == 7}">검색최적화</c:when>
	                <c:when test="${seller.category1 == 8}">애널리틱스</c:when>
	                <c:when test="${seller.category1 == 9}">안드로이드</c:when>
	                <c:when test="${seller.category1 == 10}">iOS</c:when>
	                <c:when test="${seller.category1 == 11}">기타</c:when>
	                <c:when test="${seller.category1 == 12}">생산형 AI</c:when>
	                <c:when test="${seller.category1 == 13}">머신러닝, 딥러닝</c:when>
	                <c:when test="${seller.category1 == 14}">보안</c:when>
	                <c:when test="${seller.category1 == 15}">QA</c:when>
	                <c:when test="${seller.category1 == 16}">기술지원</c:when>
	                <c:when test="${seller.category1 == 17}">파일변환</c:when>
	                <c:otherwise>알 수 없음</c:otherwise>
	            </c:choose>
				,
	            <c:choose>
	                <c:when test="${seller.category2 == 1}">웹</c:when>
	                <c:when test="${seller.category2 == 2}">모바일</c:when>
	                <c:when test="${seller.category2 == 3}">인공지능</c:when>
	                <c:when test="${seller.category2 == 4}">기타</c:when>
	                <c:when test="${seller.category2 == 5}">홈페이지</c:when>
	                <c:when test="${seller.category2 == 6}">UI, 퍼블리싱</c:when>
	                <c:when test="${seller.category2 == 7}">검색최적화</c:when>
	                <c:when test="${seller.category2 == 8}">애널리틱스</c:when>
	                <c:when test="${seller.category2 == 9}">안드로이드</c:when>
	                <c:when test="${seller.category2 == 10}">iOS</c:when>
	                <c:when test="${seller.category2 == 11}">기타</c:when>
	                <c:when test="${seller.category2 == 12}">생산형 AI</c:when>
	                <c:when test="${seller.category2 == 13}">머신러닝, 딥러닝</c:when>
	                <c:when test="${seller.category2 == 14}">보안</c:when>
	                <c:when test="${seller.category2 == 15}">QA</c:when>
	                <c:when test="${seller.category2 == 16}">기술지원</c:when>
	                <c:when test="${seller.category2 == 17}">파일변환</c:when>
	                <c:otherwise>알 수 없음</c:otherwise>
	            </c:choose>
	        </p>

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
                        <td><img src="/upload/thumbnail/${sellproduct.thumbnail_real}" alt="상품 사진" class="profile-picture-small"></td>
                        <td>${sellproduct.title}</td>
                        <td><span style="color: gold;">&#9733;</span> <fmt:formatNumber value="${sellproduct.rating_avg}" type="number" maxFractionDigits="1" minFractionDigits="1" /></td>
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
                        <td><img src="/upload/thumbnail/${review.thumbnail_real}" class="profile-picture-small"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>
