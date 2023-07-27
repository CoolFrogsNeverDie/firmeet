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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/board2.css" rel="stylesheet"  type="text/css" />
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
             <div class= "search-board"> 
             	<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
             	<button type ="button" class="board-search-btn">검색</button>
             	<a class= "board-write" href = "${pageContext.request.contextPath}/board/club/editpage/${club.clubId}">+</a>
             </div>
                <div class="content-right">
                    <div class="board-area">
						<div class= "club-category">
						<!--
						<h4><strong>&#128221;&nbsp;&nbsp;자유게시판</strong></h4> 
						 -->
						</div>
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
	

	
	
	/*댓글 삭제 이벤트*/
	$('.board-area').on("click", '.reply-delete', function(){

		var replyNo	 =	$(this).data('deletere');
		var deep	 =	$(this).data('deep');
		var memberId = $('.diary-area').data('memid');
		var replyEle = $('#c' + replyNo);
		var textarea = replyEle.find('span:eq(1)');
		
		var ReplyVO = {
				replyNo : replyNo,
				memberId : memberId,
				deep : deep
		}
		
		
		$.ajax({
		       
		       //요청 세팅
		       url : "${pageContext.request.contextPath}/board/member/deleteReply",
		       type : "post",
		       data : ReplyVO,
		       
		       //응답 세팅
		       dataType : "json",
		       success : function(jsonResult){
					
		    	   var data = jsonResult.data;
		    	   console.log(data);
		    	   //삭제했다는 거
		    	   if(data == true){
		    		   replyEle.remove();
		    	   }else{
		    		   textarea.text("삭제된 댓글입니다.")
		    	   }

		       }, //success end
		       error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		       }
						            
		    });//ajax end
		
		
	});
	
	
	
	/*답글 등록 버튼 클릭 이벤트*/
	$('.board-area').on("click",'.rreply-btn', function(){
		
		
		
	    var writeCommentDiv = $(this).closest('.write-comment2');
	    
		console.log('wth');	
		var replyEditDiv = $(this).closest('.reply-area');
		var groupNo = $(this).data('replyno');
		var boardNo = $(this).data('boardno');
		
		
		var tag = $(this).parent().siblings(".write-comment2").attr('class');
		console.log(tag);	
		if(tag == null){
			var	rreply = '';	
			
			rreply += '<div style ="width:762px; height:100px; margin-top:6px; " class="write-comment2" >';
			rreply += '    <div class="new-content2" style ="width: 90%; height: 80px; border: 1px solid black; float: left;">';
			rreply += '        <textarea class= "comment-content" style ="width:100%; height:100%; padding:10px;"></textarea><button class="add-reply2" data-boardno = "' + boardNo +'"  data-groupno ="' + groupNo +  '">등록</button></div>'
			rreply += '    </div>'
	 		rreply += '</div>'
	
			replyEditDiv.append(rreply);
		}else {
	    	$('.write-comment2').remove();
		} 
	
	});

	
	$('.board-area').on("click", ".add-reply2", function(){
		
		var textbox = $(this).prev();
		var content = textbox.val();
		var groupNo = $(this).data('groupno');
		var boardNo = $(this).data('boardno');
		var memberId = $('.diary-area').data('memid');
		var replyEditDiv = $(this).closest('.reply-area');
		
		console.log('teest' +  content + '그룹 번호 : ' +  groupNo + '게시글 번호 :' + boardNo + memberId);
		
		var ReplyVO = {
				boardNo : boardNo,
				memberId : memberId,
				content : content,
				replyGroup : groupNo
		}
		
		console.log(ReplyVO);
		

		 $.ajax({
	       
	       //요청 세팅
	       url : "${pageContext.request.contextPath}/board/member/addReply_2",
	       type : "post",
	       data : ReplyVO,
	       
	       //응답 세팅
	       dataType : "json",
	       success : function(jsonResult){
				
	    	   var data = jsonResult.data;
	    	   console.log(data);
	    	   
	    	   addReply(replyEditDiv, data);
	    	   $('.write-comment2').remove();
	    	   
	       }, //success end
	       error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	       }
					            
	    });//ajax end
		
		
		
	});
	
	
	
	/*댓글 등록 버튼 클릭 이벤트*/
	$('.board-area').on("click",'.add-reply', function(){
		
		var textbox = $(this).prev();
		var content = textbox.val();
		var boardNo = $(this).data('boardno');
		var memberId = $('.diary-area').data('memid');
	
		var ReplyVO = {
				boardNo : boardNo,
				content : content,
				memberId : memberId
		}
		
		if(content.length < 5){
			alert('댓글을 다섯글자 이상 입력해주세요.');
			return;
		}
		

		 $.ajax({
	       
	       //요청 세팅
	       url : "${pageContext.request.contextPath}/board/member/addReply",
	       type : "post",
	       data : ReplyVO,
	       
	       //응답 세팅
	       dataType : "json",
	       success : function(jsonResult){
				var reply = jsonResult.data;
				var addElement = $('#r' +reply.boardNo);
				addReply(addElement, reply);
				textbox.val("");
				
	       }, //success end
	       error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	       }
					            
	    });//ajax end
		
	});

