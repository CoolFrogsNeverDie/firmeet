<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${club.clubName} 가계부</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/accountbook.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
<!--모달-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>

<body>
	<!-- top Navigation -->
	<%@ include file="../include/nav.jsp" %>

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				<h1>${club.clubName}</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>&#128221 &nbsp;&nbsp; 가계부</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-left">
					<div class="content-bnt">
						<!-- 날짜와 용도 검색 폼 -->
						<form id="searchForm">
							<input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate"> 
							<input type="text" id="searchText" name="searchText" placeholder="검색어를 입력하세요.">
							<button class ="searchbnt" type="submit">검색</button>
						</form>
						<button id="addButton" style="background-color: black; color: white; width: 100px; height: 50px; float: right;">+</button>
					</div>
					<!--/content-bnt-->
					<div class="table">
						<div class="table-header">
							<div class="header_item">
								<a id="memberId" class="filter_link filter_link-number" href="#">결제자</a>
							</div>
							<div class="header_item">
								<a id="dateTime" class="filter_link" href="#">일시</a>
							</div>
							<div class="header_item">
								<a id="purpose" class="filter_link" href="#">용도</a>
							</div>
							<div class="header_item">
								<a id="category" class="filter_link" href="#">수입/지출</a>
							</div>
							<div class="header_item">
								<a id="income_expense" class="filter_link" href="#">카테고리</a>
							</div>
							<div class="header_item">
								<a id="amount" class="filter_link" href="#">금액</a>
							</div>
							<div class="header_item">
								<a id="meetNo" class="filter_link" href="#">모임명</a>
							</div>
						</div>
						<div class="table-content-wrapper">
							<!-- 검색 결과를 표시할 영역 -->
							<div class="table-content" id="target">
								<c:forEach var="account" items="${accountList}" varStatus="status">
									<div class="table-row">
										<div class="table-data">${account.memberId}</div>
										<div class="table-data">${account.datetime}</div>
										<div class="table-data">${account.purpose}</div>
										<div class="table-data">${account.incomeExpense}</div>
										<div class="table-data">${account.category}</div>
										<div class="table-data">
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${account.amount}" />
											원
										</div>
										<div class="table-data">${account.meetNo}</div>
										<div class="content-img" style="display: none">
											<img src="${pageContext.request.contextPath}/assets/images/accountimg/${account.receipt}" alt="영수증 이미지가 없습니다!" style="max-height: 500px;" />
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!--/table-->
					<script type="text/javascript">
						// 클릭 이벤트 핸들러 함수 정의
						function toggleContentImage() {
							$(".table-row").on('click', function() {
								$(this).find(".content-img").toggle();
							});
						}

						// 초기에 페이지 로드될 때 이벤트 핸들러 바인딩
						toggleContentImage();

						// 검색 폼 제출 시 AJAX 요청 처리
						$("#searchForm").submit(function(event) {
							event.preventDefault(); // 폼 제출 기본 동작 막기

							var path = window.location.pathname; // 현재 페이지의 경로
							var clubId = path.match(/\d+/)[0]; // 경로에서 숫자 값을 추출

							// AJAX 요청을 위한 데이터 준비
							var formData = {
								startDate: $("#startDate").val(),
								endDate: $("#endDate").val(),
								searchText: $("#searchText").val()
							};

							// AJAX 요청
							$.ajax({
								type: "GET",
								url: "${pageContext.request.contextPath}/accountBook/search/" + clubId,
								data: formData,
								dataType: "json",
								success: function(response) {
									var searchResult = response; // 검색 결과 데이터
									var html = ""; // HTML 문자열

									// 검색 결과를 HTML로 변환
									for (var i = 0; i < searchResult.length; i++) {
										var account = searchResult[i];
										html += '<div class="table-row">';
										html += '<div class="table-data">' + account.memberId + '</div>';
										html += '<div class="table-data">' + account.datetime + '</div>';
										html += '<div class="table-data">' + account.purpose + '</div>';
										html += '<div class="table-data">' + account.incomeExpense + '</div>';
										html += '<div class="table-data">' + account.category + '</div>';
										html += '<div class="table-data">' + account.amount + '원</div>';
										html += '<div class="table-data">' + account.meetNo + '</div>';
										html += '<div class="content-img" style="display: none">';
										html += '<img src="${pageContext.request.contextPath}/assets/images/accountimg/' + account.receipt + '" alt="가계부사진" style="max-height: 500px;" />';
										html += '</div>';
										html += '</div>';
									}

									$(".table-content").html(html); // 검색 결과를 표시할 영역에 HTML 삽입

									// 새로 추가된 요소에 대한 이벤트 핸들러 바인딩
									toggleContentImage();
								},
								error: function(xhr, status, error) {
									console.error(error);
								}
							});
						});
					</script>
					<script src="${pageContext.request.contextPath}/assets/js/accountbook.js"></script>
				</div>
				<!--/content-left-->
			</div>
			<!--/content-area-->
		</div>
        <!--/diary-area-->
<c:import url="/WEB-INF/views/include/side_nav.jsp"></c:import>
    <!--/wrap-->
	<footer> Copyright (C) 2023 어리쥬 all rights reserved.</foo
	ter>
</body>
<script>
	$(document)
			.ready(
					function() {
						$("#addButton")
								.click(
										function() {
											var path = window.location.pathname; // 현재 페이지의 경로
											var clubId = path.match(/\d+/)[0]; // 경로에서 숫자 값을 추출
											window.location.href = "${pageContext.request.contextPath}/accountBook/uploadform/"
													+ clubId;
										});
					});
</script>
</html>
