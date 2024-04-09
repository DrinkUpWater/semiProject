<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=ZCOOL+KuaiLe&display=swap" rel="stylesheet">
    <style>
        body {
            width: 1200px;
            margin:auto;
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
            padding: 5px;
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
            padding-left: 150px;
            margin: 5px;
        }


        a{
            text-decoration: none;
            font-size: 20px;
            color: #7B7676;
        }
        .find-pwd:hover{
            color: rgb(150, 159, 243);
            text-decoration: none;
            font-weight: bold;
        }
        h7{
            color:#7B7676;
            font-weight: 500;
            margin-right: 10px; 
           padding-left: 150px;
        }
        .join-user{color:#6076AF;}
        .join-user:hover{ 
            font-weight: bold;
            text-decoration: none;
        }

    </style>
</head>

<body>

    <%@ include file="../common/menubar.jsp" %>
        <div class="login-top">
            <h2>로그인</h2>
        </div>

        <div class="login-body">
            <div class="login-logo">
                <h1>KH ROOMMOAH</h1>
            </div>

            <form action="">
                <div class="member-login">
                    <input type="text" name="userId" placeholder="아이디"><br>
                    <input type="password" naem="userPwd" placeholder="비밀번호">
                </div>
                <input type="submit" class="userlogin" value="로 그 인">
            </form>

            <div class="two-line">
                <hr>
                <h6>또는</h6>
                <hr>
            </div>

            <div class="find-user-info">
                <a href="" class="find-pwd">비밀번호를 잊으셨나요?</a><br>
                <h7>계정이 없으신가요?</h7> <a href="" class="join-user">회원가입</a>
            </div>


        </div>


</body>

</html>