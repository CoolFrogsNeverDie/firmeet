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
    <link href="${pageContext.request.contextPath}/assets/css/gallery.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/color_code/color${club.colorType}.css" rel="stylesheet" type="text/css" />
    
    <!--모달-->
    <style type="text/css">
	    .error{
	        background: #f1f1f1;
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
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/upload/club/${club.img2}" alt="프로필사진" />
						<h2>${club.clubName}</h2>
  						
  						
						<div class= "search-board" style="display: none;"> 
							<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
							<button type ="button" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
						</div>						
						
					</div>		
					<!-- //diary-topbar -->
					
					<div class="diary-body">
						<div class="content-gallery">					
							<div class = "content-left">
								<dl id = "meetList">
									<dt class="viewAll">
										<span></span>전체보기
									</dt>
									<!-- //viewAll -->
									<c:forEach var="meet" items="${meetList}">
										<dt class="list">
											<span></span>${meet.meetYear}년 ${meet.meetMon}월
										</dt>
									</c:forEach>
									<!-- //c:forEach -->
								</dl>
								<!-- //meetList -->
							</div>
							<!-- //content-left -->
							<div class="content-right">
								<div class="content-bnt">
									<button id="addButton" class="hidden ct-color">사진올리기</button>
								</div>
								<!-- //content-bnt -->
								<div class="gallery-area">
									<div></div>
								</div>
								<!-- //gallery-area -->
							</div>
							<!-- //content-right -->
						</div>
						<!-- //content-gallery-->
					</div>
					<!-- //diary-body -->
				</div>
				<!--//diary-area-->	
			</div>
			<!-- //main-content -->
			
			<div class="side-menu">
				<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
			</div>
		</div>
		<!-- container -->
		<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document" style="max-width: 900px;transform: translate(-50%, -50%);">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="imageModalLabel">
							<img src="/firmeet/assets/images/icon/profile.png" style="width: 45px; border-radius: 20px;">
							<!-- 멤버 이름과 아이디를 보여주는 부분 -->
							<span id="memberName"></span> <span id="memberId"></span>
						</h5>
						<!-- //modal-header -->
					</div>
					<!-- //modal-header -->
					<div class="modal-body">
						<!-- 이미지가 표시될 곳 -->
						<img id="modalImage" class="example-image" src="" alt="" />
						<!-- 좋아요 버튼 -->
						<button id="likeButton" class="primary">♡</button>
						<span id="likeCount"></span>
						<!-- 삭제버튼 -->
						<input type="button" value="삭제" name="deleteImg" class="deleteImg">
					</div>
					<!-- //modal-body -->
				</div>
				<!-- //modal-content -->
			</div>
			<!-- //modal-dialog -->
		</div>
		<!-- //modal -->
	</div>
    <!-- //중간 콘텐츠 -->
</body>

<script>
	//갤러리 목록 조회
	$('#meetList').on('click', 'dt.viewAll', function () {
	    var clubId = ${club.clubId};
	    console.log(clubId);
	
	    $('.gallery-area div').empty();
	    $("dd").removeClass('selected');
	    $("#addButton").addClass("hidden");
	
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
	            if (list.length === 0) {
	                galleryHTML += '<div class= "error-page">';
	                galleryHTML += '	<div>';
	                galleryHTML += '		<img class="error-icon" src ="${pageContext.request.contextPath}/assets/images/icon/error.png">';
	                galleryHTML += '	</div>';
	                galleryHTML += '	<div class= "clear-div">';
	                galleryHTML += '	</div>';
	                galleryHTML += '	<div>';
	                galleryHTML += '		<span>';
	                galleryHTML += '		 	<b>존재하는 가입 요청이 없습니다!</b>';
	                galleryHTML += '		</span>';
	                galleryHTML += '	</div>';
	                galleryHTML += '</div>';
	               
	                $(".gallery-area").addClass('error');
	    			
	    			$('.gallery-area div').append(galleryHTML);
	            } else {
	                for (var i = 0; i < list.length; i++) {
	                    $(".gallery-area").removeClass('error');
	                    var imgSave = list[i].imgSave;
	                    var memberId = list[i].memberId;
	                    var imgNo = list[i].imgNo;
	                    var likeCnt = list[i].likeCnt;
	                    console.log(i + " imgSave : " + imgSave);
	                    console.log(i + " memberId : " + memberId);
	                    console.log(i + " imgNo : " + imgNo);
	                    console.log(i + " likeCnt : " + likeCnt);
	                    galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/upload/gallery/' + imgSave + '" data-lightbox="example-set" data-likeCnt="' + likeCnt + '" data-title="' + memberId + '" data-imgno="' + imgNo + '">';
	                    galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/upload/gallery/' + imgSave + '" alt="" />';
	                    galleryHTML += '</a>';
	                }
	
	                $('.gallery-area div').html(galleryHTML);
	            }
	            checkList();
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
	    $('.gallery-area div').empty();
	
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
	            if (list.length === 0) {
	                galleryHTML += '<div class= "error-page">';
	                galleryHTML += '	<div>';
	                galleryHTML += '		<img class="error-icon" src ="${pageContext.request.contextPath}/assets/images/icon/error.png">';
	                galleryHTML += '	</div>';
	                galleryHTML += '	<div class= "clear-div">';
	                galleryHTML += '	</div>';
	                galleryHTML += '	<div>';
	                galleryHTML += '		<span>';
	                galleryHTML += '		 	<b>존재하는 이미지가 없습니다!!!</b>';
	                galleryHTML += '		</span>';
	                galleryHTML += '	</div>';
	                galleryHTML += '</div>';
	    			
	                $(".gallery-area").addClass('error');
	             	
	    			$('.gallery-area div').append(galleryHTML);
	            } else {
	                for (var i = 0; i < list.length; i++) {
	                    $(".gallery-area").removeClass('error');
	                    
	                    var imgSave = list[i].imgSave;
	                    var memberId = list[i].memberId;
	                    var imgNo = list[i].imgNo;
	                    var likeCnt = list[i].likeCnt;
	                    console.log(i + " imgSave : " + imgSave);
	                    console.log(i + " memberId : " + memberId);
	                    console.log(i + " imgNo : " + imgNo);
	                    console.log(i + " likeCnt : " + likeCnt);
	                    galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/upload/gallery/' + imgSave + '" data-lightbox="example-set" data-likeCnt="' + likeCnt + '" data-title="' + memberId + '" data-imgno="' + imgNo + '">';
	                    galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/upload/gallery/' + imgSave + '" alt="" />';
	                    galleryHTML += '</a>';
	                }
	
	                $('.gallery-area div').html(galleryHTML);
	            }
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
	    var clubId = ${club.clubId};
	    console.log(year);
	    console.log(month);
	
	    $.ajax({
	        url: "${pageContext.request.contextPath}/gallery/getMeetName",
	        method: "GET",
	        data: {
	            year: year,
	            month: month
	            clubId: clubId
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
	        $('.gallery-area div').empty();
	
	        var galleryHTML = '';
	        if (list.length === 0) {
	            galleryHTML += '<div class= "error-page">';
	            galleryHTML += '	<div>';
	            galleryHTML += '		<img class="error-icon" src ="${pageContext.request.contextPath}/assets/images/icon/error.png">';
	            galleryHTML += '	</div>';
	            galleryHTML += '	<div class= "clear-div">';
	            galleryHTML += '	</div>';
	            galleryHTML += '	<div>';
	            galleryHTML += '		<span>';
	            galleryHTML += '		 	<b>존재하는 가입 요청이 없습니다!</b>';
	            galleryHTML += '		</span>';
	            galleryHTML += '	</div>';
	            galleryHTML += '</div>';
	            
	            $(".gallery-area").addClass('error');
				
				$('.gallery-area div').append(galleryHTML);
	        } else {
	            $(".gallery-area").removeClass('error');
	            
	            for (var i = 0; i < list.length; i++) {
	                var imgSave = list[i].imgSave;
	                var memberId = list[i].memberId;
	                var imgNo = list[i].imgNo;
	                var likeCnt = list[i].likeCnt;
	                console.log(i + " imgSave : " + imgSave);
	                console.log(i + " memberId : " + memberId);
	                console.log(i + " imgNo : " + imgNo);
	                console.log(i + " likeCnt : " + likeCnt);
	                galleryHTML += '<a class="example-image-link" href="' + '${pageContext.request.contextPath}/upload/gallery/' + imgSave + '" data-lightbox="example-set" data-likeCnt="' + likeCnt + '" data-title="' + memberId + '" data-imgno="' + imgNo + '">';
	                galleryHTML += '<img class="example-image" src="' + '${pageContext.request.contextPath}/upload/gallery/' + imgSave + '" alt="" />';
	                galleryHTML += '</a>';
	            }
	
	            $('.gallery-area div').html(galleryHTML);
	        }
	    },
	    error: function () {
	        console.error("AJAX 요청 실패");
	    }
	});
	
	var $target = $("dt"),
	    isClass = null;
	
	$target.on("click", function () {
	    var _$self = $(this),
	        isActive = _$self.hasClass("active");
	
	    _$self.toggleClass("active");
	    _$self.nextUntil("dt").slideToggle(!isActive);
	});
	
	$(document).ready(function () {
	    var selectedDD = null; // 선택된 dd 요소를 저장할 변수
	       
	    // 특정 <dd> 요소를 클릭하면 "사진올리기" 버튼을 보여줍니다.
	    $('dl').on('click', 'dd', function () {
	        var meetNo = $(this).data('meetno');
	        console.log(meetNo);
	
	        // 기존에 선택된 dd 요소가 있으면 클래스를 제거합니다.
	        if (selectedDD !== null) {
	            selectedDD.removeClass('selected');
	        }
	
	        // 선택된 dd 요소에 클래스를 추가하고 변수에 저장합니다.
	        selectedDD = $(this);
	        selectedDD.addClass('selected');
	
	        console.log(selectedDD);
	        // "사진올리기" 버튼을 보여줍니다.
	        $("#addButton").removeClass("hidden");
	
	        // #addButton을 클릭할 때 meetNo 값을 URL에 추가하여 이동합니다.
	        $("#addButton").click(function () {
	            var path = window.location.pathname;
	            var clubId = path.match(/\d+/)[0];
	            window.location.href = "${pageContext.request.contextPath}/gallery/uploadForm/" + clubId + "?meetNo=" + meetNo;
	        });
	    });
	});
	</script>
	
	<!-- 모달창 -->
	<script>
	//변수 선언
	var imgSrc;
	var likeCnt;
	var memberId;
	var imgno;
	var uid;
	
	// 이미지 클릭 시 모달창 열기
	$(".gallery-area").on("click", ".example-image-link", function (e) {
	  e.preventDefault(); // 이벤트 전파 차단
	  var $imageLink = $(this);
	  imgSrc = $imageLink.attr("href");
	  likeCnt = $imageLink.data("likecnt");
	  memberId = $imageLink.data("title");
	  imgno = $imageLink.data("imgno");
	  uid = '${member.memberId}';
	  
	  // 이미지 작성자와 현재 로그인된 사용자의 아이디를 비교하여 삭제 버튼 보이기/숨기기 처리
	  if (memberId != uid) {
	    $(".deleteImg").addClass("hidden");
	  }
	
	  // 모달창에 이미지와 좋아요 정보를 채웁니다.
	  $("#modalImage").attr("src", imgSrc);
	  $("#likeCount").text("좋아요 (" + likeCnt + ")");
	  $(".deleteImg").data("imgno", imgno);
	
	  // 이미지 작성자 정보를 서버에서 가져와 모달에 표시
	  $.ajax({
	    url: "${pageContext.request.contextPath}/gallery/checkmemberId",
	    method: "POST",
	    data: {
	      memberId: memberId,
	    },
	    success: function (jsonResult) {
	      var member = jsonResult.data;
	      var memberName = member.memberName;
	      var memberId = member.memberId;
	
	      // 모달 헤더의 타이틀에 작성자 정보 설정
	      $("#memberName").text(memberName);
	      $("#memberId").text("@" + memberId);
	    },
	    error: function () {
	      console.error("AJAX 요청 실패");
	    },
	  });
	
	  // 좋아요 여부 확인하여 모달 열기
	  $.ajax({
	    url: "${pageContext.request.contextPath}/gallery/checkLike",
	    method: "POST",
	    data: {
	      imgno: imgno,
	    },
	    success: function (jsonResult) {
	      var result = jsonResult.data;
	      console.log(result);
	
	      // 좋아요 여부에 따라 버튼 스타일 변경
	      if (result) {
	        $("#likeButton")
	          .addClass("success")
	          .removeClass("primary")
	          .text("♥");
	      } else {
	        $("#likeButton")
	          .addClass("primary")
	          .removeClass("success")
	          .text("♡");
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
	$(document).on("click", ".primary", function () {
	  // 좋아요 기능 요청을 서버에 보냅니다. (AJAX 요청)
	  console.log(".btn-primary 클릭");
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
	      $("#likeCount").text("좋아요 (" + likeCnt + ")");
	      $("#likeButton")
	        .addClass("success")
	        .removeClass("primary")
	        .text("♥");
	    },
	    error: function () {
	      console.error("AJAX 요청 실패");
	    },
	  });
	});
	
	// 좋아요 취소 버튼 클릭 시 이벤트 처리
	$(document).on("click", ".success", function () {
	  // 좋아요 취소 기능 요청을 서버에 보냅니다. (AJAX 요청)
	  console.log(".btn-success 클릭");
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
	      $("#likeCount").text("좋아요 (" + likeCnt + ")");
	      $("#likeButton")
	        .addClass("primary")
	        .removeClass("success")
	        .text("♡");
	    },
	    error: function () {
	      console.error("AJAX 요청 실패");
	    },
	  });
	});
	
	// 삭제 버튼을 클릭했을 때 실행되는 함수
	$("#imageModal").on("click", "input[name='deleteImg']", function () {
	  // data-img-number 속성의 값을 가져옴
	  var imageNumber = $(this).data("imgno");
	
	  // 이미지 번호를 사용하여 원하는 로직을 수행
	  console.log("이미지 번호: " + imageNumber);
	  // 예: 이미지 삭제 함수 호출 등
	
	  var path = window.location.pathname;
	  var clubId = path.match(/\d+/)[0];
	  window.location.href = "${pageContext.request.contextPath}/gallery/deleteImg/" + clubId + "?imgno=" + imageNumber;
	});
	
	

</script>

</html>
