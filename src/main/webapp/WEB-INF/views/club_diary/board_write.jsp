<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/topnav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인 게시판</title>
    <!-- 제이쿼리 -->
    <link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/board3.css" rel="stylesheet"  type="text/css" />
    <!--모달-->
</head>

<body>
    <!-- // 상단 내비게이션 바 -->
<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
    <!-- 페이지 콘텐츠 -->
    <div class="wrap">
        <div class="diary-area" data-memid = "${member.memberId}" data-clubid ="${club.clubId}">
            <div class="diary-topbar">
                <img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
                    alt="프로필사진" />
                <h1>${club.clubName}</h1>
            </div>
            <!--/diary-topbar-img-->
            <div class="diary-subbar">
                <h4>&#9997;&nbsp;&nbsp;${club.clubName} 자유 게시판</h4>
            </div>
            <!--/diary-subbar-->
            <div class="content-area">
             <form action = "${pageContext.request.contextPath}/board/club/upload" method = "POST"> 
             <div class= "search-board"> 
             	<input type ="text" value = "${member.memberId}" name ="memberId">
             	<input type ="text" value = "${club.clubId}" name ="clubId">
             	<button type ="submit" class="board-search-btn">등록</button>
             	<a class="edit-close" href = "${pageContext.request.contextPath}/board/club/${club.clubId}">취소</a>
             </div>
                <div class="content-right">
                    <div class="board-area">
      					    <textarea id="summernote" name="content"></textarea>
                    </div>
                    <!--board-area-->
                </div>
                <!--/content-right-->
                </form>
            </div>
            <!--/content-area-->
        </div>
        <!--/diary-area-->
<c:import url="/WEB-INF/views/include/side_nav.jsp"></c:import>
    <!--/wrap-->
</body>
    <footer>
    	Copyright (C) 2023 어리쥬 all rights reserved.
    </footer>
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
		  height: 300,                 // 에디터 높이
		  minHeight: 414,             // 최소 높이
		  maxHeight: 414,             // 최대 높이
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
