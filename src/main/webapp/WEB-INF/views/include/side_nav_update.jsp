<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

       <div class= "menu-bar2" >
			<ul class= "side-bar2">
				<li><a href="${pageContext.request.contextPath}/${club.clubId}/notice/noticelist">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath }/gallery/list/${club.clubId}">갤러리</a></li>
				<li><a href="${pageContext.request.contextPath }/calendar/club/${club.clubId}">달력</a></li>
				<li><a href="${pageContext.request.contextPath }/board/club/${club.clubId}">자유 게시판</a></li>
				<li>멤버</li>
				<li><a href="${pageContext.request.contextPath }/accountBook/main/${club.clubId}">가계부</a></li>
			</ul>
      </div>
        <!-- menu-bar -->
        <c:choose>
    <c:when test="${club.memlevel eq 0}">
        <a href  ="${pageContext.request.contextPath }/host/management"><button id="addButton" style="background-color: rgba(0,0,0,0); width: 80px;height: 50px;position: relative;right: 15px;top: 7px;font-size: xx-large;color: gray;"><i class="fa fa-cog" aria-hidden="true"></i></button></a>
    </c:when>
	</c:choose>
    </div>
    <!--/wrap-->

