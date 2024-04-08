<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=ZCOOL+KuaiLe&display=swap" rel="stylesheet">
    <style>
        body {
            width: 1200px;
            margin:auto;
        }
    
        .pwd-top {
            margin: auto;
            background: #704DE4;
            width: 400px;
            height: 70px;
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
    
        }
    
        .pwd-top h2 {
            color: #FFFFFF;
            text-align: center;
            margin-top: 15px;
            font-weight: 500;
            font-size: 25px;

        }
    
        .pwd-body {
            border: 1px solid gray;
            background: #F2F6FF;
            height: 550px;
            width: 540px;
            margin: auto;
            margin-top: 50px;
            border-radius: 20px;
            
        }
        h7{
            color:#7B7676;
            font-weight: 500;
            margin-right: 10px; 
           padding-left: 150px;
        }
        
        .pwd-body .pwd-logo h1 {
            font-family: 'ZCOOL KuaiLe';
            font-weight: bold;
    
        }
    
        .pwd-logo {
            padding: 30px; 
            font-size: larger;
            text-align: center;
        }
    
        .member-pwd {
            margin-left: 50px;
            margin-right: 50px;
    
        }
    
        input {
            height: 50px;
            width: 100%;
            border-radius: 10px;
            border-width: 0px;
            margin-bottom: 5px;
            background: #EEEEEE;
        }
    
        .userpwd {
            width: 300px;
            height: 50px;
            padding: 5px;
            background-color: #704DE4;
            color: #FFFFFF;
            /* font-weight: bold; */
            font-size: 25px;
            margin: 10px 120px;
        }
        .userpwd:hover{
            opacity: 0.85;
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
        .join-user{color:#6076AF;}
        .join-user:hover{ 
            font-weight: bold;
            text-decoration: none;
        }

        /* 이메일 전송 */
        .send-email{
            /* display: none; */
            color: red;
            text-align: center;
        }

        #go-login {
            width: 300px;
            height: 50px;
            margin: auto;
            text-align: center;
            line-height: 50px;
        }
        .go-login-a{
            display: inline-block;
            height: 50px;
            width: 300px;
            color: white;
            border-radius: 10px;
            background: #704DE4;

        }
        .go-login-a:hover{
            opacity: 0.85;
            color: white;
        }
    
        #or-area{
            width: 100%;
        }
        .line{
            width: 47%;
        }
        .line>hr{
            text-align: center;
            width: 80%;
            border: 1.5px solid;
        }
    </style>
</head>

<body>

<%@ include file="..common/menubar.jsp" %>
    <div class="pwd-top">
        <h2>비밀번호 찾기</h2>
    </div>

    <div class="pwd-body">
        <div class="pwd-logo">
            <h1>KH ROOMMOAH</h1>
        </div>

        <form action="">
            <div class="member-pwd">
                <input type="text" name="userId" placeholder="&#32;&#32; 아이디"><br>
                <input type="text" name="phone" placeholder="&#32;&#32; 전화번호(-입력)"><br>
                <input type="password" name="email" placeholder="&#32;&#32; 이메일">
            </div>
            <div class="send-email">
               *이메일로 비밀번호 전송하였습니다.
            </div>
            <input type="submit" class="userpwd" value="확 인">
            <div id="go-login">
                <a href="" class="go-login-a">로그인페이지 이동</a>
            </div>
        </form>
        <br>
        <table id="or-area">
            <tr>
                <td class="line"><hr></td>
                <td align="center"><b>또는</b></td>
                <td class="line"><hr></td>
            </tr>
        </table>
        

        <div class="find-user-info">
            <h7>계정이 없으신가요?</h7> <a href="" class="join-user">회원가입</a>
        </div>


    </div>


</body>

</html>

</html>