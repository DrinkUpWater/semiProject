<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/resources/teo/favicon-16x16.png">
    <title>KH ROOMMOAH</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=ZCOOL+KuaiLe&display=swap" rel="stylesheet">
    <style>
        #wrapper {
            width: 1200px;
            margin: auto;

        }

        .login-top {

            background: #704DE4;
            width: 400px;
            height: 65px;
            border-radius: 20px;
            margin: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 100px;

        }

        .login-top h2 {
            color: #FFFFFF;
            text-align: center;
            margin-top: 10px;
        }

        .login-body {
            border: 1px solid gray;
            background: #F2F6FF;
            height: 570px;
            width: 540px;
            margin: auto;
            margin-top: 50px;
            border-radius: 20px;

        }

        .login-body .login-logo h1 {
            font-family: 'ZCOOL KuaiLe';
            font-weight: bold;

        }

        .login-logo {
            padding: 70px;
            font-size: larger;
            text-align: center;
        }

        .member-login {
            /* border: 1px solid; */
            margin-left: 50px;
            margin-right: 50px;

        }
        .member-login input{
            margin-bottom: 10px;
        }
        input {
            height: 70px;
            width: 100%;
            border-radius: 10px;
            padding: 20px;
            border-width: 0px;
            margin-bottom: 5px;
            background: #EEEEEE;
        }

        .userlogin {
            width: 300px;
            height: 50px;
            padding: 2px;
            background-color: #704DE4;
            color: #FFFFFF;
            /* font-weight: bold; */
            font-size: 30px;
            margin: 10px 120px;

        }

        .userlogin:hover {
            background-color: #947fda;
        }

        .two-line {
            /* border: 1px solid; */
            display: flex;
            width: 100%;
            justify-content: space-between;
        }

        hr {
            border: 1px solid;
            width: 200px;
        }

        .two-line>h6 {
            line-height: 30px;
            font-weight: 900;
        }
        .find-user-info > .find-pwd{
            padding-left: 180px;
            margin: 5px;
        }


        /* .find-user-info .atext{
            text-decoration: none;
            font-size: 20px;
            color: #7B7676;
        } */
        .find-pwd:hover{
            color: rgb(150, 159, 243);
            text-decoration: none;
            font-weight: bold;
        }
        h7{
            color:#7B7676;
            font-weight: 500;
            margin-right: 6px; 
           padding-left: 163px;
        }
        .join-user{color:#6076AF;}
        .join-user:hover{ 
            font-weight: bold;
            text-decoration: none;
        }
        #idSaveCheck{
            width: 15px;
            height: 15px;
            position: relative;
            top:2px;
            left: 3px;
        }
        #saveId{
            padding-left: 5px;
        }
    </style>
</head>

<body>

    <%@ include file="../common/menubar.jsp" %>

  
    <div id="wrapper">
        <div class="login-top">
            <h2>로그인</h2>
        </div>

        <div class="login-body">
            <div class="login-logo">
                <h1>KH ROOMMOAH</h1>
            </div>

            <form action="login.me" method="post">
                <div class="member-login">
                    <input type="text" id="userId" name="userId" placeholder="아이디" value="${cookie.saveId.value }"><br>
                    <input type="password"  id="userPwd" name="userPwd" placeholder="비밀번호">
                    <label for="remember" id="saveId"> 아이디 저장 </label>
                    <input type="checkbox" id="idSaveCheck" name="saveId" checked><br>
                </div>
                <input type="submit" class="userlogin" value="로 그 인" onclick="return loginuser();">
            </form>

            <div class="two-line">
                <hr>
                <h6>또는</h6>
                <hr>
            </div>

            <div class="find-user-info">
                <a href="findPwdForm" class="find-pwd">비밀번호를 잊으셨나요?</a><br>
                <h7>계정이 없으신가요?</h7> <a href="enrollForm.me" class="join-user">회원가입</a>
            </div>


        </div>
    </div>
    <script>
        function loginuser(){ //빈칸체크 함수
            let userId =document.getElementById("userId");
            let userPwd =document.getElementById("userPwd");
            if(userId.value===""){
                alert("아이디를 입력해주세요.");
                userId.focus();
                return false;
            }
            
            else if(userPwd.value===""){
                alert("비밀번호를 입력해주세요,");
                userPwd.focus();
                return false;
            }
    

        }
        
      
    </script>
      <% request.getSession().removeAttribute("alertMsg"); %>
</body>

</html>