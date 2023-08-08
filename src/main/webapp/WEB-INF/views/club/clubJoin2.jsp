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
    <link href="${pageContext.request.contextPath}/assets/css/clubJoin.css" rel="stylesheet" type="text/css" />
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />

</head>

<body>
    <div class="ly-head-container">
		<header>
			<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
		</header>
	</div>


    <div class="wrap">
        <!--메인라인-->        
        <div class="back-img"><img src="${pageContext.request.contextPath}/upload/clubimg/${clubVo.img1}" >배경 이미지</div>
        <div class="color-box">
            <div class="main-img"><img src="${pageContext.request.contextPath}/upload/clubimg/${clubVo.img2}"
                    class="main-img-file"></div>
            <div class="club-title">
                <h4>${clubVo.clubName}</h4>
            </div><br>
            <div class="club-memeber-cnt">(${clubVo.preNum}/${clubVo.max})</div>
            <div class="club-intro">${clubVo.intro1}</div>
            <div class="club-tag">
	            <ul>
	            	<c:forEach items="${tagList}" var="tag">
						<li><span>#</span>${tag.tagName}</li>
					</c:forEach>
	            </ul>
            </div>
            <div class="join-btn-area">
            	<button type="button" class= "join-btn btn-subscript">가입 신청됨</button>
            	<button type="button" class= "join-btn btn-close">마감</button>
            	<a href ="${pageContext.request.contextPath }/club/clubJoin/${clubVo.clubId}"><button type="button" class= "join-btn btn-join" style = "display: inline-block;">회원가입</button></a>
            	<a href ="${pageContext.request.contextPath }/club/main/${clubVo.clubId}"><button type="button" class= "join-btn btn-main">모임 메인으로 가기</button></a>
            </div>
        </div>
        <!--메인라인 종료-->


        <!--상세 설명 -->
        <div class="intro-detail">
        	<h4>모임을 소개 합니다.</h4>
            <div class="detail-text">
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
                        <p>${clubVo.detailT}</p>
                    </td>
                    <td class="info-icon"><i class="fa fa-cutlery" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>${clubVo.detailE}</p>
                    </td>
                </tr>
                <tr>
                    <td class="info-icon"><i class="fa fa-map-marker" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>${clubVo.detailL}</p>
                    </td>
                    <td class="info-icon"><i class="fa fa-cloud" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>${clubVo.detailW}</p>
                    </td>
                </tr>
                <tr>
                    <td class="info-icon"><i class="fa fa-commenting-o" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>${clubVo.detailP}</p>
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
       
    </div>
</body>
<footer>
    &copy; 2023 by 어리쥬. All Page content is property of 어리쥬
</footer>

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
		//	$(".btn-join").css("display","block");
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