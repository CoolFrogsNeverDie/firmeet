<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="${pageContext.request.contextPath}/assets/css/accountbookform.css" rel="stylesheet" type="text/css" />
    <!--모달-->
    
    <style type="text/css">
	.content-area {
	    width: 1070px;
	    height: 619px;
	    margin-left: 35px;
	    margin-bottom: 19px;
	    margin-top: 10px;
	}

	#preview{
	    max-width: 100%;
	    max-height: 90%;
	    margin: 0 auto;
	    border-radius: 10px;
	}
</style>
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
						<div class="account-content">
							<div class="content-left">
								<img id="preview" src="${pageContext.request.contextPath}/assets/images/accountimg/Previewimg.jpg" alt="미리보기 이미지">
							</div>
							<!--/content-left-->
							<div class="content-right">
								<form action="${pageContext.request.contextPath}/accountBook/upload" method="POST" enctype="multipart/form-data">
									<div class="form-group row">
										<label class="col-form-label" for="expense">지출/수입</label>
										<!--/지출/수입 -->
										<div class="d-flex justify-content-start">
											<label class="radio-label"> 
												<input type="radio" name="incomeExpense" value="지출" required> 지출
											</label> 
											<!--/지출 -->
											<label class="radio-label" style="margin-left: 10px;"> 
												<input type="radio" name="incomeExpense" value="수입" required> 수입
											</label>
											<!--/수입 -->
										</div>
										<!--/d-flex justify-content-start -->	
									</div>
									<!--/form-group row -->
									<div class="form-group">
										<label for="meetSelect">사용 모임:</label> 
										<select id="meetSelect" name="meet" class="form-select">
											<c:forEach var="meet" items="${meetList}" varStatus="status">
												<option value="${meet.meetNo}">${meet.meetName}</option>
											</c:forEach>
										</select>
										<!--/meetSelect -->
										<c:forEach var="meet" items="${meetList}" varStatus="status" begin="0" end="0">
											<input type="hidden" name="clubId" value="${meet.clubId}">
										</c:forEach>
										<!--/c:forEach -->
										<input type="hidden" name="memberId" value="${member.memberId}">
										<!--/memberId -->
									</div>
									<!--/form-group -->

									<div class="form-group">
										<label for="categorySelect">카테고리:</label> 
										<select id="categorySelect" name="category" class="form-select">
											<option value="식비">식비</option>
											<option value="유흥">유흥</option>
											<option value="비품">비품</option>
											<option value="시설">시설</option>
											<option value="이동비">이동비</option>
											<option value="의료">의료</option>
											<option value="기타">기타</option>
										</select>
										<!--/categorySelect -->
									</div>
									<!--/form-group -->
									<div class="form-group">
										<label for="amountInput">용도:</label> 
										<input type="text" id="amountInput" name="purpose" class="form-control">
									</div>
									<!--/용도 -->
									<div class="form-group">
										<label for="amountInput">금액:</label>
										<input type="text" id="amountInput" name="amount" class="form-control">
									</div>
									<!--/금액 -->
									<div class="form-group">
										<label class="form-text">이미지선택</label>
										<input id="file" type="file" name="uploadPicture" value="" onchange="previewImage(event)">
									</div>
									<!--/이미지선택 -->
									<button type="submit" class="btn btn-primary">저장</button>
								</form>
								<!--/form-->	
							</div>
							<!--/content-right-->	
						</div>
						<!--/account-content-->	
					</div>
					<!--/diary-body-->	
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
	//이미지 미리보기
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function() {
            var image = document.getElementById('preview');
            image.src = reader.result;
            image.style.display = 'block';
        }
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
</html>
