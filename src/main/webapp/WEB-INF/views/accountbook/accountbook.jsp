<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인 게시판</title>
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
   	<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css"> --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/accountbook.css" rel="stylesheet" type="text/css" />
    <!-- 라이브러리 추가 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
</head>
<body>
	<!-- 상단 내비게이션 바 -->
	<div class="ly-head-container">
		<header>
			<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
		</header>
	</div>
    <!-- // 상단 내비게이션 바 -->
    
    <!-- 중간 콘텐츠 -->
    <div class="ly-body-container ">
		<div class="main">
			<div class="main-content">
				<div class="diary-area" data-memid = "${member.memberId}" data-clubid ="${club.clubId}">
				
					<div class="diary-topbar">
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/clubimg/${club.img2}" alt="프로필사진" />
						<h2>${club.clubName}</h2>
						<div class= "search-board" style="display: none"> 
							<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
							<button type ="button" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
						</div>						
						
					</div>		
					<!-- //diary-topbar -->
					
					
					<div class="diary-body">					
						<div class="content-left">
							<div class="content-bnt">
								<!-- 날짜와 이름 검색폼 -->
								<form id="searchForm">
									<input type="date" id="startDate" name="startDate"><span style="margin-top: 10px; margin-right: 5px;">~</span><input type="date" id="endDate" name="endDate"> <input type="text" id="searchText" name="searchText" placeholder="검색어를 입력하세요." style="width: 160px;">
									<button class="searchbnt ct-color" type="submit">검색</button>
								</form>
								<!-- 수입 지출 총액 출력 -->
								<div>
									<input type="text" id="calculatorIncome" disabled> 
									<input type="text" id="calculatorExpense" disabled> 
									<input type="text" id="calculator" disabled>
								</div>
								<c:choose>
									<c:when test="${club.memlevel eq 0}">
										<button id="addButton" class="ct-color">+</button>
									</c:when>
								</c:choose>
								<!-- c:choose -->
							</div>
							<!-- content-bnt -->
							
							<!-- 가계부 내역을 표시하는 테이블 -->
							<div class="table">
								<div class="table-header">
									<div class="header_item">
										<a id="memberId" class="filter_link filter_link-number" href="#">결제자</a>
									</div>
									<!-- 결제자 -->
									<div class="header_item">
										<a id="dateTime" class="filter_link" href="#">일시</a>
									</div>
									<!-- 일시 -->
									<div class="header_item">
										<a id="purpose" class="filter_link" href="#">용도</a>
									</div>
									<!-- 용도 -->
									<div class="header_item">
										<a id="category" class="filter_link" href="#">수입/지출</a>
									</div>
									<!-- 수입/지출 -->
									<div class="header_item">
										<a id="income_expense" class="filter_link" href="#">카테고리</a>
									</div>
									<!-- 카테고리 -->
									<div class="header_item">
										<a id="amount" class="filter_link" href="#">금액</a>
									</div>
									<!-- 금액 -->
									<div class="header_item">
										<a id="meetNo" class="filter_link" href="#">모임명</a>
									</div>
									<!-- 모임명 -->
								</div>
								<!-- table-header -->
								<div class="table-content-wrapper">
									<!-- 가계부 내역을 표시하는 부분 -->
									<div class="table-content" id="target">
										<c:forEach var="account" items="${accountList}" varStatus="status">
											<!-- 가계부 각 항목을 표시하는 부분 -->
											<div class="table-row">
												<div class="table-data">${account.memberName}</div>
												<!-- 결제자 -->
												<div class="table-data">${account.datetime}</div>
												<!-- 일시 -->
												<div class="table-data">${account.purpose}</div>
												<!-- 용도 -->
												<div class="table-data incomeExpense">${account.incomeExpense}</div>
												<!-- 수입/지출 -->
												<div class="table-data">${account.category}</div>
												<!-- 카테고리 -->
												<div class="table-data account">
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${account.amount}" />원
												</div>
												<!-- 금액 -->
												<div class="table-data">${account.meetName}</div>
												<!-- 모임명 -->
												<c:choose>
													<c:when test="${!empty account.receipt}">
														<!-- 영수증 이미지를 표시하는 부분 -->
														<div class="content-img" style="display: none">
															<a class="example-image-link" href="${pageContext.request.contextPath}/assets/images/accountimg/${account.receipt}" data-lightbox="example-set"> <img class="example-image" src="${pageContext.request.contextPath}/assets/images/accountimg/${account.receipt}" alt="..." style="max-height: 500px;" />
															</a>
														</div>
													</c:when>
												</c:choose>
												<!-- c:choose -->
											</div>
										</c:forEach>
										<!-- c:forEach -->
									</div>									
									<!-- table-content -->
								</div>
								<!-- table-content-wrapper -->
							</div>
							<!-- table -->
						</div>
						<!-- content-left -->
					</div>
					<!-- diary-body -->				
				</div>
				<!--/diary-area-->	
			</div>
			<!-- //main-content -->
	
			<div class="side-menu">
				<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
			</div>
		</div>
		<!-- container -->
	</div>
    <!-- //중간 콘텐츠 -->
    
