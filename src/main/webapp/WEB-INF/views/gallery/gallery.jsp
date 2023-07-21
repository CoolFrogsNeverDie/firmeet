<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>어푸어푸 갤러리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/gallery.css" rel="stylesheet" type="text/css" />
<!--모달-->
<style>
.gallery-img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.gallery-area .example-image {
	width: 185px;
	height: 185px;
	margin: 5px;
}
</style>
</head>

<body>
	<!-- top Navigation -->
	<%@ include file="../include/nav.jsp" %>
	
	<!-- 페이지 콘텐츠 -->
	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				<h1>어푸어푸</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>갤러리</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-left">
					<dl id="meetList">
						<c:forEach var="meet" items="${meetList}">
							<dt>
								<span></span>${meet.meetYear}년 ${meet.meetMon}월
							</dt>
						</c:forEach>
					</dl>
				</div>
				<!--/content-left-->
				<div class="content-right">
					<div class="content-bnt">
						<button id="addButton">사진올리기</button>
					</div>
					<div class="gallery-area">
						<div>

						</div>
					</div>
					<!--gallery-area-->
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
<footer> Copyright (C) 2023 어리쥬 all rights reserved. </footer>
<script src="${pageContext.request.contextPath}/assets/js/lightbox-plus-jquery.min.js"></script>

<script>
	$(document).ready(function() {
		// 페이지가 로드되면, 각 dt에 대해 AJAX를 통해 dd를 가져와서 출력
		$("#meetList dt").each(function() {
			var $dt = $(this);
			var text = $dt.text().trim(); // dt 태그 내용 가져오기
			var year = text.substring(0, 4); // 연도 추출
			var month = text.substring(5, 7); // 월 추출
			console.log(year);
			console.log(month);

			$.ajax({
				url : "${pageContext.request.contextPath}/gallery/getMeetName", // AJAX 요청을 처리할 URL (백엔드에서 처리해야 함)
				method : "GET", // GET 또는 POST, 필요에 따라 변경
				data : {
					year : year,
					month : month
				},
				success : function(jsonResult) {
					// AJAX 요청 성공 시, 응답 데이터를 사용하여 dd 출력
					var list = jsonResult.data 
					console.log(list);
					for (var i = 0; i < list.length; i++) {
						var name= list[i].meetName
						var meetNo= list[i].meetNo
						$dt.after("<dd data-meetNo ="+meetNo+" >" + name + "</dd>");
					}
				},
				error : function() {
					// AJAX 요청 실패 시, 오류 처리
					console.error("AJAX 요청 실패");
				}
			});
		});
	});
</script>
<script>
  // 상위 요소인 <dl> 태그에 이벤트 리스너를 등록하여 <dd> 태그를 클릭했을 때 이벤트를 처리합니다.
  $('dl').on('click', 'dd', function() {
    // data-meetNo 속성의 값을 가져오기
    var meetNo = $(this).data('meetno');
    
    // 가져온 meetNo 값이 제대로 출력되는지 확인 (이 부분은 실제로 서버로 전송할 때 사용하지 않습니다)
    console.log(meetNo);
    
    $.ajax({
      url: "${pageContext.request.contextPath}/gallery/getGalleryList", // AJAX 요청을 처리할 URL (백엔드에서 처리해야 함)
      method: "GET", // GET 또는 POST, 필요에 따라 변경
      data: {
        meetNo: meetNo
      },
      success: function(jsonResult) {
        // AJAX 요청 성공 시, 응답 데이터를 사용하여 dd 출력
        var list = jsonResult.data;
        console.log(list);
        
        // 갤러리 이미지 출력을 위한 변수
        var galleryHTML = '';
        for (var i = 0; i < list.length; i++) {
          var imgSave = list[i].imgSave;
          console.log(imgSave);
          // 이미지와 링크를 갤러리 변수에 추가
          galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" data-lightbox="example-set">';
          galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" alt="" />';
          galleryHTML += '</a>';
        }
        
        // 갤러리 영역에 이미지를 출력
        $('.gallery-area div').html(galleryHTML);
        
        // 추가적인 작업을 할 수 있습니다.
        // 예를 들어, 가져온 갤러리 이미지들을 다른 요소들에 추가하는 등의 동작을 수행할 수 있습니다.
      },
      error: function() {
        // AJAX 요청 실패 시, 오류 처리
        console.error("AJAX 요청 실패");
      }
    });
  });
</script>

<script>
	var $target = $("dt"), isClass = null;

	$target.on("click", function() {
		var _$self = $(this), isActive = _$self.hasClass("active");

		_$self.toggleClass("active");
		_$self.nextUntil("dt").slideToggle(!isActive);
	});
</script>

<script>
	$(document)
			.ready(
					function() {
						$("#addButton")
								.click(
										function() {
											var path = window.location.pathname; // 현재 페이지의 경로
											var clubId = path.match(/\d+/)[0]; // 경로에서 숫자 값을 추출
											window.location.href = "${pageContext.request.contextPath}/gallery/uploadForm/"
													+ clubId;
										});
					});
</script>
</html>
