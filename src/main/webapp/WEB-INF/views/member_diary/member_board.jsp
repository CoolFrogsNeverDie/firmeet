<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/topnav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>어푸어푸 갤러리</title>
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

    <!-- 페이지 콘텐츠 -->
    <div class="wrap">
        <div class="diary-area">
            <div class="diary-topbar">
                <img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
                    alt="프로필사진" />
                <h1>나의 다이어리</h1>
            </div>
            <!--/diary-topbar-img-->
            <div class="diary-subbar">
                <h4>&#9997;&nbsp;&nbsp;내가 쓴 게시판</h4>
            </div>
            <!--/diary-subbar-->
            <div class="content-area">
                <div class="content-left">
                    <dl>
                        <dt class="all-category"><span></span><a href = "${pageContext.request.contextPath}/board/member?memberId=se&clubId=-99">전체보기</a></dt>
                        <dt><span></span>가입한 동호회</dt>
                        <c:forEach items="${joinList}" var ="club">
                        <dd class= "join-club-list" data-clubid = "${club.clubId}"><a href = "${pageContext.request.contextPath}/board/member?memberId=se&clubId=${club.clubId}">-  ${club.clubName}</a></dd>
                        </c:forEach>
                    </dl>
                </div>
                <!--/content-left-->
                <div class="content-right">
                    <div class="board-area">
						<div class= "club-category"><h4><strong>&#128221;&nbsp;&nbsp;${category}</strong></h4></div>
                        <div>
                        <c:forEach items ="${boardList}" var ="board"> 
							<div class= "board">
								<div class= "board-header" >
								<div class= "profile-pic">
								  <img class="diary-topbar-img" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="프로필사진" />
								</div>
									<div class= "board-info">
									<span class= "board-group"><strong>${board.clubName}</strong></span><br>
									<span>작성일 :  ${board.boardDate} </span>
									</div>
								 </div>
							<div  class= "board-content">
								<p>
								${board.content} 	
								</p>
								<span class= "likecolor">♡</span>
								<span>좋아요 (<span>${board.likeCnt}</span>)</span>
								</div>
								<div class="board-comment-list">
									<div class="board-comment">
									<h5>댓글</h5> <span><button class="write-comment-btn">댓글 쓰기</button></span>
										<c:forEach items="${board.replyList}" var="reply">
											<div>
												<c:if test = "${reply.deep > 1}">
												<span>&nbsp;&nbsp;&#8627;&nbsp;${reply.memberName}님 : </span>
												</c:if>
												<c:if test = "${reply.deep == 1}">
												<span>${reply.memberName}님 : </span>
												</c:if>
												<span>${reply.content}</span>
												<c:if test = "${reply.deep==1}">
												<span><button>답글</button></span>
												</c:if>
												<div class="reply-edit">
												<span>${reply.replyDate}</span>
												<span>삭제</span>
												<span>수정</span>
												</div>
											</div>
										</c:forEach>
										<div class="write-comment">
											<div class="new-content"><textarea></textarea><button class="add-reply">등록</button></div>
										</div>
									</div>
								</div>
							</div> <!--board end -->
								</c:forEach>
						
                        </div>
                    </div>
                    <!--board-area-->
                </div>
                <!--/content-right-->
            </div>
            <!--/content-area-->
        </div>
        <!--/diary-area-->
        <div class="menu-bar" name="사이드메뉴바">
            <div class="group-profile">
                <div class="group-profile-img-area">
                    <img class="group-profile-img"
                        src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
                </div>
                <!--/group-profile-img-area-->
            </div>
            <!--/group-profile-->
            <ul class="side-nav">
                <li>공지사항</li>
                <li>갤러리</li>
                <li>달력</li>
                <li>자유 게시판</li>
                <li>멤버</li>
                <li>가계부</li>
            </ul>
            <!--/side-nav-->
        </div>
        <!--/menu-bar-->
    </div>
    <!--/wrap-->
</body>
    <footer>
    	Copyright (C) 2023 어리쥬 all rights reserved.
    </footer>
<script src="${pageContext.request.contextPath}/assets/js/lightbox-plus-jquery.min.js"></script>
<script>
    var $target = $("dt"),
        isClass = null;

    $target.on("click", function () {
        var _$self = $(this),
            isActive = _$self.hasClass("active");

        _$self.toggleClass("active");
        _$self.nextUntil("dt").slideToggle(!isActive);
    });
    
    $('.write-comment-btn').on("click",function(){
    	 var writeCommentDiv = $(this).closest('.board-comment').find('.write-comment');
    	  if (writeCommentDiv.is(':visible')) {
    		    writeCommentDiv.hide();
    		  } else {
    		    writeCommentDiv.show();
    		  }
    });
 /*
    $('.join-club-list')on("click", function(){
		var clubId = $(this).data('clubid');
    });
 */

    
</script>
</html>
