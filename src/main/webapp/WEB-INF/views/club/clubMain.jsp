<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>어푸어푸 메인</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/imgSlider.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/assets/css/clubMain.css" rel="stylesheet"  type="text/css"/>
<style>
</style>
</head>

<body>
	<!-- top Navigation -->
	<%@ include file="../include/nav.jsp" %>

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				<h1>어푸어푸</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>다이어리 메인</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-left">
					<div class="slider">
						<ul>
							<li class="item item1">1</li>
							<li class="item item2">2</li>
							<li class="item item3">3</li>
							<li class="item item4">4</li>
							<li class="item item5">5</li>
						</ul>
						<div class="p"></div>
						<div class="n"></div>
					</div>
				</div>
				<!--/content-left-->
				<div class="content-right">
					<div class="announcement">
						<table>
							<tr>
								<td class="title">[공지] 여과기 보수공사 관련 공지사항</td>
								<td>23–06-01</td>
							</tr>
							<tr>
								<td class="title">[공지] 올림픽스포츠센터 회원 대상 올림픽파..</td>
								<td>23–04-14</td>
							</tr>
							<tr>
								<td class="title">2023 여름방학특강 운영계획</td>
								<td>23–04-14</td>
							</tr>
							<tr>
								<td class="title">주차혼잡 안내문 (6.23~25)</td>
								<td>23–04-14</td>
							</tr>
							<tr>
								<td class="title">2023년 7월 회원등록안내</td>
								<td>23–04-14</td>
							</tr>
						</table>
					</div>
					<div class="calendar"></div>
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<div class="menu-bar" name="사이드메뉴바">
			<div class="group-profile">
				<div class="group-profile-img-area">
					<img class="group-profile-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				</div>
				<!--/group-profile-img-area-->
			</div>
			<!--/group-profile-->
			<ul class="side-nav">
				<li>공지사항</li>
				<li>갤러리</li>
				<li>달력</li>
				<li>자유 게시판</li>
				<li>멤버</li>
				<li>가계부</li>
			</ul>
			<!--/side-nav-->
		</div>
		<!--/menu-bar-->
	</div>
	<!--/wrap-->
</body>
<script src="${pageContext.request.contextPath}/assets/js/imgSlider.js"></script>
</html>
