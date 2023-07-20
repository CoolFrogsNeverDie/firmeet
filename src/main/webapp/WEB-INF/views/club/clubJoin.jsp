<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/hierarchy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
            margin-left: 15%;
            margin-right: 15%;
            width: 70vw;
            height: 2000px;
        }

        .back-img {
            width: 100%;
            height: 400px;
            border-bottom: 1px solid gray;
        }

        .color-box {
            width: 100%;
            height: 420px;
            background-color: #faf6ea;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .main-img {
            border: 1px solid gray;
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

        .club-title {

            font-size: 38px;
            margin-top: 130px;
        }

        .club-memeber-cnt {
            margin-top: -20px;
        }

        .club-intro {
            margin-top: 40px;
            font-size: 130%;
        }

        .club-tag {
            margin-top: 40px;
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
            border-radius: 5px;
            color: white;
            font-size: 17px;
        }

        .intro-detail {
            margin-top: 3%;
            margin-bottom: 3%;
            margin-left: 17%;
            margin-right: 17%;
        }

        .detail-text {
            line-height: 140%;
            font-size: 110%;
            font-size: 1vw;
            font-family: 'NanumBarunGothicLight';
            margin: 3%;
            margin-top: 10%;
            margin-bottom: 5%;
        }

        .detail-info {
            width: 60vw;
            margin: 0 auto;
            margin-top: 100px;
        }

        .detail-title {
            font-size: 1.3vw;
            padding: 10px;
        }

        .detail-info-table {
            width: 50vw;
            margin: 0 auto;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        .detail-info-table tr {
            height: 50px;
        }

        .info-icon {
            width: 10%;
        }

        .info {
            width: 40%;
        }

        .info p {
            margin-top: 13px;
            margin-left: 5px;
        }

        .info-icon {
            text-align: center;
            font-size: 25px;
        }

        .tag-info {
            width: 60vw;
            margin: 0 auto;
            margin-top: 100px;
            margin-bottom: 100px;
            height: 320px;
            background-color: #e0e0e0;
            position: relative;
        }

        #chartdiv {
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
    <div class="wrap">
        <!--메인라인-->
        <div class="back-img">배경 이미지</div>
        <div class="color-box">
            <div class="main-img"><img src="https://sitem.ssgcdn.com/64/46/21/item/1000524214664_i1_500.jpg"
                    class="main-img-file"></div>
            <div class="club-title">
                <h1>어푸어푸</h1>
            </div><br>
            <div class="club-memeber-cnt">(1/5)</div>
            <div class="club-intro">물을 보면 심장이 뛴다? 그럼 당신은 어푸어푸 회원!</div>
            <div class="club-tag">#성인수영 #새벽수영 #갓생 #친목 #운동러버 #초보환영</div>
            <div class="join-btn-area"><button type="button" class="join-btn" action="">가입 신청</button></div>
        </div>
        <!--메인라인 종료-->


        <!--상세 설명 -->
        <div class="intro-detail">
            <div class="detail-text">안녕하세요.
                <br>지구 면적 71%를 차지하고 있는 물과 함께 하는 수영 동호회 어푸어푸의 호스트 김수영입니다.
                <br>어푸어푸에서는 매주 화 목 토 새벽에 모여 약간의 친목이 섞인 수영 모임을 진행하고 있어요.
                <br>친목은 자유! 끝나고 식사 참여도 자유! 평등하고 편안한 분위기를 지향하고 있습니다.
                <br>소규모 그룹이라 한 명 한 명 모두가 편하게 지내고 있어요.
                <br>저희 같이 재밌게 운동해봐요!<br>
                <br>8/1 한강 수영대회 대비 집중 운동기간입니다.
                <br>대회 준비하시는 분들 들어오셔서 함께 준비해요!
                <br>궁금하신 점은 문의 게시판으로 편하게 문의 주세요-!
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
                        <p>매주화목금 아침 7시</p>
                    </td>
                    <td class="info-icon"><i class="fa fa-cutlery" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>연 2회 회식</p>
                    </td>
                </tr>
                <tr>
                    <td class="info-icon"><i class="fa fa-map-marker" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>성수동 근처</p>
                    </td>
                    <td class="info-icon"><i class="fa fa-cloud" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>날씨 상관 없음!</p>
                    </td>
                </tr>
                <tr>
                    <td class="info-icon"><i class="fa fa-commenting-o" aria-hidden="true"></i></td>
                    <td class="info">
                        <p>단톡방 있음</p>
                    </td>
                    <td class="info-icon"></td>
                    <td class="info">
                        <P>공란</p>
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
                <h4>문의사항(2건)</h4><button type="button" class="qna-btn">문의하기</button>
            </div>

            <!--문의사항 입력 영역(문의하기 버튼 눌러야 보임)-->
            <div class="qna-write-area">
                <div  class= "qna-write"><textarea>문의사항 입력창</textarea><button type="submit" class="qna-write-btn">문의 등록</button></div>
                <div></div>
            </div>
            <!--문의사항 입력 영역-->

            <!--반복될 QNA 영역-->
            <div class="qna-content-area">
                <div class="qna-icon"><img src="https://qai.org.au/wp-content/uploads/2021/03/grey-person-icon-300x298.png" ></div>
                <div class="qna-content content"><p>문의<p></div>
            </div>
            <div class="qna-answer-area">
                <div class="answer-content content"><p>답변</p></div>
            </div>
            <!--반복될 QNA 영역 end-->
        
        </div>

        <!--답답해 보이지 않게 스크롤 늘여주는 div-->
        <div class="clear"></div>

        <div class= "join-btn-last">
            <button type="button" class= "join-btn">회원가입</button>
        </div>
    </div>
</body>
<style>
    /*주요 태그 영역*/
    .tag-info-title {
        font-size: 1.3vw;
        padding: 10px;
        height: 20%;
    }
    
    /*버블 차트 영역*/
    .chart-area {

        width: 90%;
        margin: 0 auto;
        margin-top: -35px;
        height: 83%;
    }

    
    /*문의 영역*/
    .club-qna-area {
        width: 60vw;
        margin: 0 auto;
        margin-top: 30px;
    }
    .qna-title {
        font-size: 1.3vw;
        padding: 20px;
        border-bottom: 1px solid black;
        padding-bottom: 20px;
        height: 2vw;
    }
    .qna-title h4 {
        float:left;
        font-size: 1.3vw;
    }
    .qna-btn{
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
        width: 60vw;
        height: 180px;
        border: #e0e0e0;
        display: none;
    }
    .qna-write{
        float: right;
        margin-right: 2.5%;
        margin-top: 2%;
        width: 50vw;
        height: 130px;
    }
    .qna-write-btn{
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
        width:85%;
        height: 100%;
    }
    .qna-content-area {
        width: 58vw;
        height: 130px;
        margin: 0 auto;
        margin-top: 20px;
    }
    .qna-icon {
        float: left;
    
        height: 5.5vw;
        width: 12%;
    }
    .qna-icon > img {
        width: 60%;
        height: 60%;
        padding: 5%;
        padding-bottom: 25%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .qna-content {
        float: left;
        border: 1px solid black;
        width: 87.4%;
        height: 100%;
        
    }
    /*문의 답변 영역*/
    .qna-answer-area {

        width: 58vw;
        margin: 0 auto;
        height: 150px;
    }
    .answer-content {
        margin: 1.5%;
        width: 85%;
        height: 80%;
        float: right;
        background-color: #fafafa;
        box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
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
    am5.ready(function () {

        // Create root element
        // https://www.amcharts.com/docs/v5/getting-started/#Root_element
        var root = am5.Root.new("chartdiv");

        // Set themes
        // https://www.amcharts.com/docs/v5/concepts/themes/
        // root.setThemes([
        //   am5themes_Animated.new(root)
        // ]);

        var data = {
            value: 0,
            children: []
        }

        /*원형차트 데이터 넣기*/
        var chart1 = data.children.push({ name: "#활발한 ", value: 30 })
        var chart2 = data.children.push({ name: "#인싸환영", value: 2 })
        var chart3 = data.children.push({ name: "#조용한", value: 70 })
        var chart4 = data.children.push({ name: "#분위기있는", value: 10 })
        var chart4 = data.children.push({ name: "#재밌는", value: 10 })


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

    }); // end am5.ready()

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
</script>
</html>