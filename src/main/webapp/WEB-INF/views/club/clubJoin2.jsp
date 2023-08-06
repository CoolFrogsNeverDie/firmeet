<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임 상세보기</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/hierarchy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />

    <style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 100,200,300,400,500,600,700,800,900;
    font-style: normal;
}

        * {
            font-family: 'Pretendard-Regular';
        }

        html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
a{text-decoration: none; color: #212121;}

        .wrap {
           	width:1245px;
           	margin:0 auto;
           
        }

        .back-img {
        	
            width: 100%;
            height: 400px;
           
           
        }
        .back-img>img{
        width:100%;
        height: 400px;
        background-size:cover;
        }
        

        .color-box {
            width: 100%;
            height: 400px;
            background-color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
           
        }

        .main-img {
           
            width: 200px;
            height: 200px;
            border-radius: 400px;
            margin-bottom: 430px;
            background-color: white;
            position: absolute;
        }

        .main-img-file {
            border-radius: 400px;
            width: 200px;
            height: 200px;
        }

        .club-title >h4{

            font-size: 40px;
            font-weight:900;
            margin-top: 130px;
            
        }

        .club-memeber-cnt {
            margin-top: -20px;
            
        }

        .club-intro {
        	
            margin-top: 20px;
            font-size: 130%;
        }

        .club-tag {
        	
            margin-top: 20px;
            font-size: 90%;
            color: #3498db;
        }

        .join-btn-area {
            margin: 50px;
        }

        .join-btn {
            width: 200px;
            height: 50px;
            background-color: #e74c3c;
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 17px;
        }

        .intro-detail {
        	background:#eee;
            padding: 30px 30px;
        }
        
        .intro-detail>h4 {
        	font-size:25px;
        	font-weight:800;
        
        }

        .detail-text {
        	text-align:center;
        	font-size:18px;
         
        }

        .detail-info {
        	
        	padding:30px 30px;
        }

        .detail-title>h4 {
            font-size:25px;
            font-weight:800;
        }

        .detail-info-table {
        	
            width:80%;
            height:20px;
            margin: 0 auto;
        }

        .detail-info-table tr {
        	
            height: 30px;
        }

        .info-icon {
        	margin-top:5px;
            width: 10%;
        }

        .info {
            width: 40%;
        }

        .info p {
        	margin-top:18px;
        }

        .info-icon {
            text-align: center;
            font-size: 20px;
        }

        .tag-info {
   			
            margin: 50px auto;
            height: 450px;
            background-color: #e0e0e0;
            position: relative;
        }

        #chartdiv {
            width: 100%;
            height: 100%;
        }
        
       .btn-subscript{
       		background-color:#444;
       
       }
       .btn-close{
       		background-color:#000;
       }
       .btn-main{
       		background-color:#1eafcc;
       }
       
       #paging ul{
	    	width: 150px;
	    	margin:auto;
	    	height:30px;
	    	display:flex;
	    	margin-top:30px;
	    }
	    #paging ul li{
	    	width:30px;
	    	height:30px;
	    	
	    }
       
       
        
       footer {
	    	boxsizing:border-box;
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
    <div class="ly-head-container">
		<header>
			<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
		</header>
	</div>


    <div class="wrap">
        <!--메인라인-->        
        <div class="back-img"><img src="${pageContext.request.contextPath }/assets/images/clubimg/${clubVo.img1}" >배경 이미지</div>
        <div class="color-box">
            <div class="main-img"><img src="${pageContext.request.contextPath }/assets/images/clubimg/${clubVo.img2}"
                    class="main-img-file"></div>
            <div class="club-title">
                <h4>어푸어푸 ${clubVo.clubName}</h4>
            </div><br>
            <div class="club-memeber-cnt">(${clubVo.preNum}/${clubVo.max})</div>
            <div class="club-intro">물을 보면 심장이 뛴다? 그럼 당신은 어푸어푸 회원!${clubVo.intro1}</div>
            <div class="club-tag">#성인수영 #새벽수영 #갓생 #친목 #운동러버 #초보환영</div>
            <div class="join-btn-area">
            	<button type="button" class= "join-btn btn-subscript">가입 신청됨</button>
            	<button type="button" class= "join-btn btn-close">마감</button>
            	<a href ="${pageContext.request.contextPath }/club/clubJoin/${clubVo.clubId}"><button type="button" class= "join-btn btn-join">회원가입</button></a>
            	<a href ="${pageContext.request.contextPath }/club/main/${clubVo.clubId}"><button type="button" class= "join-btn btn-main">모임 메인으로 가기</button></a>
            </div>
        </div>
        <!--메인라인 종료-->


        <!--상세 설명 -->
        <div class="intro-detail">
        	<h4>모임을 소개 합니다.</h4>
            <div class="detail-text">안녕하세요.
                <br>지구 면적 71%를 차지하고 있는 물과 함께 하는 수영 동호회 어푸어푸의 호스트 김수영입니다.
                <br>어푸어푸에서는 매주 화 목 토 새벽에 모여 약간의 친목이 섞인 수영 모임을 진행하고 있어요.
                <br>친목은 자유! 끝나고 식사 참여도 자유! 평등하고 편안한 분위기를 지향하고 있습니다.
                <br>소규모 그룹이라 한 명 한 명 모두가 편하게 지내고 있어요.
                <br>저희 같이 재밌게 운동해봐요!<br>
                <br>8/1 한강 수영대회 대비 집중 운동기간입니다.
                <br>대회 준비하시는 분들 들어오셔서 함께 준비해요!
                <br>궁금하신 점은 문의 게시판으로 편하게 문의 주세요-!
                <br><br>
                ${clubVo.intro2}
            </div>
        </div>
        <!--상세 설명 end-->

        <!--상세 정보-->
        <div class="detail-info">
            <div class="detail-title">
                <h4>상세 정보</h4>
            </div>
            <table class="detail-info-table">
                <tr>
                    <td class="info-icon"><i class="fa fa-clock-o " aria-hidden="true"></i></td>
                    <td class="info">
                        <p>매주화목금 아침 7시
                        ${clubVo.detailT}</p>
                    </td>
                    <td class="info-icon"><i class="fa fa-cutlery" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>연 2회 회식
                        	${clubVo.detailE}</p>
                    </td>
                </tr>
                <tr>
                    <td class="info-icon"><i class="fa fa-map-marker" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>성수동 근처
                        	${clubVo.detailL}</p>
                    </td>
                    <td class="info-icon"><i class="fa fa-cloud" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>날씨 상관 없음!
                        ${clubVo.detailW}</p>
                    </td>
                </tr>
                <tr>
                    <td class="info-icon"><i class="fa fa-commenting-o" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>단톡방 있음
                        ${clubVo.detailP}</p>
                    </td>
                </tr>
            </table>
        </div>
        <!--상세 정보 end-->

        <!--해당 태그 통계-->
        <div class="tag-info">
            <div class="tag-info-title">
                <h4>우리 동호회는 이런 분들이 좋아해요!</h4>
            </div>
            <div class="chart-area">
                <div id="chartdiv"></div>
            </div>

        </div>
        <!--해당 태그 통계 end-->

        <div class="club-qna-area">
            <div class="qna-title">
                <h4>QNA</h4>
				<button type="button" class="qna-btn">문의하기</button>
            </div>

            <!--문의사항 입력 영역(문의하기 버튼 눌러야 보임)-->
            <form action = "${pageContext.request.contextPath }/club/clubQna/${clubVo.clubId}">
            <div class="qna-write-area">
                <div  class= "qna-write"><textarea name="qnaCotent" >문의사항 입력창</textarea>
                <button type="submit" class="qna-write-btn" >문의 등록</button>
                </div>
                <div></div>
            </div>
            <!-- <button type="button" class="ans-btn">답변하기</button>
            <div class="ans-write-area">
                <div  class= "ans-write"><textarea name="answerContent" >답변사항 입력창</textarea>
                <button type="submit" class="ans-write-btn" >답변입력</button>
                </div>
                <div></div>
            </div> -->
           
            
            </form>
            
    
			 <c:forEach items="${requestScope.qMap.qnaList}" var ="qna">
            <!--반복될 QNA 영역-->
	            <div class="qna-content-area">
	                <div class="qna-icon">
	                	<img src="https://qai.org.au/wp-content/uploads/2021/03/grey-person-icon-300x298.png" >
						                      
	                </div>
	                
	                <div class="qna-content content">
	                	<p>${qna.qnaCotent}</p>
	                </div>
	                <ul>
						<li>${qna.memberId}</li>
						<li>${qna.qnaDate}</li>
					</ul>	 
	            </div>
		         <c:if test="${qna.answerContent !=null}">
		            <div class="qna-answer-area">
		             	<div class="answer-icon">
		         			<img src="https://qai.org.au/wp-content/uploads/2021/03/grey-person-icon-300x298.png" >	     
		         		</div>
		                <div class="answer-content content">
		                	<p>${qna.answerContent}</p> 	
		                </div>
		                <ul>
		                	<li>관리자</li>
		                	<li>${qna.answerDate}</li>
		            	</ul>   
		            </div>
		         </c:if>
            </c:forEach>
            <!--반복될 QNA 영역 end-->
            
            <div id="paging">
				<ul>
					<c:if test="${qMap.prev == true}">
						<li><a href="${pageContext.request.contextPath}/club/joinForm/${clubId}?crtPage=${qMap.startPageBtnNo-1}">◀</a></li>
					</c:if>
								
					<c:forEach begin="${qMap.startPageBtnNo}" end="${qMap.endPageBtnNo}"  step="1"  var="page">
						<li><a href="${pageContext.request.contextPath}/club/joinForm/${clubId}?crtPage=${page}">${page}</a></li>
					</c:forEach>
								
					<c:if test="${qMap.next == true}">
						<li><a href="${pageContext.request.contextPath}/club/joinForm/${clubId}?crtPage=${qMap.endPageBtnNo+1}}">▶</a></li>
					</c:if>
				</ul>
				<div class="clear"></div>
			</div> 
        
        </div>

        <!--답답해 보이지 않게 스크롤 늘여주는 div-->
        <div class="clear"></div>
			${clubVo.clubId}
       
    </div>
</body>
<footer>
    &copy; 2023 by 어리쥬. All Page content is property of 어리쥬
</footer>
<style>
    /*주요 태그 영역*/
    .tag-info-title>h4 {
        font-size: 25px;
        font-weight:800;
        padding: 30px;
        height: 20%;
    }
    
    /*버블 차트 영역*/
    .chart-area {

       
        margin: 0 auto;
        margin-top: -35px;
        height: 83%;
    }

    
   .club-qna-area {
   		border-bottom: 1px solid black;
       	padding:0 30px;
        margin: 0 auto;
        margin-top: 30px;
    }
    .qna-title {
        height: 40px;
        border-bottom: 1px solid black;
    }
    .qna-title h4 {
        float:left;
        font-size: 25px;
        font-weight:800;
    }
    .qna-btn{
    	float:right;
        width: 200px;
        height: 40px;
        background-color: #3498db;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 15px; 
        margin-top: 11px;
        
        transform:translate(30px,-36px);
    }
    
    .ans-btn{
    
       right:10px;
        float: right;
        width: 100px;
        height: 30px;
        background-color: #3498db;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 15px; 
        margin-top: 11px;
    }

    .qna-write-area{
    	background: #e0e0e0;
        height: 150px; 
       /*  display: none; */
    }
    
     .ans-write-area{
        width: 60vw;
        height: 180px;
        border: #e0e0e0;
        display: none;
    }
    .qna-write{
    	padding:10px 96px;
    	width:100%;
		display:flex;
        height: 150px;
        
    }
     .ans-write{
     	display:block;
        width: 50vw;
    }
    
    
    .qna-write-btn{
        border: none;
        width: 70px;
        height:110px;
        transform:translateX(66px);
        background-color: #3498db;
        color: white;
        border-radius: 5px;
    }
    
    .ans-write-btn{
        border: none;
        height: 30px;
        background-color: #3498db;
        color: white;
        margin: 1%;
        margin-top:105px;
        position:absolute;
        border-radius: 5px;
    }
    .qna-write > textarea{
    	padding: 15px; 
        width:810px; 
        height: 80%;
    }
    
    .ans-write > textarea{
        width:85%;
        height: 100%;
    }
    .qna-content-area {
    	
        width: 58vw;
        height: 80px;
        transform:translateX(80px);
        margin-top: 20px;
    }
    
    .qna-content-area ul {
    	transform: translate(10px,15px);
    }
    
    .ans-content-area {
        width: 58vw;
        height: 100px;
        margin: 0 auto;
        margin-top: 5px;
    }
    .qna-icon {
        float: left;
        width:60px;
        height:60px;
        padding:15px;
    }
    .qna-icon > img {
        width: 30px;
        height: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .qna-content {
    	padding: 15px;
        float: left;
        width: 800px;
        height: 80px;
        box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
        
    }
  
    
    /*문의 답변 영역*/
    .qna-answer-area {
		display:flex;
        width: 58vw;
       	transform:translateX(70px);
        padding:10px;
        margin-top: 10px;
    }
    .qna-answer-area ul {
    	transform: translate(10px,15px);
    
    }
    
    .answer-content {
       	width: 800px;
        height: 80px;
        background-color: #fafafa;
        box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
    }
    
    .answer-icon {
        display:flex;
        width:60px;
        height:60px;
        padding:15px;
    }
    .answer-icon > img {
        width: 30px;
        height: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    
    
    .content p {
        padding: 10px;
    }
    .clear{
        height: 130px;
    }
    .join-btn-last{
        margin: 0 auto;
        text-align: center;
        width: 50vw;
        height: 150px;
    }
</style>


<!--차트 관련 js-->
<script>

	
	$(document).ready(function() {
		//render();
		getTagData(); 
	  });
	
	function getTagData(){
		
		var clubId = ${clubVo.clubId};
		console.log(clubId)	
		
		var ClubVO = {
			clubId : clubId
		}
		
		console.log(ClubVO);
		 $.ajax({
		        
		        //요청 세팅
		        url : "${pageContext.request.contextPath}/club/tagrank",      
		        type : "post",
		        data : ClubVO,
		        
		        //응답 세팅
		        dataType : "json",
		        success : function(jsonResult){
		        
		        	var data = jsonResult.data;
		        	console.log(jsonResult.data)
		        	render(data);
		        	
		        }, //success end
		        error : function(XHR, status, error) {
		        console.error(status + " : " + error);
		        }
						            
		     });//ajax end
		
	}
	
	
	
	function render(data2) {
	

        // Create root element
        // https://www.amcharts.com/docs/v5/getting-started/#Root_element
        var root = am5.Root.new("chartdiv");


		 var data = {
            value: 0,
            children: []
        }

       	data2.forEach(function(round) {
       		data.children.push({ name: round.tagName + ' (' +round.tagCnt + ')'  , value: (100/parseFloat(round.totalCnt))*round.tagCnt });
			console.log((100/parseFloat(round.totalCnt))*round.tagCnt );
        });
        
        /*원형차트 데이터 넣기*/
/*         var chart1 = data.children.push({ name: "#활발한 ", value: 30 })
        var chart2 = data.children.push({ name: "#인싸환영", value: 2 })
        var chart3 = data.children.push({ name: "#조용한", value: 70 })
        var chart4 = data.children.push({ name: "#분위기있는", value: 10 })
        var chart4 = data.children.push({ name: "#재밌는", value: 10 })
 */

        // Create wrapper container
        var container = root.container.children.push(
            am5.Container.new(root, {
                width: am5.percent(100),
                height: am5.percent(100),
                layout: root.verticalLayout
            })
        );



        // Create series
        // https://www.amcharts.com/docs/v5/charts/hierarchy/#Adding
        var series = container.children.push(
            am5hierarchy.ForceDirected.new(root, {
                singleBranchOnly: false,
                downDepth: 0,
                topDepth: 1, //상단깊이
                initialDepth: 10, //초기 깊이
                maxRadius: 110, //최대반경
                minRadius: 40, //최소 반경
                valueField: "value",
                categoryField: "name",
                childDataField: "children",
                manyBodyStrength: 0,
                centerStrength: 1 //중심강도
            })
        );


        series.get("colors").setAll({
            step: 4
        });

        series.links.template.setAll({
            strokeWidth: 0
        });

        series.nodes.template.setAll({
            tooltipText: null,
            cursorOverStyle: "pointer"
        });

        var selectedDataItem;

        // handle clicking on nodes and link/unlink them --> 노드 클릭 처리하고 연결/연결 해제
        series.nodes.template.events.on("click", function (e) {
            // check if we have a selected data item //선택한 데이터 항목 있는지 확인
            if (selectedDataItem) {
                var targetDataItem = e.target.dataItem;
                // if yes, and it's the same, unselect // 항목 존재하고 동일한 경우 선택 취소
                if (e.target.dataItem == selectedDataItem) {
                    selectedDataItem.get("outerCircle").setPrivate("visible", false);
                    selectedDataItem = undefined;
                }
            }
            // if no selected data item, select
            else {
                selectedDataItem = e.target.dataItem;
                selectedDataItem.get("outerCircle").setPrivate("visible", true)
            }
        })

        series.data.setAll([data]);
        series.set("selectedDataItem", series.dataItems[0]);

        // Make stuff animate on load
        series.appear(1000, 100);

    }; // end am5.ready()

</script>

<!--쿼리문용-->
<script>



$('.qna-btn').on("click", function(){
    
    var view =  $('.qna-write-area').css("display");

    if(view == "none"){
        $('.qna-write-area').css("display", "block");
    }else{
        $('.qna-write-area').css("display", "none");
    }

}); //문의하기 버튼 눌리면

$('.ans-btn').on("click", function(){
    
    var view =  $('.ans-write-area').css("display");

    if(view == "none"){
        $('.ans-write-area').css("display", "block");
    }else{
        $('.ans-write-area').css("display", "none");
    }

}); //문의하기 버튼 눌리면


	


</script>

<script>
	

	<c:if test="${memberLv.memlevel == null}">
		$(".btn-close").css("display","none");
		$(".btn-join").css("display","block");
		$(".btn-main").css("display","none");
		$(".btn-subscript").css("display","none");	
	</c:if>
	
	
	
	<c:if test="${memberLv.memlevel == -10}">
		$(".btn-close").css("display","none");
		$(".btn-join").css("display","none");
		$(".btn-main").css("display","none");
		$(".btn-subscript").css("display","block");	
	</c:if>
	
	<c:if test="${memberLv.memlevel == 0}">
		$(".btn-close").css("display","none");
		$(".btn-main").css("display","block");
		$(".btn-join").css("display","none");
		$(".btn-subscript").css("display","none");
	</c:if>
	
	<c:if test="${memberLv.memlevel == 1}">
		$(".btn-close").css("display","none");
		$(".btn-main").css("display","block");
		$(".btn-join").css("display","none");
		$(".btn-subscript").css("display","none");
	</c:if>
	
	<c:if test="${memberLv.memlevel == 2}">
		$(".btn-close").css("display","none");
		$(".btn-main").css("display","block");
		$(".btn-join").css("display","none");
		$(".btn-subscript").css("display","none");
	</c:if>

	<c:if test="{memberLv.preNum >= memberLv.max}">
	
		$(".btn-close").css("display","block");
		$(".btn-join").css("display","none");
		$(".btn-main").css("display","none");
		$(".btn-subscript").css("display","none");	
	</c:if>

	
</script>


</html>