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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet"  type="text/css" />
    <!--모달-->
</head>

<body>
  
    <!-- // 상단 내비게이션 바 -->
<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
    <!-- 페이지 콘텐츠 -->
    <div class="wrap">
        <div class="diary-area" data-memid = "${memberId}" data-clubid ="${clubId}">
        	<input type="text" value="${memberId}">
        	<input type="text" value="${clubId}">
            <div class="diary-topbar">
                <img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
                    alt="프로필사진" />
                <h1>나의 게시판</h1>
            </div>
            <!--/diary-topbar-img-->
            <div class="diary-subbar">
                <h4>&#9997;&nbsp;&nbsp;내가 쓴 게시판</h4>
            </div>
            <!--/diary-subbar-->
            <div class="content-area">
                <div class="content-left">
                    <dl>
                        <dt class="all-category"><span></span><a href = "${pageContext.request.contextPath}/board/member/${member.memberId}/-99">전체보기</a></dt>
                        <dt><span></span>가입한 동호회</dt>
                        <c:forEach items="${joinList}" var ="club">
                        <dd class= "join-club-list" data-clubid = "${club.clubId}"><a href = "${pageContext.request.contextPath}/board/member/${member.memberId}/${club.clubId}">-  ${club.clubName}</a></dd>
                        </c:forEach>
                    </dl>
                </div>
                <!--/content-left-->
                <div class="content-right">
                    <div class="board-area">
						<div class= "club-category"><h4><strong>&#128221;&nbsp;&nbsp;${category}</strong></h4></div>
                        <div class="board-area2" >
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
<c:import url="/WEB-INF/views/include/side_nav.jsp"></c:import>
    <!--/wrap-->
</body>
    <footer>
    	Copyright (C) 2023 어리쥬 all rights reserved.
    </footer>

<script>

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

	

    /*메뉴바 선택 */
    $("dt").on("click", function () {
        var _$self = $(this),
            isActive = _$self.hasClass("active");

        _$self.toggleClass("active");
        _$self.nextUntil("dt").slideToggle(!isActive);
    });
    
    /*댓글 쓰기 버튼 클릭 토글*/
    $('.board-area').on("click",'.write-comment-btn',function(){
    	 var writeCommentDiv = $(this).closest('.board-comment').find('.write-comment');
    	  if (writeCommentDiv.is(':visible')) {
    		    writeCommentDiv.hide();
    		  } else {
    		    writeCommentDiv.show();
    		  }
    });
	




    
 	//BoardList AJAX
 	function getData(){
 		 
 	 	var memberId = $('.diary-area').data('memid');
 	 	var clubId = $('.diary-area').data('clubid');
 	 	
 	 
 	 	var BoardVO = {
 	 		memberId : memberId,
 	 		clubId : clubId,
 	 		startNum : startNum,
 	 		endNum : endNum
 			}
 	 
 	 		console.log(BoardVO);
 	 	

 		 $.ajax({
 	       
 	       //요청 세팅
 	       url : "${pageContext.request.contextPath}/board/member/getboard",
 	       type : "post",
 	       data : BoardVO,
 	       
 	       //응답 세팅
 	       dataType : "json",
 	       success : function(jsonResult){
 				
 	    	   let boardList = jsonResult.data;
 	    	   console.log(boardList);
				
 	    		 render(boardList); 	    		   
 	    		 startNum +=10;
 	    		 endNum += 10;
 	    	   	
 	    	   
 	       }, //success end
 	       error : function(XHR, status, error) {
 	       console.error(status + " : " + error);
 	       }
 					            
 	    });//ajax end
 	 
 	}//get data end
 	
 	
 	//AJAX로 불러온 데이터 그려주는 function
	   function render(boardList){
 	   
        boardList.forEach(function(board) {
            var add = '';
            add += '<div class="board">';
            add += '<div class="board-header">';
            add += '<div class="profile-pic">';
            add += '<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />';
            add += '</div>';
            add += '<div class="board-info">';
            add += '<span class="board-group"><strong>' + board.clubName + '</strong></span><br>';
            add += '<span>작성일 : ' + board.boardDate + ' </span>';
            add += '</div></div>';
            add += '<div class="board-content">';
            add += '<p>' + board.content + '</p>';
            add += '<span class="likecolor">♡</span>';
            add += '<span>좋아요 (<span>' + board.likeCnt + '</span>)</span>';
            add += '</div><div class="board-comment-list">';
            add += '<div class="board-comment">';
            add += '<h5>댓글</h5><span><button class="write-comment-btn">댓글 쓰기</button></span>';
            
            board.replyList.forEach(function(reply) {
                add += '<div>';
                if (reply.deep > 1) {
                    add += '<span>  ↳ ' + reply.memberName + '님 : </span>';
                } else if (reply.deep === 1) {
                    add += '<span>' + reply.memberName + '님 : </span>';
                }
                add += '<span>' + reply.content + '</span>';
                if (reply.deep === 1) {
                    add += '<span><button>답글</button></span>';
                }
                add += '<div class="reply-edit">';
                add += '<span>' + reply.replyDate + '</span>';
                add += '<span>삭제</span><span>수정</span>';
                add += '</div></div>';
            });
            
            add += '<div class="write-comment">';
            add += '<div class="new-content"><textarea></textarea><button class="add-reply">등록</button></div>';
            add += '</div></div></div></div>';
            
            $('.board-area2').append(add);
        });
        
 	   }
	
 	
 	
</script>
</html>
