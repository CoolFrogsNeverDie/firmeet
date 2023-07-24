<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지 에디터</title>
    <%@ include file="../include/topnav.jsp" %>
</head>
<style>
    #list-container {
      max-height: 620px; /* 리스트 컨테이너의 최대 높이 지정 (스크롤을 가질 영역) */
      max-width: 1200px;
      overflow-y: auto; /* 세로 스크롤을 활성화하여 리스트 컨테이너를 넘어가는 항목들을 볼 수 있게 함 */
    }

    .list-item {
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }
    .table1000{
    	width:1000px;
    }
</style>
<body>

<!----------------------------------------- top Navigation ----------------------------------------->
<%@ include file="../include/nav.jsp" %>

    <!-- Page Content -->

    <div class="wrap">
      <div class="diary-area">
        <div class="diary-topbar">
          <img
            class="diary-topbar-img" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="프로필사진" />
          <h1>어푸어푸</h1>
        </div>
        <!--/diary-topbar-img-->
        <div class="diary-subbar">
          <h4 style="width: 50%">공지 게시판</h4>
             <div style="width:100%;">
        		<button type="button" id="noticewrite" style=" float: right;">글쓰기</button>
        	</div>
        </div>
        <!--/diary-subbar-->
        <div class="content-area"  id="list-container">
          <div class="content-left">
	<!-- 여기부터 -->
	
	<table class="table1000" border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>1/2</th>
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
				</c:choose>
				<td>${row.aboardDate }</td>
				<td>${row.aboardHit }</td>
				<td>${row.aboardVal }</td>
			</tr>
		</c:if>
	</c:forEach>
		
	</table>

	<!-- 여기까지 -->

            </div>
          <!--/content-left-->
        </div>
        <!--/content-area-->
      </div>
      <!--/diary-area-->
      <div class="menu-bar" >
        <div class="group-profile">
          <div class="group-profile-img-area">
            <img
              class="group-profile-img"
              src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg"
              alt="프로필사진"
            />
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