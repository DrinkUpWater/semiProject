<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");

    String alertMsg = (String)session.getAttribute("alertMsg");
%>  
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
    .login-area div {
    	width: 200px;
    }
    
    .login-area{
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid black;
        height: 60px;
        padding-top: 10px;
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
        cursor: pointer;
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
        padding-top: 8px;
    }
    .side-list table {
        width: 100%;
        background-color: white;
        cursor: pointer;
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
        cursor: pointer;
    } 
    .side-menu{
        
    }
    .login-area{
        margin-bottom: 30px;
    }

    .side-menu {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top:0;
        left:0;
        overflow-x: hidden;
        transition: 0.4s;
        padding-top: 69px;
        border-right: 1px solid rgb(204, 204, 204);
    }
    .side-menu-host{
        display:none;
    }
    .menubar-logo{
        cursor: pointer;
    }
    .x-icon{
    	position: absolute;
    	top: 75px;
    	right: 8px;
    	color : rgb(126, 126, 126);
        cursor: pointer;
    }
    
    
</style>
</head>
<body>
	<% if(alertMsg != null) {%>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>

    <div id="wrapper">
        
        <!-- 로그인 전 -->
        <c:choose>
        	<c:when test="${empty loginUser}">
		        <div class="login-area">
		            <div id="left-bar" >
		                <i class="fa-solid fa-bars fa-xl" onclick="openNav()"></i>
		            </div>
		          
		            <h2 class="menubar-logo" >kH ROOMMOAH</h2>
		
		            <div align="end" id="right-bar">
		                <a href="enrollForm.me">회원가입</a> | <a href="loginForm.me">로그인</a>
		            </div>
		        </div>
	        </c:when>
	        <c:otherwise>
		        <!-- 로그인 후 -->
		        <div class="login-area">
		            <div id="left-bar">
		                <i class="fa-solid fa-bars fa-xl"></i>
		            </div>
		            <h2>kH ROOMMOAH</h2>
		            <div id="right-bar">
		                <a href="myPage.me">${loginUser.nickName }</a> | <a href="logout.me">로그아웃</a>
		            </div>
		        </div>
        	</c:otherwise>
        </c:choose>
        
    </div>
        <!-- 사이드 메뉴 왼쪽위 클릭시 나오게 -->
        <!-- 일반 -->
        <div id="mySidenav" class="side-menu sidenav" align="center">
            <div class="side-profile">
	            <div class="x-icon">
		        	<i class="fa-solid fa-x fa-xl" onclick="closeNav()"></i>
		        </div>
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
                        <th class="home" >홈</th>
                    </tr>
                    <tr align="center">
                        <th class="book-list">예약 리스트</th>
                    </tr>
                    <tr align="center">
                        <th>찜한 공간</th>
                    </tr>
                    <tr align="center">
                        <th class="notice">공지사항</th>
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
    
    <script>
        // 클릭시 메인페이지로
        $(".menubar-logo").click(function(){
            location.href="<%=contextPath%>";
        });
        $(".home").click(function(){
            location.href="<%=contextPath%>";
        });
        
        //호스트페이지로
        $(".side-tohost").click(function(){
            location.href="main.ho"
        });

        //클릭시 공시사항페이지로
        $(".notice").click(function(){
            location.href="list.no"
        });

        // 사이드 바
        function openNav() {
        	document.getElementById("mySidenav").style.width = "320px";
        }
        function closeNav() {
        	document.getElementById("mySidenav").style.width = "0px";
        }




        
        
        
    </script>
</body>
</html>