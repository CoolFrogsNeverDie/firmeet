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
        <div class="content-area">
          <div class="content-left">
	<!-- 여기부터 -->
	
	<table border="1" width="1000px">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="row" items="${nlist }">
		<tr>
			<td>${row.aboardNo }</td>
			<td>${row.memberId }</td>
			<td><a href="${pageContext.request.contextPath }/notice/${clubId}/noticeEditGeneral?aboardNo=${row.aboardNo }"></a>${row.title }</td>
			<td>${row.aboardDate }</td>
			<td>${row.likeCnt }</td>
		</tr>
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
	$('#noticewrite').click(function() {
		  window.location.href = '${pageContext.request.contextPath }/${clubId }/notice/noticeEditGeneral'	
	});
});
</script>
</html>