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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/board2_test.css" rel="stylesheet"  type="text/css" />
	<!-- summernote -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/summernote-ko-KR.js"></script>
<style>
#edit-close{
	height: 35px;
    width: 90px;
    border-radius: 10px;
    position: relative;
    background-color: white;
    display: flex;
    right: -440px;
    justify-content: center;
    align-items: center;
    border: 1px solid #1eafcc;
}
</style>
</head>


<body>

    <!-- // 상단 내비게이션 바 -->
<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
    <!-- 페이지 콘텐츠 -->
    <div class="wrap">
        <div class="diary-area" data-memid = "${member.memberId}" data-clubid ="${club.clubId}">
            <div class="diary-topbar">
                <img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/clubimg/${club.img2}"
                    alt="프로필사진" />
                <h1>${club.clubName}</h1>
                <div class= "board-edit">
             
             </div>
            </div>
            <!--/diary-topbar-img-->
          <form action = "${pageContext.request.contextPath}/board/club/upload" method = "POST"> 
                <input type ="hidden" value = "${member.memberId}" name ="memberId">
             	<input type ="hidden" value = "${club.clubId}" name ="clubId">
            <div class="diary-subbar">
                <button type ="submit" class="board-write">등록</button>
             	<a class="edit-close"  id ="edit-close"  href = "${pageContext.request.contextPath}/board/club/${club.clubId}">취소</a>
            </div>
            <!--/diary-subbar-->
            <div class="content-area">

                <div class="content-right">
                    <div class="board-area">
						<div class= "club-category">
						<!--
						<h4><strong>&#128221;&nbsp;&nbsp;자유게시판</strong></h4> 
						 -->
						</div>
                        <div class="board-area2" >
                          <textarea id="summernote" name="content"></textarea>
                        </div>
                    </div>
                    <!--board-area-->
                </div>
                <!--/content-right-->
            </div>
            <!--/content-area-->
          </form>
        </div>
        <!--/diary-area-->
<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
    <!--/wrap-->
</body>
<script>
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		 toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	        callbacks: {
	        	onImageUpload: function(files, editor){
	        		uploadSummernoteImageFile(files[0], this);
	        	}
	        },
		  height: 800,                 // 에디터 높이
		  minHeight: 565,             // 최소 높이
		  maxHeight: 565,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});

function uploadSummernoteImageFile(file, editor){
	console.log("파일업로드  <img src=>");
	
	data = new FormData(); 
	data.append("file",file); 
	
	console.log(file);
	console.log("gg"+editor);
	
	//ajax통신  -> 요청은 같은 기술 , 응답 이 데이터만 온다
	$.ajax({
		url : "${pageContext.request.contextPath }/"+${requestScope.clubId}+"/notice/upload",		
		type : "post",
		/* contentType : "application/json", */
		data : data, 
		contentType:false, 
        processData:false, 
		
		dataType : "json",
		success : function(jsonResult){
			/* 성공시 처리해야될 코드 작성 */
			if(jsonResult.data != null){
			     var imageUrl = '${pageContext.request.contextPath }/upload/' + jsonResult.data ;
			     var style = 'width: 25%';
			     
			     $img = $('<img>').attr({ src: imageUrl }).css("width", "25%")
                 $(editor).summernote('insertNode', $img[0]);
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}


</script>

</html>
