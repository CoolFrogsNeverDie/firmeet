<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${club.clubName}갤러리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
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

/* 숨길 버튼을 hidden 클래스로 숨깁니다 */
.hidden {
	display: none;
}

dd {
	cursor: pointer;
}
 
#modalImage{
	width: 100%;
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
						<dt class="viewAll" style="cursor: pointer;">
							<span></span>전체보기
						</dt>
						<c:forEach var="meet" items="${meetList}">
							<dt class="list" style="cursor: pointer;">
								<span></span>${meet.meetYear}년 ${meet.meetMon}월
							</dt>
						</c:forEach>
					</dl>
				</div>
				<!--/content-left-->
				<div class="content-right">
					<div class="content-bnt">
						<button id="addButton" class="hidden">사진올리기</button>
					</div>
					<div class="gallery-area">
						<div></div>
					</div>
					<!--gallery-area-->
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
		<!--/wrap-->
		 <!-- 모달창 추가 -->
	  <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document" style="max-width: 900px;">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="imageModalLabel">이미지 상세 정보</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body">
	          <!-- 이미지가 표시될 곳 -->
	          <img id="modalImage" class="example-image" src="" alt="" />
	
	          <!-- 좋아요 버튼 -->
	          <button id="likeButton" class="btn btn-primary">좋아요</button>
	          <span id="likeCount"></span>
	        </div>
	      </div>
	    </div>
	  </div>
