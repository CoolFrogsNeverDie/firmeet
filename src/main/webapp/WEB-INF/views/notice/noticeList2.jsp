<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지 에디터</title>
    <c:import url="/WEB-INF/views/include/topnav.jsp"></c:import>
    <link href="${pageContext.request.contextPath }/assets/css/noticestyle.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
</head>
<style>

    .list-item {
      padding: 10px;
      width: 100%;
      border-bottom: 1px solid #ccc;
    }
    .table1000{
    	width:960px;
    	margin-left: 20px;
    }
</style>
<body>

<!----------------------------------------- top Navigation ----------------------------------------->
<%@ include file="../include/nav.jsp" %>

    <!-- Page Content -->

    <div class="wrap">
      <div class="diary-area">
        <div class="diary-topbar">
         <img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/clubimg/${club.img2}" alt="프로필사진" />
          <h1>${club.clubName}</h1>
	      <form name="form1" method="post" action="${pageContext.request.contextPath }/${club.clubId }/notice/noticelist">
			  <div class="search-btn">
					<input name="keyword" id="keyword" value="${map.keyword }" placeholder="검색어를 입력하세요">
					<button type ="button" class="keyword-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
			  </div>
		  </form>
        </div>
        <!--/diary-topbar-img-->
        <div class="diary-subbar" style="border : none; margin-bottom: 20px;">
          <h4 style="width: 50%">공지 게시판</h4>
             <div style="width:100%;">
        		<button type="button" id="noticewrite">글쓰기</button>
        	</div>
        </div>
        <!--/diary-subbar-->
        <div class="content-area">
          <div class="content-left">
	<!-- 여기부터 -->
	<div id="list_body">
	<table class="table1000" border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
	<c:forEach var="row" items="${nlist }">
		<c:if test="${sessionScope.clubId == row.clubId }">
			<tr id="scroll" class="list-item">
				<td>${row.aboardNo }</td>
				<td>${row.memberId }</td>
				<c:choose>
					<c:when test="${row.aboardVal == 1 }">
						<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlist?aboardNo=${row.aboardNo}">${row.title }</a></td>
					</c:when>
					<c:when test="${row.aboardVal == 2 }">
						<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlistgroup?aboardNo=${row.aboardNo}">${row.title }</a></td>
					</c:when>
					<c:when test="${row.aboardVal == 3 }">
						<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlistgroupG?aboardNo=${row.aboardNo}">${row.title }</a></td>
					</c:when>
				</c:choose>
				<td>${row.aboardDate }</td>
				<td>${row.aboardHit }</td>
			</tr>
		</c:if>
	</c:forEach>
		
	</table>
</div>
	<!-- 여기까지 -->

            </div>
          <!--/content-left-->
        </div>
        <!--/content-area-->
      </div>
      <!--/diary-area-->
		<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
      <!--/menu-bar-->
    </div>
    <!--/wrap-->
</body>
<link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/assets/css/noticestyle.css" rel="stylesheet" type="text/css" />
<script>
$(document).ready(function() {
	
    $("#list-container").scroll(function () {
	    // 스크롤이 컨테이너의 하단에 도달하면 새로운 항목을 로드
      if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
        loadMoreItems();
      }
    });

	$('#noticewrite').click(function() {
		  window.location.href = '${pageContext.request.contextPath }/${clubId }/notice/noticeEditGeneral'	
	});
});
	
function loadMoreItems() {
  // 여기에서 서버에서 데이터를 가져오는 API 요청을 수행하거나 미리 준비한 항목들을 추가합니다.
  // 이 예제에서는 미리 준비한 항목을 추가합니다.
  for (let i = 1; i <= 5; i++) {
    $("#list-container").append('<tr id="scroll" class="list-item">');
    $("#list-container").append('<td>${row.aboardNo }</td>');
    $("#list-container").append('<td>${row.memberId }</td>');
    $("#list-container").append('<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlist?aboardNo=${row.aboardNo}">${row.title }</a></td>');
    $("#list-container").append('<td>${row.aboardDate }</td>');
    $("#list-container").append('<td>${row.aboardHit }</td>');
    $("#list-container").append('</tr>');
  }
}
</script>
</html>