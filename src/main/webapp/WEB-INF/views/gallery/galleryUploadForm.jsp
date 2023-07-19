<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>어푸어푸 갤러리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--드래그 앤 드롭-->

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<style>
.drag-over { background-color: #ff0; }
.thumb { width:200px; padding:5px; float:left; }
.thumb > img { width:100%; }
.thumb > .close { position:absolute; background-color:red; cursor:pointer; }
</style>
</head>

<body>
	<!----------------------------------------- top Navigation ----------------------------------------->
	<nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img src="${pageContext.request.contextPath}/assets/images/logo/logo_b.png" alt="..." height="36" />
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#">링크</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 드롭다운 </a>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">액션</a></li>
							<li><a class="dropdown-item" href="#">다른 액션</a></li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li><a class="dropdown-item" href="#">다른 항목</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!----------------------------------------- // 상단 내비게이션 바 //----------------------------------------->
	<!-- 페이지 콘텐츠 -->

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				<h1>어푸어푸</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>다이어리 메인</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-right">
					<form action="${pageContext.request.contextPath}/gallery/upload/${meet.clubId}" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="meetSelect">사용 모임:</label>
							<select id="meetSelect" name="meet" class="form-select">
								<c:forEach var="meet" items="${meetList}" varStatus="status">
									<option value="${meet.meetNo}">${meet.meetName}</option>
								</c:forEach>
							</select>
						</div>
						<input type="button" id="btnSubmit" value="업로드"/>
						<div id="drop" style="border:1px solid black; width:800px; height:300px; padding:3px">
							여기로 drag & drop
							<div id="thumbnails">
							</div>
						</div>
						<c:forEach var="meet" items="${meetList}" varStatus="status" begin="0" end="0">
							<input type="hidden" name="clubId" value="${meet.clubId}">
						</c:forEach>
					</form>
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
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
	<footer> Copyright (C) 2023 어리쥬 </footer>
</body>
<script>
	var uploadFiles = [];
	var $drop = $("#drop");
	$drop.on("dragenter", function(e) {  //드래그 요소가 들어왔을떄
	  $(this).addClass('drag-over');
	}).on("dragleave", function(e) {  //드래그 요소가 나갔을때
	  $(this).removeClass('drag-over');
	}).on("dragover", function(e) {
	  e.stopPropagation();
	  e.preventDefault();
	}).on('drop', function(e) {  //드래그한 항목을 떨어뜨렸을때
	  e.preventDefault();
	  $(this).removeClass('drag-over');
	  var files = e.originalEvent.dataTransfer.files;  //드래그&드랍 항목
	  for(var i = 0; i < files.length; i++) {
		var file = files[i];
		var size = uploadFiles.push(file);  //업로드 목록에 추가
		preview(file, size - 1);  //미리보기 만들기
	  }  
	});
	function preview(file, idx) {
	  var reader = new FileReader();
	  reader.onload = (function(f, idx) {
		return function(e) {
		  var div = '<div class="thumb"> \
			<div class="close" data-idx="' + idx + '">X</div> \
			<img src="' + e.target.result + '" title="' + escape(f.name) + '"/> \
		  </div>';
		  $("#thumbnails").append(div);
		};
	  })(file, idx);
	  reader.readAsDataURL(file);
	}
	
	$("#btnSubmit").on("click", function() {
		  console.log("버튼클릭");
		  var formData = new FormData();
		  formData.append('meet', $('#meetSelect').val());
		  console.log($('#meetSelect').val());
		  var path = window.location.pathname; // 현재 페이지의 경로
		  var clubId = path.match(/\d+/)[0]; // 경로에서 숫자 값을 추출
		  console.log("업로드할 파일: " + clubId);
		  $.each(uploadFiles, function(i, file) {
		    if (file.upload != 'disable') {
		      formData.append('uploadPicture', file, file.name);
		      console.log("업로드할 파일: " + file.name);
		    }
		  });
		  $.ajax({
		    url: '${pageContext.request.contextPath}/gallery/upload/' + clubId,
		    data: formData,
		    type: 'post',
		    contentType: false,
		    processData: false,
		    success: function(ret) {
		      alert("완료");
		      window.location.href = "${pageContext.request.contextPath}/gallery/list/" + clubId;
		    }
		  });
		});


$("#thumbnails").on("click", ".close", function(e) {
  var $target = $(e.target);
  var idx = $target.attr('data-idx');
  uploadFiles[idx].upload = 'disable';
  $target.parent().remove();
});

</script>
</html>
