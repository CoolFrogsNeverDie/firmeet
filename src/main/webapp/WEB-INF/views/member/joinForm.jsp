<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<title>회원가입</title>
<style>
	*{margin: 0; padding: 0; list-style: none; font-family: 'Pretendard-Regular';}
    @font-face {
         font-family: 'Pretendard-Regular';
         src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
         font-weight: 100,200,300,400,500,600,700,800,900;
         font-style: normal;}
     h6{
        margin-top: 10px;
            }
    .tagbtn{
        border-radius: 10px 10px 10px 10px;
        border: 1px solid #fff;
        color: gray;
            }
    .modal-title{
    	width:300px;
    	display:block;
        margin:auto;
            }
    .search{
        border: 1px solid #fff;
        color: gray;
            }
    .searchtext{
        border-radius: 10px 10px 10px 10px;
        border: 1px solid gray;
        margin-left: 20px;
            }
    .container{ 
    	width:70vw;
    	margin:auto;
        }   

</style>
</head>
<body>
	<h4 class="modal-title">회원가입</h4>
	<div class="modal-body">
	                <div class="container">
	                    <form method="post" action="/firmeet/member/join">
	                   
	                        <table class="table" style="text-align: center; border: 1px solid #dddddd">
	                            <tbody>
	                                <tr>
	                                    <td style="width: 110px;"><h6>아이디</h6></td>
	                                    <td>
	                                        <input class="form-control" type="text" id="" name="memberId" maxlength="20" required="required" placeholder="아이디를 입력해주세요.">
	                                    </td>
	                                    <td style="width: 110px;">
	                                        <button class="btn btn-primary" id="btnIdCheck" onclick="" type="button">중복체크
	                                        </button>
	                                        <span id="idcheckMsg"></span>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="width: 110px;"><h6>핸드폰 번호</h6>
	                                    <td>
	                                        <input class="form-control" type="tel" id="" name="memberPhone" pattern="(010)-\d{4}-\d{4}" placeholder="01X-XXXX-XXXX">
	                                    </td>
	                                    <td style="width: 130px;">
	                                        <button class="btn btn-primary" onclick="" type="button">핸드폰 인증
	                                        </button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="width: 110px;"><h6>이름</h6>
	                                    <td colspan="2">
	                                    <input class="form-control" type="text" id="" name="memberName" maxlength="20" required="required" placeholder="이름을 입력해주세요.">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="width: 110px;"><h6>비밀번호</h6>
	                                    <td colspan="2">
	                                        <input class="form-control" type="password" onkeyup=""; id="" name="memberPw" maxlength="20" required="required" placeholder="비밀번호를 입력해주세요.">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="width: 120px;"><h6>비밀번호 확인</h6>
	                                    <td colspan="2">
	                                        <input class="form-control" type="password" onkeyup="passwordCheckFunction()"; id="" name="" maxlength="20" required="required" placeholder="비밀번호 확인을 입력해주세요.">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="width: 110px;"><h6>관심사</h6>
	                                    <td colspan="2">
	                                        <div class="form-group" style="text-align: center; margin: 0 auto;">
	                                            <input type="radio" name="memberPri" value="해당 없음" checked>해당 없음 &nbsp;
	                                            <input type="radio" name="memberPri" value="운동/액티비티" >운동/액티비티 &nbsp;
	                                            <input type="radio" name="memberPri" value="스터디">스터디 &nbsp;<br>
	                                            <input type="radio" name="memberPri" value="친목">친목 &nbsp;
	                                            <input type="radio" name="memberPri" value="건강/음식">건강/음식 &nbsp;
	                                            <input type="radio" name="memberPri" value="언어/문화">언어/문화 &nbsp;
	                                            <input type="radio" name="memberPri" value="종교">종교<br> 
	                                            <input type="radio" name="memberPri" value="교육/학습">교육/학습 &nbsp;
	                                            <input type="radio" name="memberPri" value="음악/예술">음악/예술 &nbsp;
	                                            <input type="radio" name="memberPri" value="여행">여행
	                                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="width: 110px;"><h6>선호태그</h6>
	                                    <td colspan="2">
	                                        <div>
                                                <button class="tagbtn">#운동광</button>
                                                <button class="tagbtn">#수다왕</button>
                                                <button class="tagbtn">#INTP</button><br>
                                                <button class="tagbtn">#갓생러</button>
                                                <button class="tagbtn">#여유로운</button>
                                                <button class="tagbtn">#핫한</button><br>
                                                <button class="tagbtn">#로맨틱</button>
                                                <button class="tagbtn">#핵인싸</button>
                                                <button class="tagbtn">#소통왕</button>
                                                <div style="margin-top: 10px;">
                                                    <input type="text" name="keyword" class="searchtext" />
    ​​​​​​​                                                <button type="submit" class="search">검색</button>
                                                </div>
	                                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td style="text-align: center" colspan="3">
	                                        <h6 style="color : red;" id="passwordCheckMessage"></h6>
	                                        <input class="btn btn-secondary" type="submit" value="Join">
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </form>
	                </div>
	            </div>

</body>
<script type="text/javascript">

	//아이디 체크 버튼 클릭했을때
	$("#btnIdCheck").on("click", function(){
		console.log("버튼 클릭");
		
		//id 추출
		var id = $("[name=memberId]").val();
		
		console.log(id);
		
		//통신  id////////////////////////////////////////////
		$.ajax({
			url : "firmeet/member/idcheck",		
			type : "post",
			/* contentType : "application/json", */
			data : {memberId : id},
	
			dataType : "json",
			success : function(jsonResult){
				console.log(jsonResult);
				
				if(jsonResult.result == 'success'){ //처리성공
					//사용가능한지 불가능 한지 표현한다
					if(jsonResult.data == true){
						//사용가능
						$("#idcheckMsg").html( id+ "는 사용가능 합니다.");    
					}else {
						//사용불가
						$("#idcheckMsg").html( id+ "는 사용중입니다.");    
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

</script>


</html>