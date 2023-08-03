<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${club.clubName}가계부</title>

<!-- 스크립트와 스타일시트 추가 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/accountbook.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!--모달-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- 라이브러리 추가 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
<style type="text/css">
a{
text-decoration: none;
  color: inherit;
}
a:hover{
  color: inherit;
  text-decoration: none;
}
</style>
</head>

<body>
	<!-- 상단 네비게이션 -->
	<%@ include file="../include/nav.jsp"%>

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/clubimg/${club.img2}" alt="프로필사진" />
				<h1>${club.clubName}</h1>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-left">
					<div class="content-bnt">
						<!-- 날짜와 용도 검색 폼 -->
						<form id="searchForm">
							<input type="date" id="startDate" name="startDate"><span style="margin-top: 10px;margin-right: 5px;">~</span><input type="date" id="endDate" name="endDate"> <input type="text" id="searchText" name="searchText" placeholder="검색어를 입력하세요." style="width: 160px;">
							<button class="searchbnt" type="submit">검색</button>
						</form>
						<!-- 수입 지출 총액 출력 -->
						<div>
							<input type="text" id="calculatorIncome"  readonly >
							<input type="text" id="calculatorExpense"  readonly >
							<input type="text" id="calculator"  readonly >
						</div>
						<c:choose>
							<c:when test="${club.memlevel eq 0}">
								<button id="addButton">+</button>
							</c:when>
						</c:choose>

					</div>
					<!-- 가계부 내역을 표시하는 테이블 -->
					<div class="table">
						<!-- 테이블 헤더 부분 -->
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
							<!-- 가계부 내역을 표시하는 부분 -->
							<div class="table-content" id="target">
								<c:forEach var="account" items="${accountList}" varStatus="status">
									<!-- 가계부 각 항목을 표시하는 부분 -->
									<div class="table-row">
										<div class="table-data">${account.memberName}</div>
										<div class="table-data">${account.datetime}</div>
										<div class="table-data">${account.purpose}</div>
										<div class="table-data incomeExpense">${account.incomeExpense}</div>
										<div class="table-data">${account.category}</div>
										<div class="table-data account">
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${account.amount}" />
											원
										</div>
										<div class="table-data">${account.meetName}</div>
										<c:choose>
											<c:when test="${!empty account.receipt}">
												<!-- 영수증 이미지를 표시하는 부분 -->
												<div class="content-img" style="display: none">
													<a class="example-image-link" href="${pageContext.request.contextPath}/assets/images/accountimg/${account.receipt}" data-lightbox="example-set"> <img class="example-image" src="${pageContext.request.contextPath}/assets/images/accountimg/${account.receipt}" alt="..." style="max-height: 500px;" />
													</a>
												</div>
											</c:when>
										</c:choose>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- JavaScript 파일을 로드하는 부분 -->
					<script src="${pageContext.request.contextPath}/assets/js/accountbook.js"></script>
				</div>
				<!--/content-left-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<!-- 사이드 네비게이션 바를 include하는 부분 -->
		<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
		<!--/wrap-->
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
