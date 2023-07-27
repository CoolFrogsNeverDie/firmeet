<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--/diary-area-->
<div class="menu-bar" name="사이드메뉴바">
	<div class="group-profile">
		<div class="group-profile-img-area">
			<img class="group-profile-img" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="프로필사진" />
		</div>
		<!--/group-profile-img-area-->
	</div>
	<!--/group-profile-->
	<ul class="side-nav">
		<li><a href="${pageContext.request.contextPath}/${club.clubId}/notice/noticelist">공지사항</a></li>
		<li><a href="${pageContext.request.contextPath }/gallery/list/${club.clubId}">갤러리</a></li>
		<li><a href="${pageContext.request.contextPath }/calendar/club/${club.clubId}">달력</a></li>
		<li><a href="${pageContext.request.contextPath }/board/club/${club.clubId}">자유 게시판</a></li>
		<li><a href="#">멤버</a></li>
		<li><a href="${pageContext.request.contextPath }/accountBook/main/${club.clubId}">가계부</a></li>
	</ul>
	<!--/side-nav-->
</div>
<!--/menu-bar-->
<c:choose>
    <c:when test="${club.memberId eq member.memberId}">
        <button id="addButton" style="background-color: #ffffff; width: 80px; height: 50px; position: absolute; right: 267px; top: 634px;"><i class="fa fa-cog" aria-hidden="true"></i></button>
    </c:when>
</c:choose>
</div>
<!--/wrap-->
</body>
</html>
