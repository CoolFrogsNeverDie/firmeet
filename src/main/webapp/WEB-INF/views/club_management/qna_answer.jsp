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
                <div class= "board-edit">
                 <div class= "search-board"> 
             	<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
             	<button type ="button" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
             </div>
             
             </div>
            </div>
            <!--/diary-topbar-img-->
            <div class="diary-subbar">
            	<div class= "manage-menu">
				<a href = "${pageContext.request.contextPath}/management/club/${club.clubId}">가입승인</a>
				<a href = "${pageContext.request.contextPath}/management/club/editgrade/${club.clubId}">권한설정</a>
				<a href = "${pageContext.request.contextPath}/management/club/qna/${club.clubId}">문의답변</a>
				<a href = "#">정보수정</a>
            	</div>
            </div>
            <!--/diary-subbar-->
            <div class="content-area admin-content">

                <div class="content-right">
                    <div class="board-area">
						<div class= "club-category">
						<!--
						<h4><strong>&#128221;&nbsp;&nbsp;자유게시판</strong></h4> 
						 -->
						</div>
                        <div class="list-area" >
                        	
                        	<!-- 반복될 곳 -->
                        	
                        	
             <div class= "mem-info qna-info" id = "c" >
			<div class= "mem-pic">
			<img class="diary-topbar-img11" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />
			</div>
			<div class= "mem-deinfo">
			<span><b>김세영</b> <strong>@seyoung2020</strong></span><br>
			<textarea class= "qna-content" readOnly>이런저런 이야기들</textarea><br>	
			</div>
			<div class= "qna-btns-area">
			<button type ="button" class= "answer-insert-btn" data-clubmemno= "">답변등록</button>
			</div>
			</div>
                        	
                        	

						
						
                        	<!-- 반복될 곳 -->
                        </div>
					  <div id = "board-get"></div>
                    </div>
                    <!--board-area-->
                </div>
                <!--/content-right-->
            </div>
            <!--/content-area-->
        </div>
        <!--/diary-area-->
<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
    <!--/wrap-->
    
 
        <!-- 모달창 -->
    	  <div class="modal fade" id="qna-modal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document" style="max-width: 900px;">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="imageModalLabel">답변하기</h5>
	        </div>
	        <div class="modal-body">
	          <!-- 이미지가 표시될 곳 -->
			  <div class= "qna-answer-area">
				<textarea class= "qna-answer"></textarea>
			  </div>
	          <!-- 수정 , 취소 버튼-->
	          <div class= "edit-modal-btn-area">
	          <button id="answer-insert-btn" class="btn">수정</button>
	          <button id="cancel-btn" class="btn">취소</button>
	          </div>
	          <span id="likeCount"></span>
	        </div>
	      </div>
	    </div>
	  </div>
    <!-- 모달창 -->
 
 
    
</body>

<script>
	

/* 무한 스크롤용 JS */
 
 
/*document load*/
 
 	//board 불러오기 위한 rownum 
	let startNum = 1;
	let endNum = 10;
	

	/*무한 스크롤 감지*/
	const lastBoard = $('#board-get');    
    const lastBoardObserver = new IntersectionObserver((entries) => {
        const lastEntry = entries[entries.length - 1];
        if (!lastEntry.isIntersecting) return;

        getData();

    });
	//감시하는 객체
    lastBoardObserver.observe(lastBoard[0]);

	


	
	
	//모달창 닫는 이벤트
	$('#cancel-btn').on("click", function(){
		$('#qna-modal').modal('hide');
	})
	
	$('.list-area').on("click",".answer-insert-btn",function(){
		$('#qna-modal').modal('show');
	});
	
	
	//가입요청한 유저 목록 볼 수 있는 
	function getData(){
		var clubId = $('.diary-area').data('clubid');
	
		var MemberVo = {
				clubId : clubId,
				startNum : startNum,
				endNum : endNum
		}
		
		console.log(MemberVo + '에이젝스로 넘어갈 값 확인' + clubId);
		 $.ajax({
		       
		       //요청 세팅
		       url : "${pageContext.request.contextPath}/management/club/qnalist",
		       type : "post",
		       data : MemberVo,
		       
		       //응답 세팅
		       dataType : "json",
		       success : function(jsonResult){
		    	   
		    	   var qnaList = jsonResult.data;
					console.log(qnaList);
					render(qnaList);
					startNum +=10;
					endNum += 10;
					
		       }, //success end
		       error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		       }
						            
		    });//ajax end
	}
	
	
	function render(qnaList){
		
		qnaList.forEach(function(qna) {

			var add = '';
			add +=  '<div class= "mem-info qna-info" id = "c' + qna.qnaNo  + '" + >'
			add += 	'	<div class= "mem-pic">'
			add +=			'<img class="diary-topbar-img11" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />'
			add +=     '</div>';
			add += '    		<div class= "mem-deinfo">';
			add += '				<span><b>'+  qna.memberName  +'</b> <strong>@'+ qna.memberId +'</strong></span><br>';
			add += '				<textarea class= "qna-content" readOnly>'+ qna.qnaContent+'</textarea><br>';		
			add	+= '    		</div>'
			add += '    <div class= "qna-btns-area">';
			add += '			<button type ="button" class= "answer-insert-btn" data-qnano = "'+ qna.qnaNo +'">답변등록</button>';
			add += '	</div>'
			add += '</div>'
			
			
			
			$('.list-area').append(add);
		});
	}
	
 
 	
</script>
</html>
