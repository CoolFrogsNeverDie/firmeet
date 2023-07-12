<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Firmeet List</title>

 <style>
        *{
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        
   		 @font-face {
         	font-family: 'Pretendard-Regular';
         	src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
         	font-weight: 100,200,300,400,500,600,700,800,900;
         	font-style: normal;}
        #main_search {
            margin: 25px auto 35px;
            display: block;
            width: 27vw;
            height: 30px;
            border: 1px solid black;
            border-radius: 5px;
        }

        #hobby_form{
            
            border: 1px solid black;
            border-radius: 10px;
            background: #ddd;
            margin: 15px auto;
            width: 50vw;
            height: 350px;
            position: relative;
        }
		#hobby_form>h5{
			margin: 10px 0px 0px 10px;
		}
        #hobby_form>p{
            font-size: 15px;
            margin-left: 10px;
            margin-top:20px
        }
        

        #hobby_form>#select_box{
			position:absolute;
			top:40px;
			left:10px;
           	display:flex;
            width: 50vw;
            height: 150px;
            gap:15px;
        }
        
        #hobby_form>#select_box>p{
        	display: block;
        	width: 100px;
        }

        #select_box>select{
            width: 10vw;
            height: 25px;
            display:block;
            border: 1px solid black;
        }
       	#category{ 
       	
       		position: absolute;
       		display: block;
       		width:100px;
			left: 10px;
            top:50px;
            position: relative;
        }
        #select_field{   
            display: flex;
            gap: 5px;
            flex-wrap: wrap;
            justify-content: center;
            position: absolute;
            left: 115px;
            top:0px;
            width: 35vw;
        }
       
       
        #keyword{ 
            font-size: 15px;
            position: absolute;
            top: 145px;
            left: 10px;
            width: 50vw;
            display: flex;
        }

        #keyword>input{
            margin-left: 10px;
            display: block;
            width: 20vw;
            height: 25px;
            border: 1px solid blue;
            border-radius: 3px;
        }
        #select_tag{
            width: 40vw;
            height: 70px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            justify-content: center;
            position: absolute;
            left: 35px;
            bottom:80px;
            overflow: hidden;
        }

        #select_tag button {
            border: 1px solid purple;
            width: 100px;
            height:30px;
            border-radius: 10px;
        }

        #search_btn{
            position: absolute;
            bottom: 10px;
            right: 10px;
        }

        #meetArea {
            margin: auto;
            width: 65vw;     
        }
        #meet>div{
           	width:60vw;
           	height: 40px;
            position: relative;
            margin:auto;
           
        }
        #meet>div>a{
        	display: block;
        	position:absolute; 
            width: 150px;
            height: 40px;
            right: 0px;
        }
        #meet>div>h5{
        	display: block;
        	position:absolute; 
        	width: 150px;
        	height: 40px;
        	left:0px;
        }

        #meetList{
            margin-top: 30px;
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
        }

        #meetList>li{
            border: 1px solid black;
            display: block;
            width: 170px;
            height: 250px;
            
        }
       .meetPhoto{
        display: block;
        width: 170px;
        height: 170px;
        border: 1px solid rebeccapurple;
       }
       .meetTitle{
        margin-top: 10px;
        text-align: center;
        font-size: 12px;
        font-weight: bold;
       }
       .meetContent{
        margin-top: 10px;
        text-align: center;
        font-size: 10px;

       }

       #select{
        border-top: 2px solid black;
        display: flex;
        position: absolute;
        bottom: 20px;
        left: 10px;
        gap: 20px;
        width: 48vw;
       }
       #select span{
        border: 1px soid black;
        
        }


    </style>
    
</head>
<body>
   <!--  상단 nav바 -->
   <%-- <c:import url="WEB-INF/views/include/topnav.jsp"></c:import> --%>
    

    <input id="main_search" type="search">
    <form id="hobby_form">
        <h5>나의 취향</h5>
        <div id="select_box">
        	<p>원하는 지역</p>
            <select id="first">
                <option>지역 선택</option>
                <option>서울</option>
                <option>경기</option>
                <option>강원</option>
                <option>충북</option>
                <option>충남</option>
                <option>전북</option>
                <option>전남</option>
                <option>경북</option>
                <option>경남</option>
            </select>
            <select id="second">
                <option>세부 선택</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
            </select>
        </div>
        <div id="category">
  			<p>카테고리</p>
	        <div id="select_field">
	            <input type="radio" name="cate" value="1">운동/액티비티
	            <input type="radio" name="cate" value="2">스터디
	            <input type="radio" name="cate" value="3">친목
	            <input type="radio" name="cate" value="4">건강/음식
	            <input type="radio" name="cate" value="5">언어/문화
	            <input type="radio" name="cate" value="6">종교
	            <input type="radio" name="cate" value="7">교육/학습
	            <input type="radio" name="cate" value="8">음악/예술
	            <input type="radio" name="cate" value="9">여행
	        </div>
        </div>
        <div id="keyword">
            <p>원하는 키워드</p>
            <input type="search">
        </div>
        <ul id="select_tag">
            <li><button type="button" class="btn btn-outline-secondary">태그1</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그2</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그3</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그4</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그5</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그6</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그7</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그8</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그9</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그10</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그11</button></li>
            <li><button type="button" class="btn btn-outline-secondary">태그12</button></li>
            
        </ul>
        <ul id="select">
            <li><span>select1</span></li>
            <li><span>select2</span></li>
            <li><span>select3</span></li>
            <li><span>select4</span></li>
            <li><span>select5</span></li>
        </ul>
        <button class="btn btn-primary" id="search_btn" type="submit">검색하기</button>
    </form>
    <div id="meetArea">
        <div id="meet">
	        <div>
	             <a class="btn btn-primary" href="http://localhost:8000/firmeet/club/makingForm" role="button">모임 만들기</a>
	        </div>
        <ul id="meetList">
            <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
             <li>
                <a href="">
                	<img src="" alt="사진 1" class="meetPhoto">
                	<p class="meetTitle">모임 제목 제목</p>
                	<p class="meetContent"> 모임 내용내용 내용 내용내용 내용내용내용 내용내용내용 내용</p>
                </a>
            </li>
            
            

            
            
        </ul>
    </div>
</body>
</html>