<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>FirstMeet, PerfectMeet</title>
</head>
<style>
    *{margin: 0; padding: 0; list-style: none; font-family: 'Pretendard-Regular', sans-serif;} 
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 100,200,300,400,500,600,700,800,900;
        font-style: normal;
        }

     

        .container {
            
            max-width: 1500px;
            accent-color: black;
            
        }

        a {
            display:block;
            text-decoration: none;
        }

        input {
            outline: none !important;
        }

        h1{
            text-align:  center;
        }
        

        .brand{
            padding: 20px;
            background-size: cover;
            background-position:  center center;
            color: #fff;
            min-height: 929px;
            width: 750px;
            position: relative;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.3); 
            transition: all 0.6s cubic-bezier(1, -0.375, 0.285, 0.995);
            z-index: 9999;
        }

        .brand .active{
            width: 100%;
        }
        .brand::before{
            content: "";
            display: block;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0; left: 0;
            background: rgba(0, 0, 0);
            z-index: -1;
        }
        .brand a.logo{
            color: #fff;
            font-size: 30px;
            font-weight: 700;
            line-height: 1em;
        }

        .brand a.logo span {
            font-size: 30px;
            color: #ddd;
            transform: translateX(5px);
            display: inline-block;
        }

        .brand .heading {
            position: absolute;
            top: 50%;
            left: 40%;
            transform: translate(-50%, -50%);
            text-align: center;
            transition: all 0.6s;
        }
        .brand .heading.active {
            top: 100px;
            left: 100px;
            transform: translate(0);
        }

        .brand .heading h2 {
            font-size: 70px;
            font-weight: 900;
            text-transform: uppercase;
            margin-bottom: 0;
        }

        .brand .heading p {
            font-size: 20px;
            font-weight: 300;
            text-transform: uppercase;
            letter-spacing: 2px;
            white-space: 4px;
        }

        .brand .success-msg{
            width: 100%;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            margin-top: 60px;
        }

        .brand .success-msg p {
            font-size: 25px;
            font-weight: 400;
        }
        
        .brand .success-msg a {
            font-size: 20px;
            text-transform: uppercase;
            padding: 8px 30px;
            background: #f95959;
            color: #fff;
            border-radius: 30px;
        }

        .brand .success-msg p, .brand .success-msg a{
            transition:  all 0.9;
            transform:  translateY(20px);
            opacity: 0;
        }

        .brand .success-msg p.active, .brand .success-msg a.active {
            transform: translateY(0);
            opacity: 1;
        }

        .form{
            position: relative;
        }

        .form .form-peice {
            background: #fff;
            min-height: 870px;
            margin-top: 50px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
            color: #bbb;
            padding: 30px 0 60px;
            transition: all 0.9s cubic-bezier(1, -0.375, 0.285, 0.995);
            position: absolute;
            top: -950px;
            left: 500px;
            width: 120%;
            overflow: hidden;
        }

        .form .form-peice.switched {
            transform: translateX(-100%);
            width: 100%;
            left: 750px;
        }

        .form form {
            padding:0 40px;       
            margin: 0;
            width: 70%;
            position: absolute;
            top: 50%;
            left: 60%; 
            transform:  translate(-50%, -50%);
        }

        .form form .form-group{
            margin-left: 20px;
            margin-bottom: 5px;
            position: relative;
        }


        .form form .idForm{
            transform: translateY(-20px);
            display: flex;
        }
         
        .form form .idForm label{
        
            width: 10px;
        }
        .form form .idForm .id{
            transform: translate(20px ,20px);
            width: 50%;
            gap: 10px;
        }

        .form form .form-group #btnIdCheck{
            width: 80px;
            height: 25px;
            border-radius: 25px;
            font-weight: 500;
            color: #fff;
            background-color: #222;
            transform: translate(40px ,40px);
            font-size: 13px;
        }

        .form form .interP {
            height: 50px;
        }

        .form form .interP label{
            transform: translateY(10px);
        }

        .form form .form-group .inter{
            font-size: 12px;
            display: flex;
            width: 80%;
            height: 30px;
            flex-wrap: wrap;
            margin-left: 84px;
            transform: translateY(-10px);
        }
         
        .form form .form-group .inter li{
            display: flex;
            height: 15px;
        }
       
        .form form .form-group .inter li p{
            display: flex;
            width: 80px;
        }

        .form form .cateForm{
            transform: translateY(-25px);
        }

        .form form .cateForm label{
            transform: translateY(18px);
        }

        .form form .form-group .category{
            font-size: 10px;
            width: 80%;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-left: 70px;
        }
        .form form .form-group .category li{
            width: 80px;
            height: 30px;
        }
        .form form .form-group .category p{
           width: 80px;
           text-align: center;
           font-size: 12px;
           
        }
        .form form .tagForm{
            transform: translateY(-50px);
        }
        .form form .tagForm label{
            transform: translateY(18px);
        }

        .form form .form-group .tag{
            width: 80%;
            height:100px;
            font-size: 12px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-left: 80px;
            overflow-y: scroll;
            position:relative;
            color: #222;
        }

         .tag .tags {
      
            position:absolute;
            width: 1px;
            height: 1px;
            padding:0;
            margin: -1px;
            font-size: 10px;
            overflow:hidden;
            border:none;
            background: transparent;     
        }
        
        .tag .tagLabel{
        	display:block;
        	text-align:center;
        	width:70px;
        	height:20px;
        	font-size:11px;
        	font-weight:200;
        	border-radius:5px;
        	padding:2px;
        	background-color:#bbb;
        }
        
        .tag .tags:checked+.tagLabel{
        	background-color:#000;
        	color:#eee;
        }
        
         #selTag {
        	display:flex;
         	margin-top:15px;
         
        }
        
        #selectedTag{
        	margin-left:15px;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            width: 400px;
            height: 30px;
            overflow-y: scroll;
            position:relative;
    
        }

        .form form .tagForm .tagSearch{
            transform: translate(120px,-15px);
            display: flex;
            gap: 30px;
            width: 80%;
        }
        .form form .tagForm .tagSearch input{ 
            width: 50%;
        }
        .form form .tagForm .tagSearch .search{
            transform: translateY(10px);
            font-size: 12px;
            width: 100px;
            height: 25px;
            border-radius: 25px;
            background-color: #222;
            color: #fff;
        }



        .form form .form-group.hasError input {
            border-color: #222 !important;
        }
        .form form .form-group.hasError label {
            border-color: #222 !important;
        }

        .form form label {
            font-size: 12px;
            font-weight: 400;
            text-transform: uppercase;
            transform: translateY(40px);
            transition: all 0.4s;
            cursor: text;
            z-index: -1;
        }
        
        .form form label.active {
            transform: translateY(10px);
            font-size: 10px;
        }   

        .form form label.fontSwitch {
            font-family: "Raleway", sans-serif !important;
            font-weight: 600;
        }

        .form form input:not([type=submit]){
            background: none;
            outline: none;
            border: none;
            display: block;
            padding: 10px 0;
            width: 100%;
            border-bottom: 1px solid #ddd;
            color: #444;
            font-size: 15px;
            z-index: 1;
        }
        .form form input:not([type=submit]).hasError {
            border-color: #000;
        }

        .form form span.error{
            color: #222;
            font-size: 12px;
            position: absolute;
            bottom: -20px;
            right: 0;
            display: none;
        }

        .form form input[type=password] {
             color: #000;
        }
        .form form .CTA{
            margin-left: 20px;
            margin-top: 30px;
        }

        .form form .CTA input {
            font-size: 12px;
            text-transform: uppercase;
            padding: 5px 30px;
            background: #000;
            color: #fff;
            border-radius: 30px;
            margin-right: 20px;
            border: none;
        }

        .form form .CTA a.switch {
            font-size: 13px;
            font-weight: 400;
            color: #bbb;
            text-decoration: underline;
            transition: all 0.3s;
        }

        .form form .CTA a.switch:hover {
            color: #444;
        }
        
        

        @media (max-width: 768px) {
            .container {
                overflow: hidden;
            }

            section#formHolder {
                padding: 0;
            }
            section#formHolder div.brand {
                min-height: 200px !important;
            }
            section#formHolder div.brand.active {
                min-height: 100vh !important;
            }
            section#formHolder div.brand .heading.active {
                top: 200px;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            section#formHolder div.brand .success-msg p {
                font-size: 16px;
            }
            section#formHolder div.brand .success-msg a {
                padding: 5px 30px;
                font-size: 10px;
            }
            section#formHolder .form {
                width: 80vw;
                min-height: 500px;
                margin-left: 10vw;
            }
            section#formHolder .form .form-peice {
                margin: 0;
                top: 0;
                left: 0;
                width: 100% !important;
                transition: all 0.5s ease-in-out;
            }
            section#formHolder .form .form-peice.switched {
                transform: translateY(-100%);
                width: 100%;
                left: 0;
            }
            section#formHolder .form .form-peice > form {
                width: 100% !important;
                padding: 60px;
                left: 50%;
            }
        }
        @media (max-width: 480px) {
            section#formHolder .form {
                width: 100vw;
                margin-left: 0;
            }

            h2 {
                font-size: 50px !important;
            }
         }

