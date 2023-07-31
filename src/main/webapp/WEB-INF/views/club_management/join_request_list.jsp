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
				<a href = "#">권한설정</a>
				<a href = "#">가입승인</a>
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
                        	<a class= "mem-info" id = "c"><!--에이잭스로 삭제해야해서 아이디 줄 예정-->
                        		<div class= "mem-pic"><img class="diary-topbar-img11" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" /></div>
                        		<div class= "mem-deinfo"><span><h5>김세영</h5></span> <button type ="button" class= "new-mem-btn" data-clubmemno>가입승인</button></div>
                        	</a>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
                        	<div class= "mem-info"></div>
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
		console.log('테스트');
    });
	//감시하는 객체
    lastBoardObserver.observe(lastBoard[0]);

	
	function getData(){
		var clubId = $('.diary-area').data('clubid');
	
		var MemberVo = {
				clubId : clubId,
				startNum : startNum,
				endNum : endNum
		}
		
		 $.ajax({
		       
		       //요청 세팅
		       url : "${pageContext.request.contextPath}/management/club/memberlist",
		       type : "post",
		       data : MemberVo,
		       
		       //응답 세팅
		       dataType : "json",
		       success : function(jsonResult){
					
		       }, //success end
		       error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		       }
						            
		    });//ajax end
	}

 
 	
</script>
</html>
