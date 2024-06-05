<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
		<div class="header">
            <div class="size">
                <div><a href="/index.do"></a></div>
                <div class="login">
                <c:if test="${empty login }">
                    <a href="/member/login.do">로그인</a> |
                    <a href="/member/regist.do">회원가입</a>
                </c:if>
                <c:if test="${!empty login }">
                     <a href="/member/logout.do">로그아웃</a> |
                    <a href="/member/edit.do">마이페이지</a>
                </c:if>
                </div>
            </div>
        </div>
        <div class="menu">
            <ul class="depth1">
                <li>
                    <a href="">고객센터</a>
                    <ul class="depth2">
                        <li><a href="">공지사항</a></li>
                        <li><a href="/reply/index.do">QnA</a></li>
                        <li><a href="">MENU5-3</a></li>
                    </ul>
                </li>
            </ul>
        </div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
