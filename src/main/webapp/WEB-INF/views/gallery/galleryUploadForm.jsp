<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Firmeet</title>
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/galleryUploadForm.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/color_code/color${club.colorType}.css" rel="stylesheet" type="text/css" />
    <!--모달-->
    <style>
		#btnSubmit {
			width: 90px;
		    height: 45px;
		    background-color: #6d6d6d;
		    color: white;
		    margin-top: 20px;
		    position: absolute;
		    border-radius: 10px;
		    right: 0;
		}
		
		#drop {
			border: 1.5px solid #c7c8c9;
			width: 100%;
			height: 500px;
			padding: 10px;
			overflow: auto;
			border-radius: 10px;
			flex-direction: column;
		}
		
		#drop span {
			position: absolute;
			top: 48%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		
		#thumbnails {
			display: flex;
		}
		
		.hidden {
			display: none;
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
						<img class="diary-topbar-img" src="$${pageContext.request.contextPath}/upload/clubimg/${club.img1}" alt="프로필사진" />
						<h2>${club.clubName}</h2>
  						
  						
						<div class= "search-board" style="display: none;"> 
							<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
							<button type ="button" class="board-search-btn"><img class="diary-topbar-img" src="${pageContext.request.contextPath}/upload/clubimg/${club.img2}" alt="프로필사진" /></button>
						</div>						
						
					</div>		
					<!-- //diary-topbar -->
					
					
					<div class="diary-body">	
						<div class="content-gallery">
							<div class ="content-left">
								<dl id="meetList">
									<dt>
										<span></span>${meet.meetYear}년 ${meet.meetMon}월 - ${meet.meetName}
									</dt>
								</dl>
								<!-- meetList -->
							</div>
							<!-- content-left -->
							<div class ="content-right">
								<form action="${pageContext.request.contextPath}/gallery/upload/${meet.clubId}" method="POST" enctype="multipart/form-data" class="gallery-area">
									<div id="drop" class="">
										<span>사진을 드래그하여 올려주세요 ^^</span>
										<div id="thumbnails"></div>
									</div>
									<input type="hidden" name="clubId" value="${meet.clubId}">
									<input type="hidden" id="memberId" value="${member.memberId}">
									<input type="button" id="btnSubmit" class="ct-color" value="업로드" />
									<!-- drop -->
								</form>
								<!-- form -->
							</div>
						</div>
						<!-- content-gallery -->
					</div>
					<!-- //diary-body -->
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
	var uploadFiles = [];
	var $drop = $("#drop");
	
	$drop.on("dragenter", function (e) {
	    // 드래그 요소가 들어왔을 때
	    $(this).addClass('drag-over');
	    $("#drop span").addClass('hidden');
	}).on("dragleave", function (e) {
	    // 드래그 요소가 나갔을 때
	    $(this).removeClass('drag-over');
	}).on("dragover", function (e) {
	    e.stopPropagation();
	    e.preventDefault();
	}).on('drop', function (e) {
	    // 드래그한 항목을 떨어뜨렸을 때
	    e.preventDefault();
	    $(this).removeClass('drag-over');
	    var files = e.originalEvent.dataTransfer.files; // 드래그&드랍 항목
	    for (var i = 0; i < files.length; i++) {
	        var file = files[i];
	        var size = uploadFiles.push(file); // 업로드 목록에 추가
	        preview(file, size - 1); // 미리보기 만들기
	    }
	});

	function preview(file, idx) {
	    var reader = new FileReader();
	    reader.onload = (function (f, idx) {
	        return function (e) {
	            var div = '<div class="thumb"> \
	                <div class="close" data-idx="' + idx + '">X</div> \
	                <img src="' + e.target.result + '" title="' + escape(f.name) + '"/> \
	                </div>';
	            $("#thumbnails").append(div);
	        };
	    })(file, idx);
	    reader.readAsDataURL(file);
	}
	
	$("#btnSubmit").on("click", function () {
	    console.log("버튼 클릭");
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
	
	    $.each(uploadFiles, function (i, file) {
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
	        success: function (ret) {
	            alert("완료");
	            window.location.href = "${pageContext.request.contextPath}/gallery/list/" + clubId;
	        }
	    });
	});
	
	$("#thumbnails").on("click", ".close", function (e) {
	    var $target = $(e.target);
	    var idx = $target.attr('data-idx');
	    uploadFiles[idx].upload = 'disable';
	    $target.parent().remove();
	});

</script>

</html>