</body>
<script>
  $(document).ready(function () {
    // 클릭 이벤트 핸들러 함수 정의
    function toggleContentImage() {
      $(".table-row").on("click", function () {
        $(this).find(".content-img").toggle();
      });
    }

    // 초기에 페이지 로드될 때 이벤트 핸들러 바인딩
    toggleContentImage();

    // 계산 함수 정의
    function calculateTotalAmount() {
      console.log("계산 클릭");
      $("#calculator").val("");

      // 각각의 수입과 지출에 해당하는 데이터를 따로 저장
      var incomeTotal = 0;
      var expenseTotal = 0;
      var total =0;

      // accountList의 amount 값들을 더함
      $(".table-row").each(function () {
        var incomeExpenseText = $(this).find(".incomeExpense").text().trim();
        var amountText = $(this).find(".table-data.account").text().trim();
        console.log("incomeExpenseText" + incomeExpenseText);
        console.log("amountText" + amountText);
        // 쉼표(,) 제거
        var amountValue = parseInt(amountText.replace(/,/g, ""), 10);
        console.log("amountValue" + amountValue);
	      // 지출인 경우 +
	      if (incomeExpenseText === "지출") {
	        expenseTotal += amountValue;
	      }
	      // 수입인 경우 +
	      else if (incomeExpenseText === "수입") {
	        incomeTotal += amountValue;
	      }
	      total =incomeTotal-expenseTotal;
	      console.log("총액 : "+ total);
      });

      // 계산 결과를 #calculator에 출력
      var formattedIncomeTotal = new Intl.NumberFormat("ko-KR").format(incomeTotal);
      var formattedExpenseTotal = new Intl.NumberFormat("ko-KR").format(expenseTotal);
	  var formattedTotal = new Intl.NumberFormat("ko-KR").format(total);
	      $("#calculatorIncome").val("수입: " + formattedIncomeTotal + "원");
	      $("#calculatorExpense").val("지출: " + formattedExpenseTotal + "원");
	      $("#calculator").val("총액: " + formattedTotal + "원");
    }

    // 검색 폼 제출 시 AJAX 요청 처리
    $("#searchForm").submit(function (event) {
      event.preventDefault(); // 폼 제출 기본 동작 막기

      var path = window.location.pathname; // 현재 페이지의 경로
      var clubId = path.match(/\d+/)[0]; // 경로에서 숫자 값을 추출

      // AJAX 요청을 위한 데이터 준비
      var formData = {
        startDate: $("#startDate").val(),
        endDate: $("#endDate").val(),
        searchText: $("#searchText").val(),
      };

      // AJAX 요청
      $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/accountBook/search/" + clubId,
        data: formData,
        dataType: "json",
        success: function (response) {
          var searchResult = response; // 검색 결과 데이터
          var html = ""; // HTML 문자열

          // 검색 결과를 HTML로 변환
          for (var i = 0; i < searchResult.length; i++) {
            var account = searchResult[i];
            html += '<div class="table-row">';
            html += '<div class="table-data">' + account.memberName + "</div>";
            html += '<div class="table-data">' + account.datetime + "</div>";
            html += '<div class="table-data">' + account.purpose + "</div>";
            html +=
              '<div class="table-data incomeExpense">' +
              account.incomeExpense +
              "</div>";
            html += '<div class="table-data">' + account.category + "</div>";
            html +=
              '<div class="table-data account">' + account.amount + "원</div>";
            html += '<div class="table-data">' + account.meetName + "</div>";
            if(account.receipt !== null){
                html += '<div class="content-img" style="display: none">';
                html +=
                    '<a class="example-image-link" href="' +
                    "${pageContext.request.contextPath}/assets/images/galleryImg/" +
                    account.receipt +
                    '" data-lightbox="example-set" >';
                  html +=
                    '<img class="example-image" src="${pageContext.request.contextPath}/assets/images/accountimg/' +
                    account.receipt +
                    '" alt="가계부사진" style="max-height: 500px;" />';
                  html += "</a>";
                  html += "</div>";
            }
            html += "</div>";
          }

          $(".table-content").html(html); // 검색 결과를 표시할 영역에 HTML 삽입

          // 새로 추가된 요소에 대한 이벤트 핸들러 바인딩
          toggleContentImage();

          // 계산 함수 호출
          calculateTotalAmount();
        },
        error: function (xhr, status, error) {
          console.error(error);
        },
      });
    });

    // 계산 버튼 클릭 시 이벤트 핸들러 추가
    $(".searchbnt").click(function () {
      // 검색 폼 제출 시 AJAX 요청을 먼저 실행하여 검색 결과를 가져온 후 계산 로직을 실행합니다.
      $("#searchForm").submit();
    });
  });

  $(document).ready(function () {
      // 각각의 수입과 지출에 해당하는 데이터를 따로 저장
      var incomeTotal = 0;
      var expenseTotal = 0;
      var total =0;
    // accountList의 amount 값들을 더함
    $(".table-row").each(function () {
      var incomeExpenseText = $(this).find(".incomeExpense").text().trim();
      console.log(incomeExpenseText);
      var amountText = $(this).find(".table-data.account").text().trim();
      // 문자열에서 '원' 부분을 제거하고 숫자값만 추출하여 더함
      var amountValue = parseInt(
        amountText.replace("원", "").replace(/,/g, "")
      );
      // 지출인 경우 +
      if (incomeExpenseText === "지출") {
        expenseTotal += amountValue;
      }
      // 수입인 경우 +
      else if (incomeExpenseText === "수입") {
        incomeTotal += amountValue;
      }
      //수입-지출
      total =incomeTotal-expenseTotal;
      console.log("총액 : "+ total);
	});
	
	// 계산 결과를 #calculator에 출력
	var formattedIncomeTotal = new Intl.NumberFormat("ko-KR").format(incomeTotal);
	var formattedExpenseTotal = new Intl.NumberFormat("ko-KR").format(expenseTotal);
	var formattedTotal = new Intl.NumberFormat("ko-KR").format(total);
	      $("#calculatorIncome").val("수입: " + formattedIncomeTotal + "원");
	      $("#calculatorExpense").val("지출: " + formattedExpenseTotal + "원");
	      $("#calculator").val("총액: " + formattedTotal + "원");
  });
  $(document).ready(function () {
    $("#addButton").click(function () {
      var path = window.location.pathname; // 현재 페이지의 경로
      var clubId = path.match(/\d+/)[0]; // 경로에서 숫자 값을 추출
      window.location.href =
        "${pageContext.request.contextPath}/accountBook/uploadform/" + clubId;
    });
  });
</script>
</html>
