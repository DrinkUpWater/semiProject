<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=">
    <title>KH ROOMMOAH</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/91f9609a45.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=ZCOOL+KuaiLe&display=swap" rel="stylesheet">

<style>
    * {
        font-family: "Noto Sans KR", sans-serif;
        font-optical-sizing: auto;
        font-weight: weight;
        font-style: normal;
    }
    #wrapper{
        width: 1200px;
        margin: 10px auto;
        
    }
    .login-area{
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid black;
        
    }
    a {
        text-decoration: none;
        color: black;
    }
    #right-bar a:hover{
        text-decoration: none;
        color: black;
        font-weight: bold;
    }
    #left-bar{
        margin-left: 10px;
    }
    #left-bar i:hover{
        
    }
    #right-bar{
        margin-right: 10px;
    }
    .login-area h2{
        font-family:'ZCOOL KuaiLe';
        font-weight: bold;
    }
    .side-menu, .side-menu-host{
        
        width: 300px;
        background-color: rgb(233, 233, 233);
    }
    .side-profile {
        width: 100%;
        height: 130px;
        background-color: #fed636;
        display: flex;
        align-items: center;
        padding-left: 25px;
    }
    .side-profile-picture{
        width : 100px;
        height : 100px;
        border-radius: 50%;
        background-color: rgb(199, 199, 199);
    }
    .side-profile-nickname{
        margin-left: 20px;
    }
    .side-logo, .side-tohost {
        background-color: #704DE4;
        color: white;
        height: 70px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .side-logo>h3 {
        font-family:'ZCOOL KuaiLe';
    }
    .side-list table {
        width: 100%;
        background-color: white;
    }
    .side-list table th{
        border: 1px solid rgb(204, 204, 204);
        border-left: none;
        border-right: none;
        border-collapse: collapse;
        height: 70px;
    }
    .side-tohost>p {
        margin: 0;
        padding: 0;
        font-size: 20px;
    } 
    .side-menu{
        display: none;
    }
    .login-area{
        margin-bottom: 30px;
    }

    .side-menu {
        display: none;
    }
    .side-menu-host{
        display:none;
    }
   
    
</style>
</head>
<body>
    <div id="wrapper">
        
        <!-- 로그인 전 -->
        <div class="login-area">
            <div id="left-bar">
                <i class="fa-solid fa-bars fa-xl"></i>
            </div>
            <h2>kH ROOMMOAH</h2>
            <div id="right-bar">
                <a href="">회원가입</a> | <a href="">로그인</a>
            </div>
        </div>
        
        
        <!-- 로그인 후 -->
        <!-- <div class="login-area">
            <div id="left-bar">
                <i class="fa-solid fa-bars fa-xl"></i>
            </div>
            <h2>kH ROOMMOAH</h2>
            <div id="right-bar">
                <a href="">닉네임</a> | <a href="">로그아웃</a>
            </div>
        </div> -->
    
        <!-- 사이드 메뉴 왼쪽위 클릭시 나오게 -->
        <!-- 일반 -->
        <div class="side-menu" align="center">
            <div class="side-profile">
                <div class="side-profile-picture"></div>
                <div class="side-profile-nickname">
                    <br>
                    <b>닉네임</b>
                    <p>프로필관리 ></p>
                </div>
            </div>

            <div class="side-logo">
                <h3>kH ROOMMOAH</h3>
            </div>

            <br><br><br>
            
            <div class="side-list">
                <table>
                    
                    <tr align="center">
                        <th >홈</th>
                    </tr>
                    <tr align="center">
                        <th>예약 리스트</th>
                    </tr>
                    <tr align="center">
                        <th>찜한 공간</th>
                    </tr>
                    <tr align="center">
                        <th>공지사항</th>
                    </tr>
                </table>
            </div>

            <br><br><br><br>
            
            <a href="">로그아웃</a>
            <br>
            <br>
            <div class="side-tohost">
                <p>호스트센터로 이동 > </p>
            </div>
        </div>


        <!-- 사이드 메뉴 왼쪽위 클릭시 나오게 -->
        <!-- 호스트메뉴 -->
        <div class="side-menu-host" align="center">
            <div class="side-profile">
                <div class="side-profile-picture"></div>
                <div class="side-profile-nickname">
                    <br>
                    <b>닉네임</b>
                    <p>프로필관리 ></p>
                </div>
            </div>

            <div class="side-logo">
                <h3>kH ROOMMOAH</h3>
            </div>

            <br><br><br>
            
            <div class="side-list">
                <table>
                    
                    <tr align="center">
                        <th >홈</th>
                    </tr>
                    <tr align="center">
                        <th>내 공간</th>
                    </tr>
                    <tr align="center">
                        <th>정산</th>
                    </tr>
                    <tr align="center">
                        <th>공지사항</th>
                    </tr>
                </table>
            </div>

            <br><br><br><br>
            
            <a href="">로그아웃</a>
            <br>
            <br>
            <div class="side-tohost">
                <p >스페이스클라우드로 이동 > </p>
            </div>
        </div>

    </div>
</body>
</html>