function addReply(element, reply){
	
	var add ="";
    add += '<div  class="reply-area" id = "c'+reply.replyNo + '">';
    if (reply.deep > 1) {
        add += '<span><b>&nbsp;&nbsp;&nbsp;<span class="re">↳</span> ' + reply.memberName + '님 : </b></span>';
    } else if (reply.deep === 1) {
        add += '<span><b>' + reply.memberName + '님 : </b></span>';
    }
    add += '<span>' + reply.content + '</span>';
    if (reply.deep === 1) {
        add += '<span><button class= "rreply-btn" data-replyno ="' + reply.replyNo + '">답글</button></span>';
    }
    add += '<div class="reply-edit">';
    add += '<span>' + reply.replyDate + '</span>';
    add += '<span class="reply-delete" data-deletere ="'+ reply.replyNo +'"  data-deep = "'+reply.deep+'">&nbsp;삭제</span>';
    add += '</div></div>';
	
	element.append(add);
    
}


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
	

	$('.board-search-btn').on("click",function(){
		
 	 	var clubId = $('.diary-area').data('clubid');
 	 	var keyword = $('#search-keyword').val();
 	 	
		window.location.href = "${pageContext.request.contextPath}/board/club/" + clubId + "?keyword=" +keyword;
		
		
	});


    
 	//BoardList AJAX
 	function getData(){
 		 
 	 	var clubId = $('.diary-area').data('clubid');
		var memberId = $('.diary-area').data('memid');
 	 	var keyword = $('#search-keyword').val();
 	 	
 	 	console.log(keyword + "키춰드");

 	 	
 	 	var BoardVO = {
 	 		clubId : clubId,
 	 		startNum : startNum,
 	 		endNum : endNum,
 	 		keyword : keyword
 			}
 	 
 	 		console.log(BoardVO);
 	 	

 		 $.ajax({
 	       
 	       //요청 세팅
 	       url : "${pageContext.request.contextPath}/board/club/getboard",
 	       type : "post",
 	       data : BoardVO,
 	       
 	       //응답 세팅
 	       dataType : "json",
 	       success : function(jsonResult){
 				
 	    	   let boardList = jsonResult.data;
 	    	   console.log(boardList);
	    	   	
 	    	   if(boardList.length < 1){
 	    	   		alert('게시물이 없습니다.');
 	    	   	}
 	    	   	
 	    		 render(boardList,memberId); 	    		   
 	    		 startNum +=10;
 	    		 endNum += 10;
 	    	   	
 	    	   
 	       }, //success end
 	       error : function(XHR, status, error) {
 	       console.error(status + " : " + error);
 	       }
 					            
 	    });//ajax end
 	 
 	}//get data end
 	
 	$('.board-area').on("click",'.delete-board-a', function(event){
		
		if(!confirm('삭제하시겠습니까?')){
			event.preventDefault();
		}
 		
 	});
 	
 	
 	
 	//AJAX로 불러온 데이터 그려주는 function
	   function render(boardList,memberId){
 	   
 		
 		
        boardList.forEach(function(board) {
            var add = '';
            add += '<div class="board">';
            add += '<div class="board-header">';
            add += '<div class="profile-pic">';
            add += '<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />';
            add += '</div>';
            add += '<div class="board-info" data-boardno ="' + board.boardNo +  '">';
            add += '<span class="board-group"><strong>' + board.clubName + '</strong></span><br>';
            add += '<span>작성일 : ' + board.boardDate + ' </span>';
            add += '</div></div>';
            add += '<div class="board-content">';
            add += '<p>' + board.content + '</p>';
            add += '<span class="likecolor" data-bno = "'+board.boardNo + '">♡</span>';
            add += '<span>좋아요 (<span>' + board.likeCnt + '</span>)</span>';
            if(board.memberId == memberId){
            add += '<span class= "edit-board-spans">'
            add += '<a class="edit-board-a" href="${pageContext.request.contextPath}/board/club/editform?clubId=' + board.clubId + '&boardNo=' + board.boardNo + '">수정</a>';
            add += '<a class= "delete-board-a" href ="${pageContext.request.contextPath}/board/club/delete?clubId=' + board.clubId + '&boardNo=' + board.boardNo + '">삭제</a>'
            add += '</span>'
            }
            add += '</div><div class="board-comment-list">';
            add += '<div class="board-comment" >';
            add += '<h5>댓글</h5><span><button class="write-comment-btn">댓글 쓰기</button></span>';
            add +='<div class="comment-list" id = "r' + board.boardNo + '">'
            
            board.replyList.forEach(function(reply) {
                add += '<div class="reply-area" id = "c'+ reply.replyNo+'">';
                if (reply.deep > 1) {
                    add += '<span><b>&nbsp;&nbsp;&nbsp; <span class="re">↳</span> ' + reply.memberName + '님 : </b></span>';
                } else if (reply.deep === 1) {
                    add += '<span><b>' + reply.memberName + '님 : </b></span>';
                }
                add += '<span>' + reply.content + '</span>';
                if (reply.deep === 1 & reply.stat == 1) {
                    add += '<span><button class= "rreply-btn" data-boardno ="' + board.boardNo +  '"  data-replyno ="' + reply.replyNo + '">답글</button></span>';
                }
                add += '<div class="reply-edit">';
                add += '<span>' + reply.replyDate + '</span>';
                if(memberId == reply.memberId	& reply.stat == 1){
                add += '<span class="reply-delete" data-deletere ="'+ reply.replyNo +'"  data-deep = "'+reply.deep+'">&nbsp;삭제</span>';
                }
                add += '</div></div>';
            });
            add += '</div>'
            add += '<div class="write-comment">';
            add += '<div class="new-content"><textarea class= "comment-content"></textarea><button class="add-reply"  data-boardno ="' + board.boardNo +  '">등록</button></div>';
            add += '</div></div></div></div>';
            
            $('.board-area2').append(add);
        });
        
 	   }
	
 	
 	
</script>
</html>