</style>
<script type="text/javascript">

    $(document).ready(function(){
        'use strict';

        var nameError = true,
            idError = true,
            passwordError = true,
            passConfirm = true;

            $('input[type="text"], input[type="password"]').on( "click",function(){
                $(this).siblings('label').addClass('active');
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


<body>

		<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>

    <div class="container">
        <section id="formHolder">
            <div>

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

                <div class="col-sm-6 form">

                    <div class="login form-peice ">
                        <form action="/firmeet/member/login" method="POST">
                            <div class="form-group">
                                <label>Id</label>
                                <input type="text" name="memberId" required>
                            </div>

                            <div class="form-group"> 
                                <label>비밀번호</label>
                                <input type="password" name="memberPw" required>
                            </div>
                            <div class="CTA">
                                <input type="submit" value="login">
                                <a href="#" class="switch">Join Us</a>
                            </div>
                        </form>
                    </div>

                    <div class="signup form-peice switched">
                        <form class="signup-form" method="post" action="/firmeet/member/join" >
                            <div class="form-group idForm">
                                <label>Id</label>
                                <input type="text" name="memberId" class="id">
                                <button id="btnIdCheck" type="button" action="/firmeet/member/idcheck">중복체크</button>
                                <span id="idcheckMsg"></span>
                                <span class="error"></span>
                            </div>

                            <div class="form-group">
                                <label>이름</label>
                                <input type="text" name="memberName" class="name" maxlength="20" >
                                <span class="error"></span>
                            </div>

                            <div class="form-group">
                                <label>핸드폰 번호</label>
                                <input type="text" name="memberPhone" pattern="(010)-\d{4}-\d{4}" >
                            </div>

                            <div class="form-group">
                                <label>비밀번호</label>
                                <input type="password" name="memberPw" class="pass">
                                <span class="error"></span>
                            </div>

                            <div class="form-group">
                                <label>비밀번호 확인</label>
                                <input type="password" name="memberPwCon" class="passConfirm">
                                <span class="error"></span>
                            </div>

                            <div class="form-group interP" >
                                <label>관심사 공개</label>
                                <ul class="inter">
                                    <li><input type="radio" name="memberPri" value="0"><p>공개</p></li>
                                    <li><input type="radio" name="memberPri" value="99"><p>비공개</p></li>
                                </ul>
                            </div>

                            <div class="form-group cateForm" >
                                <label>카테고리</label>
                                <ul class="category">
                                  <c:forEach  items="${cateList}" var="cate" >
                                   	<li>
                                   		<input type="radio" name="category" value="${cate.cateNo}" >
                                   		<p>${cate.category}</p>
                                   	</li>
                                   </c:forEach>
                                </ul>
                            </div>

                            <div class="form-group tagForm">
                                <label>태그</label>
                                <ul class="tag">
								 <c:forEach items="${tagList}" var="tag">
								 	<li>
								 		<input type="checkbox"class="tags" value="${tag.tagNo}" id="${tag.tagNo}" name="tagNo" data-tagname="${tag.tagName}">
								 		<label for="${tag.tagNo}" class="tagLabel">${tag.tagName}</label>
								 	</li>
								 </c:forEach>
				               </ul>
				               <div id="selTag">
						            <p>선택된 태그</p>
						            <ul id="selectedTag">
 	
						             </ul>
				                </div>              
                                <!-- <div class="tagSearch">
                                    <input type="search">
                                    <button type="submit" class="search" >검색</button>
                                </div> -->
                                <div class="CTA">
                                    <input type="submit" value="join">
                                    <a href="" class="switch"> login</a>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </section>

    </div>
    
</body>

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



</html>