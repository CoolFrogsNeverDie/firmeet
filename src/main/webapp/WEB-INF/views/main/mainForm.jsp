<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>Firmeet List</title>

    <style>
        *{
            margin: 0px;
            padding: 0px;
            list-style: none;
            font-family: 'Pretendard-Regular', sans-serif;
        }

    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 100,200,300,400,500,600,700,800,900;
        font-style: normal;
        }

    
        a {
           text-decoration: none;
           color: #111; 
        }

    #main_search{

        min-width: 750px;
        display: block;
        
        margin: 50px auto;
        
    }
    form::before{
        content: "";
        display: block;
        position: absolute;
        top: 0; left: -260px;
        background-color: #111;
        width: 140%;
        height: 100%;
        z-index: -1;
    }

    form{
       
        width: 1300px;
        padding-top: 10px;
        color: white;
        background:  #222;
        min-width: 1000px;
        height: 520px;
        margin: auto;
        position: relative;
    }

    form >h3{
        font-size: 30px;
        font-weight: 800;
        text-align: center;
    }
        
    #select_box {
      
        display: flex;
        gap: 50px;  
        width: 1000px;
        height: 30px;
        margin: auto;
    }

    #select_box p {
        margin-left: 20px;
        font-size: 17px;
        font-weight: 600;
    }

    #select_box #addressSi{
        border: none;
        color: white;
        background-color: #222;
        border-radius: 10px;
        width: 25%;
    }

    #select_box #addressSiGunGu{
        border: none;
        color: white;
        background-color: #222;
        border-radius: 10px;
        width: 25%;
    }

    #select_field{
        border: 1px solid #444;
        width: 1000px;
        margin: auto;
    }
    #select_field>p{
        transform: translate(20px , 10px);
        font-size: 17px;
        font-weight: 600;
    }


    #select_field ul{
        margin: 20px;
        width:1000px;
        display: flex;
        flex-wrap: wrap;
        accent-color: black;
    }
     
    #select_field li{
        font-size: 12px;
        width:150px;
        height:30px;
        display: flex;
        gap:10px;
    }
    
     #select_field li>p{
     transform: translateY(7px);
     }

    #keyword {
        border: 1px solid #888;
        width: 1000px;
        margin:  20px auto;
    }

    #keyword p {
       transform: translate(20px , 10px);
        font-size: 17px;
        font-weight: 600;
    }


    #keyword>input[type =search]{
        display: block;
        border: none;    
        width: 30%;
        border-radius: 30px;
        transform: translateX(600px); 
    }
   
    #keyword #select li{
        transform: translateY(20px);
    } 
    
    
    #select_tag{
            margin:-24px 0px 0px 105px;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            width: 700px;
            height: 100px;
            overflow-y: scroll;
            position:relative;
        }
   #select_tag .tags{
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
    .tagLabel{
        	display:block;
        	text-align:center;
        	width:110px;
        	height:25px;
        	font-size:13px;
        	font-weight:200;
        	border-radius:5px;
        	padding:2px;
        	background-color:#bbb;
        }
        
    #select_tag .tags:checked+.tagLabel{
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
            width: 600px;
            height: 50px;
            overflow-y: scroll;
            position:relative;
        }
    #selectedTag::-webkit-scrollbar{
        	display: none;
   		 }

    #search_btn {
        font-size: 15px;
        width: 120px;
        border-radius: 5px;
        height: 30px;
        position: absolute;
        border: none;
        right: 200px;
        bottom: -0px;
        
    }

    #search_btn:hover {
        color: #eee;
        background: #222;
    }

    #meet {
        display: flex;

        width: 90%;
        margin: 20px auto;
       justify-content: space-between;

    }

    #meet h5 {
        font-size: 20px;
        font-weight: 800;
        transform: translateX(20px);
    }

    #meet button {
        width: 120px;
        height: 30px;
        border-radius: 10px;
        border: none;
        background: #222;
        color: #eee;
    }
    
    #meet button a{
    	background: #222;
        color: #eee;
    }

  
    #meetArea {
        padding-top: 20px;
        width: 1200px;
        min-width: 1200px;
        margin: auto;
        
        height: 635px;
        box-shadow: 3px 0px 12px rgba(0, 0, 0, 0.3); 
    }

    
    #meetList {
        overflow-y: scroll;
        display: flex;
        flex-wrap: wrap;
        height: 500px;
        gap: 30px;
    }

    #meetList::-webkit-scrollbar{
        display: none;
    }
    
    #meetList>li {
        border: 1px solid black;
        display: block;
        width: 200px;
        height: 300px;
    }

    #meetList .meetPhoto {
        display: block;
        width: 200px;
        height: 200px;
        border: 1px solid black;
    }
    
    #paging ul{
    	width: 300px;
    	margin:auto;
    	height:20px;
    	display:flex;
    }
    #paging ul li{
    	width:20px;
    	height:20px;
    }


    </style>

   
