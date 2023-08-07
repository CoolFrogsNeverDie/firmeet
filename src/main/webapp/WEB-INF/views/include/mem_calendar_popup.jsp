<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
     <!-- 일정 등록모달창-->
<div class="container1" >
  <div class="popup-wrap" id="popup">
    <div class="popup" >
      <div class="popup-head">
        <div class="popup-close-btn">X</div>
      </div>
      <div class="popup-body">
        <div class="body-content">
          <div class="body-titlebox">
            <h4><strong>일정등록</strong></h4>
            
          </div>
       <form action="${pageContext.request.contextPath}/calendar/member/add-persche" method = "GET" class= "add-persche">
            <input type="hidden" id = "address1" name = "address1" value = "-1">
            <input type="hidden" id = "address2" name = "address2" value ="-1">
            <input type="hidden" name = "memberId" value = "${member.memberId}" id = "memId">
            <input type="hidden" id = "marker_place">
          <div class="body-contentbox">
            <table id = "schedule-table">
              <tr>
                <th>일정</th>
                <td><input type="text" placeholder="일정명을 입력하세요." id = "title" name = "title" placeholder="일정명을 입력해주세요!"> </td>
              </tr>
              <tr>
                <th rowspan="2">일정</th>
                <td rowspan="2"><input type="date" id = "startD" name = "startDate">&nbsp; ~&nbsp; 
                <input type="date" id = "endD" name ="endDate" ></td>
              </tr>
              <tr>
              </tr>
              <tr>
                <th>장소등록</th>
                <td>
				<span class= "checkbox-loca"><input type ="checkbox" id = "loca-insert-select" > &nbsp;장소 찾기 </span>
				  <div class= "loca-btn-area">
                <input type = "text" class= "search-place" id  = "place"  readonly placeholder=" 키워드를 입력해주세요!"><button type= "button" class="map-search-btn ct-color">위치검색</button></div>
				<span><input type = "text" readonly name = "place" id = "place-result" value ="" ></span>
              </td>                
                
              </tr>
              <tr class="content-area">
                <th>내용</th>
                <td><textarea name = "content" id = "content" placeholder ="내 일정에 대해 50자 이내로 작성해주세요!"></textarea></td>
              </tr>
            </table>
            
          </div>
          <div class="sche-submit-btn">
            <button type ="submit" class= "ct-color">등록</button>
            <button type ="button">취소</button>
          </div>
       </form>
          
        </div>
      </div>
    </div>
</div>
</div>
<!--모달창-->


<!-- 지도 위치 검색 모달창-->
<div class="container2" >

  <div class="popup-wrap2" id="popup">
    <div class="popup" id = "2th-popup" class= "">
      <div class="popup-head">
        <div class="popup-close-btn2">X</div>
      </div>
      <div class="popup-body">
        <div class="body-content">
       <form action="http://localhost:8000/link/search/" method = "get">
          <div class="body-titlebox">
            <h4><strong>지도 선택</strong></h4>

          </div>
          <div class="body-contentbox">
            <div id="map" style="width:500px;height:400px; display:block; "></div>
          </div>
       </form>
          
        </div>
      </div>
    </div>
</div>
</div>
<!--지도 팝업창-->

<!--개인 일정 확인 팝업창-->
<div class= "container4">
<div class="per-pop">
  <div class="per-pop-header" >
    <div class="per-pop-close-btn">X</div>
  </div>
  <div class="per-pop-body">
    <div class="per-pop-content">
      <div class="body-titlebox"><h4><strong>나의 일정</strong></h4></div>
      <table id = "schedule-table">
        <tr>
          <th>일정</th>
          <td class="de-title"></td>
        </tr>
        <tr>
          <th rowspan="2">일정</th>
          <td rowspan="2"><input type="date" name = "startDate" class="de-start" readonly>&nbsp; ~&nbsp; 
          <input type="date" id = "endD" name ="endDate" class="de-end" readonly ></td>
        </tr>
        <tr>
        </tr>
        <tr>
          <th>장소</th>
          <td><span class="de-place"></span> &nbsp;&nbsp;<button type ="button" class="see-place ct-color" id = "see-map">길찾기</button></td>
        </tr>
        <tr class="content-area">
          <th>내용</th>
          <td><textarea name = "content" class="de-content" readOnly></textarea>
          <div id="map2" ></div></td>
        </tr>
      </table>

        <div class="per-sche-edit">
          <button type = "button" class="edite-btn ct-color" >수정</button>
          <button type = "button" class= "delete-per" id = "delete-per">삭제</button>
        </div>
    </div><!--per-pop-content-->

  </div><!--popup body-->
</div> <!--popup end-->
</div>


  
<!--//개인 일정 확인 팝업창//-->  
 
<!---             일정 수정 팝업             --->
 
 <div class="container5" >
  <div class="popup-wrap">
    <div class="popup">
      <div class="popup-head">
        <div class="popup-close-btn3">X</div>
      </div>
      <div class="popup-body">
        <div class="body-content">
          <div class="body-titlebox">
            <h4><strong>일정수정</strong></h4>
            
          </div>
       <form action="${pageContext.request.contextPath}/calendar/member/edit-persche" method = "GET" class= "edit-persche">
            <input type="hidden" id = "edit-address1" name = "address1" value = "-1">
            <input type="hidden" id = "edit-address2" name = "address2" value ="-1">
            <input type="hidden" name = "memberId" value = "${member.memberId}" id = "edit-memId">
            <input type="hidden" name = "perScheNo" id = "edit-perScheNo">
          <div class="body-contentbox">
            <table id = "schedule-table">
              <tr>
                <th>일정</th>
                <td><input type="text" placeholder="일정명을 입력하세요." id = "edit-title" name = "title"> </td>
              </tr>
              <tr>
                <th rowspan="2">일정</th>
                <td rowspan="2"><input type="date" id = "edit-startD" name = "startDate">&nbsp; ~&nbsp; 
                <input type="date" id = "edit-endD" name ="endDate" ></td>
              </tr>
              <tr>
              </tr>
              <tr>
                <th>장소등록</th>
                <td>
				<span class= "checkbox-loca"><input type ="checkbox" id = "edit-place-checked" > &nbsp;장소 변경 </span>
				<span><input type = "text" readonly name = "place" id = "edit-place-result" value =""></span>
                <input type = "text" class= "search-place" id  = "edit-place"  readonly><button type= "button" class="map-search-btn2 ct-color" disabled>위치검색</button></td>
              </tr>
              <tr class="content-area">
                <th>내용</th>
                <td><textarea name = "content" id = "edit-content"></textarea></td>
              </tr>
            </table>
            
          </div>
          <div class="sche-submit-btn">
            <button type ="submit" class= "ct-color">수정</button>
            <button type ="button" class = "popup-close-btn3">취소</button>
          </div>
       </form>
          
        </div>
      </div>
    </div>
</div>
</div>
<!--//             일정 수정 팝업              //-->


<!-- 지도 위치 검색 모달창-->
<div class="container6" >

  <div class="popup-wrap" id="popup">
    <div class="popup" id = "2th-popup" class= "">
      <div class="popup-head ">
        <div class="popup-close-btn4">X</div>
      </div>
      <div class="popup-body">
        <div class="body-content">
       <form action="http://localhost:8000/link/search/" method = "get">
          <div class="body-titlebox">
            <h4><strong>지도 선택</strong></h4>
			
          </div>
          <div class="body-contentbox">
            <div id="map3" style="width:500px;height:400px; display:block; "></div>
          </div>
       </form>
          
        </div>
      </div>
    </div>
</div>
</div>
<!--지도 팝업창-->