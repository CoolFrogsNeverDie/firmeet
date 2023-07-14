<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>어푸어푸 갤러리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/lightbox.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath }/assets/css/main2.css"
	rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
            $(document).ready(function() {
                $("#input_file").bind('change', function() {
                    selectFile(this.files);
                    //this.files[0].size gets the size of your file.
                    //alert(this.files[0].size);
                });
            });
        
            // 파일 리스트 번호
            var fileIndex = 0;
            // 등록할 전체 파일 사이즈
            var totalFileSize = 0;
            // 파일 리스트
            var fileList = new Array();
            // 파일 사이즈 리스트
            var fileSizeList = new Array();
            // 등록 가능한 파일 사이즈 MB
            var uploadSize = 50;
            // 등록 가능한 총 파일 사이즈 MB
            var maxUploadSize = 500;
    
            $(function() {
                // 파일 드롭 다운
                fileDropDown();
            });
    
            // 파일 드롭 다운
            function fileDropDown() {
                var dropZone = $("#dropZone");
                //Drag기능 
                dropZone.on('dragenter', function(e) {
                    e.stopPropagation();
                    e.preventDefault();
                    // 드롭다운 영역 css
                    dropZone.css('background-color', '#E3F2FC');
                });
                dropZone.on('dragleave', function(e) {
                    e.stopPropagation();
                    e.preventDefault();
                    // 드롭다운 영역 css
                    dropZone.css('background-color', '#FFFFFF');
                });
                dropZone.on('dragover', function(e) {
                    e.stopPropagation();
                    e.preventDefault();
                    // 드롭다운 영역 css
                    dropZone.css('background-color', '#E3F2FC');
                });
                dropZone.on('drop', function(e) {
                    e.preventDefault();
                    // 드롭다운 영역 css
                    dropZone.css('background-color', '#FFFFFF');
    
                    var files = e.originalEvent.dataTransfer.files;
                    if (files != null) {
                        if (files.length < 1) {
                            /* alert("폴더 업로드 불가"); */
                            console.log("폴더 업로드 불가");
                            return;
                        } else {
                            selectFile(files)
                        }
                    } else {
                        alert("ERROR");
                    }
                });
            }
    
            // 파일 선택시
            function selectFile(fileObject) {
                var files = null;
    
                if (fileObject != null) {
                    // 파일 Drag 이용하여 등록시
                    files = fileObject;
                } else {
                    // 직접 파일 등록시
                    files = $('#multipaartFileList_' + fileIndex)[0].files;
                }
    
                // 다중파일 등록
                if (files != null) {
                    
                    if (files != null && files.length > 0) {
                        $("#fileDragDesc").hide(); 
                        $("fileListTable").show();
                    } else {
                        $("#fileDragDesc").show(); 
                        $("fileListTable").hide();
                    }
                    
                    for (var i = 0; i < files.length; i++) {
                        // 파일 이름
                        var fileName = files[i].name;
                        var fileNameArr = fileName.split("\.");
                        // 확장자
                        var ext = fileNameArr[fileNameArr.length - 1];
                        
                        var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
                        console.log("fileSize="+fileSize);
                        if (fileSize <= 0) {
                            console.log("0kb file return");
                            return;
                        }
                        
                        var fileSizeKb = fileSize / 1024; // 파일 사이즈(단위 :kb)
                        var fileSizeMb = fileSizeKb / 1024;    // 파일 사이즈(단위 :Mb)
                        
                        var fileSizeStr = "";
                        if ((1024*1024) <= fileSize) {    // 파일 용량이 1메가 이상인 경우 
                            console.log("fileSizeMb="+fileSizeMb.toFixed(2));
                            fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
                        } else if ((1024) <= fileSize) {
                            console.log("fileSizeKb="+parseInt(fileSizeKb));
                            fileSizeStr = parseInt(fileSizeKb) + " kb";
                        } else {
                            console.log("fileSize="+parseInt(fileSize));
                            fileSizeStr = parseInt(fileSize) + " byte";
                        }
    
                        /* if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml' ]) >= 0) {
                            // 확장자 체크
                            alert("등록 불가 확장자");
                            break; */
                        if ($.inArray(ext, [ 'hwp', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'png', 'pdf', 'jpg', 'jpeg', 'gif', 'zip' ]) <= 0) {
                            // 확장자 체크
                            /* alert("등록이 불가능한 파일 입니다.");
                            break; */
                            alert("등록이 불가능한 파일 입니다.("+fileName+")");
                        } else if (fileSizeMb > uploadSize) {
                            // 파일 사이즈 체크
                            alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                            break;
                        } else {
                            // 전체 파일 사이즈
                            totalFileSize += fileSizeMb;
    
                            // 파일 배열에 넣기
                            fileList[fileIndex] = files[i];
    
                            // 파일 사이즈 배열에 넣기
                            fileSizeList[fileIndex] = fileSizeMb;
    
                            // 업로드 파일 목록 생성
                            addFileList(fileIndex, fileName, fileSizeStr);
    
                            // 파일 번호 증가
                            fileIndex++;
                        }
                    }
                } else {
                    alert("ERROR");
                }
            }
    
            // 업로드 파일 목록 생성
            function addFileList(fIndex, fileName, fileSizeStr) {
                /* if (fileSize.match("^0")) {
                    alert("start 0");
                } */
    
                var html = "";
                html += "<tr id='fileTr_" + fIndex + "'>";
                html += "    <td id='dropZone' class='left' >";
                html += fileName + " (" + fileSizeStr +") " 
                        //+ "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'> 삭제</a>"
                        
                        + "<input value='삭제' type='button' href='#' onclick='deleteFile(" + fIndex + "); return false;'>"
                html += "    </td>"
                html += "</tr>"
    
                $('#fileTableTbody').append(html);
            }
    
            // 업로드 파일 삭제
            function deleteFile(fIndex) {
                console.log("deleteFile.fIndex=" + fIndex);
                // 전체 파일 사이즈 수정
                totalFileSize -= fileSizeList[fIndex];
    
                // 파일 배열에서 삭제
                delete fileList[fIndex];
    
                // 파일 사이즈 배열 삭제
                delete fileSizeList[fIndex];
    
                // 업로드 파일 테이블 목록에서 삭제
                $("#fileTr_" + fIndex).remove();
                
                console.log("totalFileSize="+totalFileSize);
                
                if (totalFileSize > 0) {
                    $("#fileDragDesc").hide(); 
                    $("fileListTable").show();
                } else {
                    $("#fileDragDesc").show(); 
                    $("fileListTable").hide();
                }
            }
    
            // 파일 등록
            function uploadFile() {
                // 등록할 파일 리스트
                var uploadFileList = Object.keys(fileList);
    
                // 파일이 있는지 체크
                if (uploadFileList.length == 0) {
                    // 파일등록 경고창
                    alert("파일이 없습니다.");
                    return;
                }
    
                // 용량을 500MB를 넘을 경우 업로드 불가
                if (totalFileSize > maxUploadSize) {
                    // 파일 사이즈 초과 경고창
                    alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
                    return;
                }
    
                if (confirm("등록 하시겠습니까?")) {
                    // 등록할 파일 리스트를 formData로 데이터 입력
                    var form = $('#uploadForm');
                    var formData = new FormData(form);
                    for (var i = 0; i < uploadFileList.length; i++) {
                        formData.append('files', fileList[uploadFileList[i]]);
                    }
    
                    $.ajax({
                        url : "업로드 경로",
                        data : formData,
                        type : 'POST',
                        enctype : 'multipart/form-data',
                        processData : false,
                        contentType : false,
                        dataType : 'json',
                        cache : false,
                        success : function(result) {
                            if (result.data.length > 0) {
                                alert("성공");
                                location.reload();
                            } else {
                                alert("실패");
                                location.reload();
                            }
                        }
                    });
                }
            }
        </script>
