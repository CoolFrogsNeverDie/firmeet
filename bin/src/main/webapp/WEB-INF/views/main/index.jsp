<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>퍼밋에 오신것을 환영합니다.</title>
    <style>
        *{margin: 0; padding: 0; list-style: none; font-family: 'Pretendard-Regular';}
        .header {border:none;}
        @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 100,200,300,400,500,600,700,800,900;
        font-style: normal;
}
        h1 {font-size: 250px; width: 100%; position: absolute; bottom: 50px;
        line-height: 100%;}
        form{ position: absolute; width: 100vw; height: 40px; top: 150px;  display: flex; justify-content: center;
        }
        
        button>a{text-decoration: none;}
        input[type=search]{
            width: 25vw; font-size: 15px;
            border-radius: 20px 0 0 20px; 
            border: 2px solid #ddd;   
            border-right: none; 
        }
        #sbutton{
            background-color: #fff;
            border-radius: 0 20px 20px 0;
            width: 5vw;
            border: 2px solid #ddd;  
            border-left: none; 
        }
        .text-end {margin-right: 20px;}

        
    </style>

</head>




<body>
    <div class="header">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 ">
          <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
            로고
          </a>
    
         
    
          <div class="col-md-3 text-end ">
            <button type="button" class="btn btn-outline-primary me-2"><a href="http://localhost:8000/firmeet/member/loginForm">Login</a></button>
            <button type="button" class="btn btn-outline-primary me-2"><a href="http://localhost:8000/firmeet/member/joinForm">Join Us</a></button>
          </div>
        </header>
      </div>

    <h1>First Meet , <br> Perfect Meet</h1>
    <form>
        <input type="search" placeholder="   모임을 검색해 보세요">
        <button type="submit" id="sbutton" >검색</button>
    </form>

    
</body>
</html>