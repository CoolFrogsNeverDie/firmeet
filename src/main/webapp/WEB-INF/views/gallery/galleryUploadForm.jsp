<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${club.clubName}갤러리업로드</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/galleryUploadForm.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!--드래그 앤 드롭-->

<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.drag-over {
	background-color: #ff0;
}

.thumb {
	position: relative;
	width: 200px;
	padding: 5px;
	float: left;
}

.thumb>img {
	width: 100%;
}

.thumb>.close {
	position: absolute;
	top: 5px;
	background-color: red;
	cursor: pointer;
}

#btnSubmit {
	width: 150px;
	height: 50px;
	background-color: black;
	color: white;
	margin-top: 20px;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}
</style>
</head>

<body>
	<!-- top Navigation -->
	<%@ include file="../include/nav.jsp"%>
	<!----------------------------------------- // 상단 내비게이션 바 //----------------------------------------->
	<!-- 페이지 콘텐츠 -->

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				<h1>${club.clubName}</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>&#128248 &nbsp;&nbsp; 갤러리 업로드</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-left">
					<dl id="meetList">
							<dt>
								<span></span>${meet.meetYear}년 ${meet.meetMon}월 - ${meet.meetName}
							</dt>
					</dl>
				</div>
				<div class="content-right">
					<form action="${pageContext.request.contextPath}/gallery/upload/${meet.clubId}" method="POST" enctype="multipart/form-data" class="gallery-area">
						<div id="drop" style="border: 1px solid black; width: 100%; height: 300px; padding: 3px; margin-top: 10px; overflow: auto;" class="">
							여기로 drag & drop
							<div id="thumbnails"></div>
						</div>
						<input type="hidden" name="clubId" value="${meet.clubId}">
						<input type="hidden" id="memberId" value="${member.memberId}">
						<input type="button" id="btnSubmit" value="업로드" />
					</form>
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
		<!--/wrap-->
</body>
<script>
  var uploadFiles = [];
  var $drop = $("#drop");
  $drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
      $(this).addClass('drag-over');
  }).on("dragleave", function(e) { //드래그 요소가 나갔을때
      $(this).removeClass('drag-over');
  }).on("dragover", function(e) {
      e.stopPropagation();
      e.preventDefault();
  }).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
      e.preventDefault();
      $(this).removeClass('drag-over');
      var files = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
      for (var i = 0; i < files.length; i++) {
          var file = files[i];
          var size = uploadFiles.push(file); //업로드 목록에 추가
          preview(file, size - 1); //미리보기 만들기
      }
  });
  function preview(file, idx) {
      var reader = new FileReader();
      reader.onload = (function(f, idx) {
          return function(e) {
              var div = '<div class="thumb"> \
    <div class="close" data-idx="' + idx + '">X</div> \
    <img src="'
                      + e.target.result
                      + '" title="'
                      + escape(f.name)
                      + '"/> \
    </div>';
              $("#thumbnails").append(div);
          };
      })(file, idx);
      reader.readAsDataURL(file);
  }

  $("#btnSubmit").on("click", function() {
                      console.log("버튼클릭");
                      var formData = new FormData();
                      var meetNoValue = ${meet.meetNo};
                      console.log("선택한 meetNoValue: " + meetNoValue);

                      var memberId = $("#memberId").val();
                      console.log("선택한 memberId: " + memberId);

                      formData.append('memberId', memberId);
                      formData.append('meet', meetNoValue);
                      var path = window.location.pathname; // 현재 페이지의 경로
                      var clubId = path.match(/\d+/)[0]; // 경로에서 숫자 값을 추출
                      console.log("업로드할 파일: " + clubId);
                      $.each(uploadFiles, function(i, file) {
                          if (file.upload != 'disable') {
                              formData.append('uploadPicture', file,
                                      file.name);
                              console.log("업로드할 파일: " + file.name);
                          }
                      });
                      $.ajax({
                                  url : '${pageContext.request.contextPath}/gallery/upload/'+ clubId,
                                  data : formData,
                                  type : 'post',
                                  contentType : false,
                                  processData : false,
                                  success : function(ret) {
                                      alert("완료");
                                      window.location.href = "${pageContext.request.contextPath}/gallery/list/"+ clubId;
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