</head>
<body>
    

	 <c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
	 
    <input id="main_search" type="search"  name="keyword" >
    <form id="hobby_form" action="${pageContext.request.contextPath }/main/search">
        <h3>나의 취향</h3>
      
        <div id="select_box">  
            <p>원하는 지역</p>
            <select id="addressSi" name="address1"> </select>
            <select id="addressSiGunGu" name="address2"> </select>
        </div>
        
        <div id="select_field">
            <p><label for="cate">원하는 분야</label></p>
            <ul>
                 <c:forEach  items="${cateList}" var="cate" >
                 	<li><input type="radio" name="cateNo"  value="${cate.cateNo}" ><p>${cate.category}</p></li>
                 </c:forEach>
            </ul>
        </div>
        <div id="keyword">
            <p>원하는 키워드</p>
            
            <ul id="select_tag">
                  <c:forEach items="${tagList}" var="tag">
				 	<li>
				 		<input type="checkbox"class="tags" value="${tag.tagNo}" id="${tag.tagNo}" name="tagNo" data-tagname="${tag.tagName}">
				 		<label for="${tag.tagNo}" class="tagLabel">${tag.tagName}</label>
				 	</li>
				 </c:forEach>
            </ul>

           <!--  <input type="search"> -->


            <div id="selTag">
	               <p>선택된 태그</p>
	              	<ul id="selectedTag">
	              	
	              	</ul>
            	</div>
        </div> 
        <button type="submit" id="search_btn">검색하기</button>
    </form>
    <div id="meetArea">
        <div id="meet">
            <h5>모여라</h5>
            <button type="button"><a href="http://localhost:8000/firmeet/club/makingForm">나의 모임 만들기</a></button>
        </div>
        <ul id="meetList">
        <c:forEach items="${requestScope.pMap.clubList}" var="clubs" >
            <li>
                <a href="http://localhost:8000/firmeet/club/joinForm/${clubs.clubId}">
                    <img src="../assets/images/clubimg/${clubs.img2}" alt="사진 1" class="meetPhoto">
                    <p class="meetTitle">${clubs.clubName} 모임제목</p>
                    <p class="meetContent">${clubs.intro1} 모임 내용</p>
                </a>
            </li>
        </c:forEach> 
        </ul>
        <div id="paging">
				<ul>
					<c:if test="${pMap.prev == true}">
						<li><a href="${pageContext.request.contextPath}/main/mainForm?crtPage=${pMap.startPageNo-1}&${param.keyword}">◀</a></li>
					</c:if>
								
					<c:forEach begin="${pMap.startPageNo}" end="${pMap.endPageNo}"  step="1"  var="page">
						<li><a href="${pageContext.request.contextPath}/main/mainForm?crtPage=${page}&keyword=${param.keyword}">${page}</a></li>
					</c:forEach>
								
					<c:if test="${pMap.next == true}">
						<li><a href="${pageContext.request.contextPath}/main/mainForm?crtPage=${pMap.endPageNo+1}&${param.keyword}">▶</a></li>
					</c:if>
				</ul>
				<div class="clear"></div>
			</div> 
    </div>
     
</body>

<script>
    $(function(){
        areaSelectMarker("select[name=address1]")
    });

    var areaSelectMarker = function(target){
        if(target ==null || $(target).length==0){
            console.warn("UnKwon Area Tag");
            return;
        }
 

    var area = {
    		"서울특별시" : ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
            "경기도1" : ["수원시장안구", "수원시권선구", "수원시팔달구", "수원시영통구", "성남시수정구", "성남시중원구", "성남시분당구", "의정부시", "안양시만안구", "안양시동안구", "부천시", "광명시", "평택시", "동두천시", "안산시상록구", "안산시단원구", "고양시덕양구", "고양시일산동구", "고양시일산서구"], 
            "경기도2" : ["과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시처인구", "용인시기흥구", "용인시수지구", "파주시", "이천시", "안성시","김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군","양평군"],
            "인천광역시" : ["계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"],
            "강원도" : ["춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"],
            "충청북도" : ["청주시상당구", "청주시서원구", "청주시흥덕구", "청주시청원구", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군" ],
            "충청남도" : ["천안시동남구", "천안시서북구", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"],
            "대전/세종" :[ "대덕구", "동구", "서구", "유성구", "중구" ,"세종특별자치시"],
            "전라북도" : [ "전주시완산구", "전주시덕진구", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군"],
            "전라남도" : ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군"],
            "광주광역시" : ["광산구", "남구", "동구", "북구", "서구"],
            "경상북도" : ["포항시남구", "포항시북구", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"],
            "경상남도" : ["창원시의창구", "창원시성산구", "창원시마산합포구", "창원시마산회원구", "창원시진해구", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군"],
            "부산광역시" : ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"],
            "대구광역시" : ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ],
            "울산/제주" : ["남구", "동구", "북구", "중구", "울주군","서귀포시", "제주시"]
    };



for(i=0; i<$(target).length; i++){
    (function(z){
        var a1 = $(target).eq(z);
        var a2 =a1.next();

        //초기화 
        init(a1,true);

        //권역 생성
        var area1 = Object.keys(area);
        area1.forEach(function(siDo){
            a1.append("<option value="+siDo+">"+siDo+"</option>");
        });

        //변경 이벤트
        $(a1).on("change",function(){
            init($(this),false);
            var siDo =$(this).val();
            var keys = Object.keys(area[siDo]);
            keys.forEach(function(siGunGo){
                a2.append("<option value="+area[siDo][siGunGo]+">"+area[siDo][siGunGo]+"</option>");
            });
        });
    })(i);
        function init(t,first){
            first?t.empty().append("<option value=''>선택</option>"):"";
            t.next().empty().append("<option value=''>선택</option>");
        }

    }
}
</script>
<script>
$(".tags").on("click", function(){
	var tagList= [];
	
	$("#selectedTag").empty();
	
	$('input[name="tagNo"]:checked').each(function(i){
		 tagList.push($(this).data("tagname")); 
		
		 let tagName = $(this).data("tagname")
		 
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
		
		 
	});
});	


</script>



</html>