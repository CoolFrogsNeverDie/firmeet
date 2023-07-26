<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${club.clubName}갤러리</title>
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
	<%@ include file="../include/nav.jsp"%>

	<!-- 페이지 콘텐츠 -->
	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				<h1>${club.clubName}</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>&#128247 &nbsp;&nbsp; 갤러리</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-left">
					<dl id="meetList">
						<dt class="viewAll">
							<span></span>전체보기
						</dt>
						<c:forEach var="meet" items="${meetList}">
							<dt class="list">
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
						
						galleryList
						</div>
					</div>
					<!--gallery-area-->
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<c:import url="/WEB-INF/views/include/side_nav.jsp"></c:import>
		<!--/wrap-->
</body>
<footer> Copyright (C) 2023 어리쥬 all rights reserved. </footer>
<script src="${pageContext.request.contextPath}/assets/js/lightbox-plus-jquery.min.js"></script>
<script>
//갤러리 목록 조회
$('#meetList').on('click', 'dt.viewAll', function() {
  var clubId = ${club.clubId};
  console.log(clubId);

  $.ajax({
    url: "${pageContext.request.contextPath}/gallery/getGalleryListAll",
    method: "GET",
    data: {
      clubId: clubId
    },
    success: function(jsonResult) {
      var list = jsonResult.data;
      console.log(list);

      var galleryHTML = '';
      for (var i = 0; i < list.length; i++) {
        var imgSave = list[i].imgSave;
        console.log(imgSave);
        galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" data-lightbox="example-set">';
        galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" alt="" />';
        galleryHTML += '</a>';
      }

      $('.gallery-area div').html(galleryHTML);
    },
    error: function() {
      console.error("AJAX 요청 실패");
    }
  });
});

// 상위 요소인 <dl> 태그에 이벤트 리스너를 등록하여 <dd> 태그를 클릭했을 때 이벤트를 처리합니다.
$('dl').on('click', 'dd', function() {
  var meetNo = $(this).data('meetno');
  console.log(meetNo);

  $.ajax({
    url: "${pageContext.request.contextPath}/gallery/getGalleryList",
    method: "GET",
    data: {
      meetNo: meetNo
    },
    success: function(jsonResult) {
      var list = jsonResult.data;
      console.log(list);

      var galleryHTML = '';
      for (var i = 0; i < list.length; i++) {
        var imgSave = list[i].imgSave;
        console.log(imgSave);
        galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" data-lightbox="example-set">';
        galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" alt="" />';
        galleryHTML += '</a>';
      }

      $('.gallery-area div').html(galleryHTML);
    },
    error: function() {
      console.error("AJAX 요청 실패");
    }
  });
});

$(document).ready(function() {
  // 페이지가 로드되면, 각 dt에 대해 AJAX를 통해 dd를 가져와서 출력
  $("#meetList dt.list").each(function() {
    var $dt = $(this);
    var text = $dt.text().trim();
    var year = text.substring(0, 4);
    var month = text.substring(5, 7);
    console.log(year);
    console.log(month);

    $.ajax({
      url: "${pageContext.request.contextPath}/gallery/getMeetName",
      method: "GET",
      data: {
        year: year,
        month: month
      },
      success: function(jsonResult) {
        var list = jsonResult.data;
        console.log(list);
        for (var i = 0; i < list.length; i++) {
          var name = list[i].meetName;
          var meetNo = list[i].meetNo;
          $dt.after("<dd data-meetNo=" + meetNo + ">" + name + "</dd>");
        }
      },
      error: function() {
        console.error("AJAX 요청 실패");
      }
    });
  });
  var clubId = ${club.clubId};
  console.log(clubId);

  $.ajax({
    url: "${pageContext.request.contextPath}/gallery/getGalleryListAll",
    method: "GET",
    data: {
      clubId: clubId
    },
    success: function(jsonResult) {
      var list = jsonResult.data;
      console.log(list);

      var galleryHTML = '';
      for (var i = 0; i < list.length; i++) {
        var imgSave = list[i].imgSave;
        console.log(imgSave);
        galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" data-lightbox="example-set">';
        galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" alt="" />';
        galleryHTML += '</a>';
      }

      $('.gallery-area div').html(galleryHTML);
    },
    error: function() {
      console.error("AJAX 요청 실패");
    }
  });
});

$("#addButton").click(function() {
  var path = window.location.pathname;
  var clubId = path.match(/\d+/)[0];
  window.location.href = "${pageContext.request.contextPath}/gallery/uploadForm/" + clubId;
});

var $target = $("dt"), isClass = null;

$target.on("click", function() {
	var _$self = $(this), isActive = _$self.hasClass("active");

	_$self.toggleClass("active");
	_$self.nextUntil("dt").slideToggle(!isActive);
});

// 페이지가 로드되면, 전체보기
$(document)
        .ready(
                function() {
                 
                });
</script>

</html>