<style>
.upload-btn-wrapper {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.upload-btn {
	border: 2px solid gray;
	color: gray;
	background-color: white;
	padding: 8px 20px;
	border-radius: 8px;
	font-size: 20px;
	font-weight: bold;
	margin-top:10px
}

.upload-btn-wrapper input[type=file] {
	font-size: 100px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}

.dropZone {
	width: 500px;
	height: 300px;
	border: 3px solid black;
	box-sizing: border-box; /* 추가 */
}

#fileDragDesc {
	width: 100%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
	text-align: center;
	line-height: 300px;
	vertical-align: middle;
}

.btn {
	width: 250px;
	height: 60px;
	margin: 10px auto;
	background-color: black;
	color: white;
}
</style>
</head>

<body>
	<!----------------------------------------- top Navigation ----------------------------------------->
	<nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="https://placeholder.pics/svg/150x50/888888/EEE/Logo" alt="..."
				height="36" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#">링크</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							드롭다운 </a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">액션</a></li>
							<li><a class="dropdown-item" href="#">다른 액션</a></li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li><a class="dropdown-item" href="#">다른 항목</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!----------------------------------------- // 상단 내비게이션 바 //----------------------------------------->
	<!-- 페이지 콘텐츠 -->

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img"
					src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg"
					alt="프로필사진" />
				<h1>어푸어푸</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>다이어리 메인</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-right">
					<div class="upload-btn-wrapper">
						<input type="file" id="input_file" multiple="multiple"
							style="height: 100%;" />
						<button class="upload-btn">파일선택</button>
					</div>
					<br />

					<form name="uploadForm" id="uploadForm"
						enctype="multipart/form-data" method="post">
						<div id="img"></div>
						<div id="dropZone" style="border: 2px; border-style: solid; border-color: black; ">
							<div id="fileDragDesc">파일을 드래그 해주세요.</div>
							<table id="fileListTable" width="100%" border="0px">
								<tbody id="fileTableTbody">

								</tbody>
							</table>
						</div>
					</form>
					<input type="button" onclick="uploadFile(); return false;"
						class="btn bg_01" value="파일 업로드">
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<div class="menu-bar" name="사이드메뉴바">
			<div class="group-profile">
				<div class="group-profile-img-area">
					<img class="group-profile-img"
						src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg"
						alt="프로필사진" />
				</div>
				<!--/group-profile-img-area-->
			</div>
			<!--/group-profile-->
			<ul class="side-nav">
				<li>공지사항</li>
				<li>갤러리</li>
				<li>달력</li>
				<li>자유 게시판</li>
				<li>멤버</li>
				<li>가계부</li>
			</ul>
			<!--/side-nav-->
		</div>
		<!--/menu-bar-->
	</div>
	<!--/wrap-->
</body>
</html>