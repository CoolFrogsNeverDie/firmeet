<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

	<div class= "menu-bar2" >
		<ul class= "side-bar2">
			<li id = "club-notice" class= "sd-color"><a href="${pageContext.request.contextPath}/${club.clubId}/notice/noticelist">공지사항</a></li>
			<li id = "club-gallery" class= "sd-color"><a href="${pageContext.request.contextPath }/gallery/list/${club.clubId}">갤러리</a></li>
			<li id = "club-calendar" class= "sd-color"><a href="${pageContext.request.contextPath }/calendar/club/${club.clubId}">달력</a></li>
			<li id = "club-board" class= "sd-color"><a href="${pageContext.request.contextPath }/board/club/${club.clubId}">자유 게시판</a></li>
			<li id = "club-member" class= "sd-color">멤버</li>
			<li id = "club-account" class= "sd-color"><a href="${pageContext.request.contextPath }/accountBook/main/${club.clubId}">가계부</a></li>
		</ul>
	</div>
    <!-- menu-bar2 -->
    <c:choose>
    	<c:when test="${club.memlevel eq 0}">
        	<a href  ="${pageContext.request.contextPath }/management/club/${club.clubId}"><button id="addButton" style="background-color: rgba(0,0,0,0); width: 80px;height: 50px;position: relative;right: 15px;top: -23px;font-size: xx-large;color: gray;"><i class="fa fa-cog ct-border" aria-hidden="true"></i></button></a>
    	</c:when>
	</c:choose>

