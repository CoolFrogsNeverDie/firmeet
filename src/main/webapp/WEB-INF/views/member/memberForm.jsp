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
    <link href="${pageContext.request.contextPath}/assets/css/memberForm.css" rel="stylesheet"  type="text/css" />
    <!--모달-->
    
  	<style>
  		
  		
  		
  		footer {
	    	box-sizing:border-box;
	    	width:100%;
	    	height:80px;
	    	background:#777;
	    	color:#eee;
	    	padding-top:30px;
	    	transform:translateY(7px);
	    	border:none;
	      	text-align:center;
	      	transform:translateY(30px);
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
					
					
					<div class="diary-body">					
						<!-- 개인별코딩 ---------------------------------------------------------------->
						<div class="col-sm-6 brand">
		                    <a href="" class="logo">퍼밋<span>.</span></a>
		
		                    <div class="heading">
		                        <h2>퍼밋</h2>
		                        <p>FirstMeet,PerfectMeet</p>
		                    </div>
		
		                    <div class="success-msg">
		                        <p>회원가입 되었습니다.</p>
		                        <a href="">메인으로 가기</a>
		                    </div>
                		</div>
                		<!-- brand -->
						<div class="col-sm-6 form">
						
		                    <div class="login form-peice ">
		                        <form action="/firmeet/member/login" method="POST">
		                            <div class="form-group paddingG">
		                                <label>Id</label>
		                                <input type="text" name="memberId" required>
		                            </div>
		
		                            <div class="form-group paddingG"> 
		                                <label>비밀번호</label>
		                                <input type="password" name="memberPw" required>
		                            </div>
		                            <div class="CTA">
		                                <input type="submit" value="LOGIN">
		                                <a href="#" class="switch">JOIN US</a>
		                            </div>
		                        </form>
		                    </div>
		                    <!-- 로그인폼 -->
	
		                     <div class="signup form-peice switched">
		                        <form class="signup-form" method="post" action="/firmeet/member/join" style= "top: 55%;">
		                            <div class="form-group idForm">
		                                <label>Id</label>
		                                <input type="text" name="memberId" class="id">
		                                <button id="btnIdCheck" type="button" action="/firmeet/member/idcheck">중복체크</button>
		                                <span id="idcheckMsg"></span>
		                                <span class="error"></span>
		                            </div>
		                            <!-- idForm -->
		
		                            <div class="form-group paddingG">
		                                <label>이름</label>
		                                <input type="text" name="memberName" class="name" maxlength="20" >
		                                <span class="error"></span>
		                            </div>
									<!-- 이름 -->
									
		                            <div class="form-group paddingG">
		                                <label>핸드폰 번호</label>
		                                <input type="text" name="memberPhone" pattern="(010)-\d{4}-\d{4}" >
		                            </div>
									<!-- 핸드폰 번호 -->
									
		                            <div class="form-group paddingG">
		                                <label>비밀번호</label>
		                                <input type="password" name="memberPw" class="pass">
		                                <span class="error"></span>
		                            </div>
									<!-- 비밀번호 -->
		
		                            <div class="form-group paddingG">
		                                <label>비밀번호 확인</label>
		                                <input type="password" name="memberPwCon" class="passConfirm">
		                                <span class="error"></span>
		                            </div>
		                            <!-- 비밀번호 화긴-->
		
		                            <div class="form-group interP" >
		                                <label>관심사 공개</label>
		                                <ul class="inter">
		                                    <li><input type="radio" name="memberPri" value="0" id="agree"><label for="agree">공개</label></li>
		                                    <li><input type="radio" name="memberPri" value="99" id="disagree"><label for="disagree">비공개</label></li>
		                                </ul>
		                            </div>
		                            <!-- 관심사 공개 -->
		
		                            <div class="form-group cateForm" >
		                                <label>카테고리</label>
		                                <ul class="category">
		                                  <c:forEach  items="${cateList}" var="cate" >
		                                   	<li>
		                                   		<input type="radio" name="cateNo" value="${cate.cateNo}"  id="${cate.category}">
		                                   		<label for ="${cate.category}">${cate.category}</label>
		                                   	</li>
		                                   </c:forEach>
		                                   <!-- c:forEach.category -->
		                                </ul>
		                                <!-- ul.category -->
		                            </div>
		                            <!-- cateForm -->
		
		                            <div class="form-group tagForm">
		                                <label>태그</label>
		                                <ul class="tag">
										 <c:forEach items="${tagList}" var="tag">
										 	<li>
										 		<input type="checkbox"class="tags" value="${tag.tagNo}" id="${tag.tagNo}" name="tagNo" data-tagname="${tag.tagName}">
										 		<label for="${tag.tagNo}" class="tagLabel">${tag.tagName}</label>
										 	</li>
										 </c:forEach>
										 <!-- forEach.tag -->
						               </ul>
						               <!-- ul.tag -->
						               <div id="selTag">
								            <label>선택된 태그</label>
								            <ul id="selectedTag">
		 	
								             </ul>
						                </div>
						                <!-- selTag -->  
						                            
		                                <!-- <div class="tagSearch">
		                                    <input type="search">
		                                    <button type="submit" class="search" >검색</button>
		                                </div> -->
                           
		                            </div>
		                            <!-- tagForm -->
		                            
		                            <div class="CTA">
	                                    <input type="submit" value="JOIN">
	                                    <a class="switch">LOGIN</a>
		                            </div>
	                                <!-- 버튼 -->				                            

		                        </form>
								<!-- signup-form -->
		                    </div>
		                    <!-- 회원가입 -->
		                </div>
						
						
						<!-- 개인별코딩 ---------------------------------------------------------------->
					</div>
				
				</div>
				<!--/diary-area-->	
			</div>
			<!-- //main-content -->	
		</div>
		<!-- container -->
	</div>
    <!-- //중간 콘텐츠 -->
    
</body>
<!-- <footer>
    &copy; 2023 by 어리쥬. All Page content is property of 어리쥬
</footer>
 -->

	<script type="text/javascript">
	
		//아이디 체크 버튼 클릭했을때
		$("#btnIdCheck").on("click", function(){
			console.log("버튼 클릭");
			
			//id 추출
			var id = $(".id").val();
			
			console.log(id);
			
			memberVO ={
					memberId : id
			}
			
			//통신  id////////////////////////////////////////////
			$.ajax({
				url : "${pageContext.request.contextPath}/member/idcheck",		
				type : "post",
				/* contentType : "application/json", */
				data : memberVO,
		
				dataType : "json",
				success : function(jsonResult){
					console.log(jsonResult);
					
					if(jsonResult.result == 'success'){ //처리성공
						//사용가능한지 불가능 한지 표현한다
						if(jsonResult.data == true){
							//사용가능
							alert("사용 가능한 아이디 입니다.")   
						}else {
							//사용불가
							alert("사용 불가능한 아이디 입니다.")   
						}
						
					}else {
						//메세지 출력
						var msg = jsonResult.failMsg;
						alert(msg);
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			
		});
			
			//태그를 클릭했을때 아래쪽 그린다
			$(".tags").on("click", function(){
				var tagList= [];
				
				$("#selectedTag").empty();
				
				$('input[name="tagNo"]:checked').each(function(i){
					
					 let tagName = $(this).data("tagname");
					tagList.push($(this).data("tagname")); 
					
					
					 
					 /* console.log($(this).data("tagname")) */
					 /*
					 for(int i=0; i>tagList.length(); i++){
						 if($this.val()!=tagList.[i]){
							 $("#selTag").append("<li>"+$(this).val()+"<li>");
						 }
					 }
					 */
					 let str = "<li class='tagLabel'>"+tagName+"</li>"
					 $("#selectedTag").append(str);
					 
					 console.log(tagList);
					
				});
			
		});
	
	</script>
	
	<script type="text/javascript">

    $(document).ready(function(){
        'use strict';

        var nameError = true,
            idError = true,
            passwordError = true,
            passConfirm = true;

          $('input').on( "click",function(){
                $(this).siblings('label:not(.tagLabel)').addClass('active');
                $(".tagLabel").removeClass('active');
    			
            });
            $('.tagLabel').on( "click",function(){
               
                $(".tagLabel").removeClass('active');
    			
            });
     			 

            $('input').blur(function(){

                // 이름 작성여부
                if($(this).hasClass('name')){
                    if($(this).val().length === 0){
                        $(this).siblings('span.error').text('이름을 입력해 주세요').fadeIn().parent('.fprm-group').addClass('hsaError');
                        nameError = true;
                    } else{
                        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                        nameError = false;
                    }
                }
                
                // 아이디 작성 여부
                if($(this).hasClass('id')){
                    if($(this).val().length == ''){
                        $(this).siblings('span.error').text('아이디를 입력해 주세요').fadeIn().parent('form-group').addClass('hasError');
                        idError = true;
                    } else{
                        $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                        idError = false;
                    }
                }

                //비밀번호 일치 여부
                if($('.pass').val() != $('.passConfirm').val()){
                    $('.passConfirm').siblings('.error').text('비밀번호가 일치하지 않습니다.').fadeIn().parent('.form-group').addClass('hasError');
                    passConfirm = false;
                } else {
                    $('.passConfirm').siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                    passConfirm = false;
                }

                if($(this).val().length>0){
                    $(this).siblings('label').addClass('active');
                }else{
                    $(this).siblings('label').removeClass('active');
                }
            });


         // 폼 스위치 
            $('a.switch').click(function(e){
                $(this).toggleClass('active');
                e.preventDefault();
                
                if($('a.switch').hasClass('active')){
                    $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
                } else {
                    $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
                }
            });

            $('form.sginup-form').submit(function(event){
                event.preventDefault();

                if(nameError == true || idError == true || passConfirm == true){
                    $('.id, .name, passConfirm').blur();
                } else {
                    $('.signup, login').addClass('switched');

                    setTimeout(function(){ $('.signup, .login').hide(); },700);
                    setTimeout(function(){ $('.brand').addClass('active'); }, 300);
                    setTimeout(function (){ $('.heading').addClass('active'); } ,600);
                    setTimeout(function () { $('.success-msg p').addClass('active'); }, 900);
                    setTimeout(function () { $('.success-msg a').addClass('active'); }, 1050);
                    setTimeout(function () { $('.form').hide(); }, 700);
                }
            });

            $('a.profile').on('click',function(){
                location.reload(true);
            }); 

    });

</script>

</html>