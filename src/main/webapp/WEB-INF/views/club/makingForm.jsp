<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .container{
            width: 60vw;
            margin: 0 auto;
        }
        h2{
            color: purple;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .box{
            width: 60%;
            border-radius: 7px 7px 7px 7px;
            border: 1px solid rgb(221, 219, 219);
            margin-left: 80px;
        }
        .box1{
            margin-left: 60px;
        }
        .box2{
            width: 50px;
        }
        .box3{
            border: none;
        }
        .box4{
            margin-left: 135px;
        }
        .box5{
            margin-left: 55px;
        }
        .box6{
            margin-left: 135px;
        }
        .box7{
            margin-left: 140px;
        }
        .box8{
            margin-left: 10px;
            width: 200px;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .box9{
            margin-left: 350px;
        }
        .boxtext{
            font-size: 10px;
        }
        .box-file-input label{
            display:inline-block;
            background:#23a3a7;
            color:#fff;
            padding:0px 15px;
            line-height:35px;
            cursor:pointer;
        }
        .box-file-input label:after{
            content:"파일등록";
        }
        .box-file-input .file-input{
            display:none;
        }
        .box-file-input .filename{
            display:inline-block;
            padding-left:10px;
        }
        .TEXT1{
            width: 20vw;
        }
        .address{display:flex; width:60vw;}
        .address>select {width:25vw;}
    </style>
  </head>
<body>
    
<div class="container">
    <div class="py-5 text-center">
      <h2>퍼밋 동호회 등록</h2>
    </div>
    <div>
        <form>
          <div class="row g-3">
            <div>
                <label for="firstName">모임명</label>
                <input type="text" class="box" id="" placeholder="" name="clubName" value="" required>
            </div>

            <div class="col-sm-12">
                <label for="firstName">모임 분류</label>
                <span class="box box1 box3">
                    <input type="radio" name="clubCateNo" value="1" /> 운동/액티비티 &nbsp;
                    <input type="radio" name="clubCateNo" value="2" /> 스터디 &nbsp;
                    <input type="radio" name="clubCateNo" value="3" checked="checked" /> 친목</br>
                </span>
                <span class="box box1 box3 box4">
                    <input type="radio" name="clubCateNo" value="4" /> 건강/음식 &nbsp;
                    <input type="radio" name="clubCateNo" value="5" /> 언어/문화 &nbsp;
                    <input type="radio" name="clubCateNo" value="6" /> 종교</br>
                </span>
                <span class="box box1 box3 box4">
                    <input type="radio" name="clubCateNo" value="7" /> 교육/학습 &nbsp;
                    <input type="radio" name="clubCateNo" value="8" /> 음악/예술 &nbsp;
                    <input type="radio" name="clubCateNo" value="9" /> 여행</br>
                </span>
            </div>

            <div class="col-sm-12">
                <label for="firstName">모임 정원</label>
                <input type="text" class="box box1 box2" id="" placeholder="" name="max" value="" required> 명
            </div>

            <div class="col-sm-12">
                <label for="firstName">모임 태그</label>
                <input type="text" class="box box1" id="" placeholder="" value="" required>
            </div>

            <div class="col-sm-12">
                <label for="firstName">한 줄 소개</label>
                <input type="text" class="box box5 TEXT" id="" placeholder="" name="intro1" value="" required>
                <span style="color:#6b6969; font-size: 13px;" id="counter">(0 / 100)</span>
            </div>
            <div class="col-sm-12" class="address">
                <label for="firstName">주소</label>
                <select class="form-select " aria-label="Default select example" id="addressSi" name="address1"> </select>
            	<select class="form-select " aria-label="Default select example" id="addressSiGUnGu" name="address2"> </select>
            </div>

            <div class="col-sm-12">
                <label for="firstName">모임 소개</label></br>
                <textarea name="" class="box box6" id="" name="intro2" cols="30" rows="10"></textarea>
            </div>
            <div class="col-sm-12">
                <label for="firstName">상세 정보</label>
                <p class="boxtext">우리의 모임의 만나는 시간대, 장소, 단체카톡방 여부, 회식 여부, 날씨 영향 등에 대한 정보를 입력해보세요!</p>
                <div class="box7">
                    <img src="${pageContext.request.contextPath }/assets/images/icon/clock.png" width="30px" height="30px">
                    <input type="text" class="box box8" id="" placeholder="" name="detailT" value="" required>
                    <img src="${pageContext.request.contextPath }/assets/images/icon/vodka.png" width="30px" height="30px">
                    <input type="text" class="box box8" id="" placeholder="" name="detailL" value="" required>
                </br>
                <img src="${pageContext.request.contextPath }/assets/images/icon/place.png" width="30px" height="30px">
                <input type="text" class="box box8" id="" placeholder="" name="detailP" value="" required>
                <img src="${pageContext.request.contextPath }/assets/images/icon/cloud.png" width="30px" height="30px">
                <input type="text" class="box box8" id="" placeholder="" naem="detailE" value=""  required>
                </br>
                <img src="${pageContext.request.contextPath }/assets/images/icon/message.png" width="30px" height="30px">
                <input type="text" class="box box8" id="" placeholder="" name="detailW" value="" required>
                </div>
            </div>

            <div class="col-sm-12">
                <label for="firstName">메인 이미지</label></br>
                <img src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" class="box7" width="150px" height="150px">
                <div class="box-file-input box9"><label>
                    <input type="file" name="ev_display" class="file-input"></label>
                    <span class="filename">파일을 선택해주세요.</span>
                </div>
            </div>
            <div class="col-sm-12">
                <label for="firstName">배경 이미지</label></br>
                <img src="${pageContext.request.contextPath }/assets/images/testimg/back.jpg" class="box7" width="200px" height="150px">
                <div class="box-file-input box9"><label>
                    <input type="file" name="ev_display" class="file-input"></label>
                    <span class="filename">파일을 선택해주세요.</span>
                </div>
            </div>
          </div>
        </table>
          <hr class="my-8">
          <div style="text-align: center;">
            <button class="w-10 btn btn-primary btn-sm" type="submit" style="margin-right: 20px;">동호회 등록</button>
            <button class="w-10 btn btn-secondary btn-sm" type="submit">미리보기</button>
          </div>
        </br>
        </form>
      </div>
    </div>
</div>
</body>
<script>
    $('.TEXT').keyup(function (e){
        var content = $(this).val();
        $('#counter').html("("+content.length+" / 100)");    //글자수 실시간 카운팅

        if (content.length > 200){
            alert("최대 100자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 100));
            $('#counter').html("(100 / 100)");
        }
    });
</script>
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
        "경기도1" : ["수원시 장안구", "수원시 권선구", "수원시 팔달구", "수원시 영통구", "성남시 수정구", "성남시 중원구", "성남시 분당구", "의정부시", "안양시 만안구", "안양시 동안구", "부천시", "광명시", "평택시", "동두천시", "안산시 상록구", "안산시 단원구", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구"], 
        "경기도2" : ["과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시 처인구", "용인시 기흥구", "용인시 수지구", "파주시", "이천시", "안성시",      "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군","양평군"],
        "인천광역시" : ["계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"],
        "강원도" : ["춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"],
        "충청북도" : ["청주시 상당구", "청주시 서원구", "청주시 흥덕구", "청주시 청원구", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군" ],
        "충청남도" : ["천안시 동남구", "천안시 서북구", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"],
        "대전/세종" :[ "대덕구", "동구", "서구", "유성구", "중구" ,"세종특별자치시"],
        "전라북도" : [ "전주시 완산구", "전주시 덕진구", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군"],
        "전라남도" : ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군"],
        "광주광역시" : ["광산구", "남구", "동구", "북구", "서구"],
        "경상북도" : ["포항시 남구", "포항시 북구", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"],
        "경상남도" : ["창원시 의창구", "창원시 성산구", "창원시 마산합포구", "창원시 마산회원구", "창원시 진해구", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군"],
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

</html>