</body>
<script type="text/javascript" src=""></script>
<script>
  // 갤러리 목록 조회
  $('#meetList').on('click', 'dt.viewAll', function () {
    var clubId = ${club.clubId};
    console.log(clubId);

    $.ajax({
      url: "${pageContext.request.contextPath}/gallery/getGalleryListAll",
      method: "GET",
      data: {
        clubId: clubId
      },
      success: function (jsonResult) {
        var list = jsonResult.data;
        console.log(list);

        var galleryHTML = '';
        for (var i = 0; i < list.length; i++) {
            var imgSave = list[i].imgSave;
            var memberId = list[i].memberId;
            var imgNo = list[i].imgNo;
            var likeCnt = list[i].likeCnt;
            console.log(i+" imgSave : "+imgSave);
            console.log(i+" memberId : "+memberId);
            console.log(i+" imgNo : "+imgNo);
            console.log(i+" likeCnt : "+likeCnt);
            galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" data-lightbox="example-set" data-likeCnt="' + likeCnt + '" data-title="' + memberId + '" data-imgNo="' + imgNo + '">';
            galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" alt="" />';
            galleryHTML += '</a>';
        }

        $('.gallery-area div').html(galleryHTML);
      },
      error: function () {
        console.error("AJAX 요청 실패");
      }
    });
  });

  // 상위 요소인 <dl> 태그에 이벤트 리스너를 등록하여 <dd> 태그를 클릭했을 때 이벤트를 처리합니다.
  $('dl').on('click', 'dd', function () {
    var meetNo = $(this).data('meetno');
    console.log(meetNo);

    $.ajax({
      url: "${pageContext.request.contextPath}/gallery/getGalleryList",
      method: "GET",
      data: {
        meetNo: meetNo
      },
      success: function (jsonResult) {
        var list = jsonResult.data;
        console.log(list);

        var galleryHTML = '';
        for (var i = 0; i < list.length; i++) {
            var imgSave = list[i].imgSave;
            var memberId = list[i].memberId;
            var imgNo = list[i].imgNo;
            var likeCnt = list[i].likeCnt;
            console.log(i+" imgSave : "+imgSave);
            console.log(i+" memberId : "+memberId);
            console.log(i+" imgNo : "+imgNo);
            console.log(i+" likeCnt : "+likeCnt);
            galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" data-lightbox="example-set" data-likeCnt="' + likeCnt + '" data-title="' + memberId + '" data-imgNo="' + imgNo + '">';
            galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" alt="" />';
            galleryHTML += '</a>';
        }

        $('.gallery-area div').html(galleryHTML);
      },
      error: function () {
        console.error("AJAX 요청 실패");
      }
    });
  });

  // 페이지가 로드되면, 각 dt에 대해 AJAX를 통해 dd를 가져와서 출력
  $("#meetList dt.list").each(function () {
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
      success: function (jsonResult) {
        var list = jsonResult.data;
        console.log(list);
        for (var i = 0; i < list.length; i++) {
          var name = list[i].meetName;
          var meetNo = list[i].meetNo;
          $dt.after("<dd data-meetNo=" + meetNo + ">" + name + "</dd>");
        }
      },
      error: function () {
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
    success: function (jsonResult) {
      var list = jsonResult.data;
      console.log(list);

      var galleryHTML = '';
      for (var i = 0; i < list.length; i++) {
          var imgSave = list[i].imgSave;
          var memberId = list[i].memberId;
          var imgNo = list[i].imgNo;
          var likeCnt = list[i].likeCnt;
          console.log(i+" imgSave : "+imgSave);
          console.log(i+" memberId : "+memberId);
          console.log(i+" imgNo : "+imgNo);
          console.log(i+" likeCnt : "+likeCnt);
          galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" data-lightbox="example-set" data-likeCnt="' + likeCnt + '" data-title="' + memberId + '" data-imgno="' + imgNo + '">';
          galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/assets/images/galleryImg/' + imgSave + '" alt="" />';
          galleryHTML += '</a>';
      }

      $('.gallery-area div').html(galleryHTML);
    },
    error: function () {
      console.error("AJAX 요청 실패");
    }
  });

  var $target = $("dt"), isClass = null;

  $target.on("click", function () {
    var _$self = $(this), isActive = _$self.hasClass("active");

    _$self.toggleClass("active");
    _$self.nextUntil("dt").slideToggle(!isActive);
  });

  // 특정 <dd> 요소를 클릭하면 "사진올리기" 버튼을 보여줍니다.
  $('dl').on('click', 'dd', function () {
    var meetNo = $(this).data('meetno');
    console.log(meetNo);

    // "사진올리기" 버튼을 보여줍니다.
    $("#addButton").removeClass("hidden");

    // #addButton을 클릭할 때 meetNo 값을 URL에 추가하여 이동합니다.
    $("#addButton").click(function () {
      var path = window.location.pathname;
      var clubId = path.match(/\d+/)[0];
      window.location.href = "${pageContext.request.contextPath}/gallery/uploadForm/" + clubId + "?meetNo=" + meetNo;
    });

    // 특정 meetNo에 해당하는 갤러리 이미지를 불러오는 AJAX 요청 코드를 여기에 추가합니다...
  });
</script>
<!-- JavaScript 추가 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script>
  var imgSrc;
  var likeCnt;
  var memberId;
  var imgno;

  // 이미지 클릭 시 모달창 열기
  $(".gallery-area").on("click", ".example-image-link", function (e) {
    e.preventDefault(); // 이벤트 전파 차단
    var $imageLink = $(this);
    imgSrc = $imageLink.attr("href");
    likeCnt = $imageLink.data("likecnt");
    memberId = $imageLink.data("title");
    imgno = $imageLink.data("imgno");

    console.log(" imgSrc : " + imgSrc);
    console.log(" memberId : " + memberId);
    console.log(" imgNo : " + imgno);
    console.log(" likeCnt : " + likeCnt);
    // 모달창에 이미지와 좋아요 정보를 채웁니다.
    $("#modalImage").attr("src", imgSrc);
    $("#likeCount").text("좋아요 수: " + likeCnt);

    $.ajax({
      url: "${pageContext.request.contextPath}/gallery/checkLike",
      method: "POST",
      data: {
        imgno: imgno,
      },
      success: function (jsonResult) {
        var result = jsonResult.data;
        console.log(result);

        if (result) {
          $("#likeButton")
            .addClass("btn-success")
            .removeClass("btn-primary")
            .text("좋아요 취소");
        } else {
          $("#likeButton")
            .addClass("btn-primary")
            .removeClass("btn-success")
            .text("좋아요");
        }

        // 모달창 열기
        $("#imageModal").modal("show");
      },
      error: function () {
        console.error("AJAX 요청 실패");
      },
    });
  });

  // 좋아요 버튼 클릭 시 이벤트 처리
  $(document).on("click", ".btn-primary", function () {
    // 좋아요 기능 요청을 서버에 보냅니다. (AJAX 요청)
    console.log(".btn-primary 클릭"); // jsonResult 객체를 문자열로 변환하여 출력
    console.log(" imgNo : " + imgno);
    console.log(" likeCnt : " + likeCnt);
    $.ajax({
      url: "${pageContext.request.contextPath}/gallery/updateLike",
      method: "POST",
      data: {
        imgno: imgno,
        likeCnt: likeCnt,
      },
      success: function (jsonResult) {
        // 서버에서 좋아요 처리 성공 시, 좋아요 수를 업데이트합니다.
        console.log("jsonResult" + jsonResult.data);
        likeCnt = jsonResult.data; // 서버에서 업데이트된 좋아요 수를 받아옵니다.
        console.log("새로운" + likeCnt);
        $("#likeCount").text("좋아요 수: " + likeCnt);
        $("#likeButton")
          .addClass("btn-success")
          .removeClass("btn-primary")
          .text("좋아요 취소");
      },
      error: function () {
        console.error("AJAX 요청 실패");
      },
    });
  });

  // 좋아요취소 버튼 클릭 시 이벤트 처리
  $(document).on("click", ".btn-success", function () {
    // 좋아요취소 기능 요청을 서버에 보냅니다. (AJAX 요청)
    console.log(".btn-success 클릭"); // jsonResult 객체를 문자열로 변환하여 출력
    console.log(" imgNo : " + imgno);
    console.log(" likeCnt : " + likeCnt);
    $.ajax({
      url: "${pageContext.request.contextPath}/gallery/deleteLike",
      method: "POST",
      data: {
        imgno: imgno,
        likeCnt: likeCnt,
      },
      success: function (jsonResult) {
        // 서버에서 좋아요 처리 성공 시, 좋아요 수를 업데이트합니다.
        console.log("jsonResult" + jsonResult.data);
        likeCnt = jsonResult.data; // 서버에서 업데이트된 좋아요 수를 받아옵니다.
        console.log("새로운" + likeCnt);
        $("#likeCount").text("좋아요 수: " + likeCnt);
        $("#likeButton")
          .addClass("btn-primary")
          .removeClass("btn-success")
          .text("좋아요");
      },
      error: function () {
        console.error("AJAX 요청 실패");
      },
    });
  });
</script>


</html>
