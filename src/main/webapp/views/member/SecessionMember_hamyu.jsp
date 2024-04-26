<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

        .secss-member {
    
            height: 400px;
            width:550px;
            margin: 200px auto;
            text-align: center;
            padding: 50px;

        }

        .head-text1 {
            font-weight: 500;
            font-size: 25px;
        }

        .head-text2 {
            padding-top: 5px;
            color: #929292;
            font-size: 13px;
        }

        .checkbox-area {
            display: flex;
            padding-left: 25px;
        }

        .agree-text {
            color: #777777;
        }

        /* 체크박스 css 에니메이션 ---------------------------------------------------------*/
        .checkbox-wrapper-19 {
            box-sizing: border-box;
            --background-color: #ffff;
            --checkbox-height: 25px;
            width: 40px;
        }

        @-moz-keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @-webkit-keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @keyframes dothabottomcheck-19 {
            0% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) / 2);
            }
        }

        @keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        @-webkit-keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        @-moz-keyframes dothatopcheck-19 {
            0% {
                height: 0;
            }

            50% {
                height: 0;
            }

            100% {
                height: calc(var(--checkbox-height) * 1.2);
            }
        }

        .checkbox-wrapper-19 input[type=checkbox] {
            display: none;
        }

        .checkbox-wrapper-19 .check-box {
            height: var(--checkbox-height);
            width: var(--checkbox-height);
            background-color: transparent;
            border: calc(var(--checkbox-height) * .1) solid #000;
            border-radius: 5px;
            position: relative;
            display: flex;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            -moz-transition: border-color ease 0.2s;
            -o-transition: border-color ease 0.2s;
            -webkit-transition: border-color ease 0.2s;
            transition: border-color ease 0.2s;
            cursor: pointer;
        }

        .checkbox-wrapper-19 .check-box::before,
        .checkbox-wrapper-19 .check-box::after {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            position: absolute;
            height: 0;
            width: calc(var(--checkbox-height) * .2);
            background-color: #704DE4;
            display: inline-block;
            -moz-transform-origin: left top;
            -ms-transform-origin: left top;
            -o-transform-origin: left top;
            -webkit-transform-origin: left top;
            transform-origin: left top;
            border-radius: 5px;
            content: " ";
            -webkit-transition: opacity ease 0.5;
            -moz-transition: opacity ease 0.5;
            transition: opacity ease 0.5;
        }

        .checkbox-wrapper-19 .check-box::before {
            top: calc(var(--checkbox-height) * .72);
            left: calc(var(--checkbox-height) * .41);
            box-shadow: 0 0 0 calc(var(--checkbox-height) * .05) var(--background-color);
            -moz-transform: rotate(-135deg);
            -ms-transform: rotate(-135deg);
            -o-transform: rotate(-135deg);
            -webkit-transform: rotate(-135deg);
            transform: rotate(-135deg);
        }

        .checkbox-wrapper-19 .check-box::after {
            top: calc(var(--checkbox-height) * .37);
            left: calc(var(--checkbox-height) * .05);
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -o-transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .checkbox-wrapper-19 input[type=checkbox]:checked+.check-box,
        .checkbox-wrapper-19 .check-box.checked {
            border-color: #34b93d;
        }

        .checkbox-wrapper-19 input[type=checkbox]:checked+.check-box::after,
        .checkbox-wrapper-19 .check-box.checked::after {
            height: calc(var(--checkbox-height) / 2);
            -moz-animation: dothabottomcheck-19 0.2s ease 0s forwards;
            -o-animation: dothabottomcheck-19 0.2s ease 0s forwards;
            -webkit-animation: dothabottomcheck-19 0.2s ease 0s forwards;
            animation: dothabottomcheck-19 0.2s ease 0s forwards;
        }

        .checkbox-wrapper-19 input[type=checkbox]:checked+.check-box::before,
        .checkbox-wrapper-19 .check-box.checked::before {
            height: calc(var(--checkbox-height) * 1.2);
            -moz-animation: dothatopcheck-19 0.4s ease 0s forwards;
            -o-animation: dothatopcheck-19 0.4s ease 0s forwards;
            -webkit-animation: dothatopcheck-19 0.4s ease 0s forwards;
            animation: dothatopcheck-19 0.4s ease 0s forwards;
        }
        
        /* ------------------------------------------------------------------------------------------------------- */
        .secss-btn{
            width: 100%;
            height: 100px;
            margin-top: 50px;
            display: flex;
            justify-content: space-around;
        }
        #cancle{
            width: 150px;
            height: 40px;
            border: 1px solid;
            text-decoration: none;
            line-height: 35px;
            border-radius: 5px;
            background: #525252;
            color: white
        }
        #cancle:hover{
            opacity: 0.85;
        }
        #secess{
            height: 40px;
            width: 150px;
            border: 0;
            color: white;
            background: #704DE4;
            border-radius: 5px;
        }
        #secess:hover{
            opacity: 0.85;
        }
    </style>
</head>

<body>
    <%@ include file="../common/menubar.jsp" %>
    <div id="wrapper">
        <form action="delete.me" method="post">
            <input type="hidden" id="userId" name="userId" value="${loginUser.userId }">
            <input type="hidden" id="userNo" name="userNo" value="${loginUser.userNo }">
            <div class="secss-member">
                <p class="head-text1">서비스 탈퇴전에 꼭 확인하세요!</p>
                <p class="head-text2">서비스 탈퇴시 내 프로필,예약내역 등의 모든 정보가 삭제되며 이후 복구가 불가능합니다.</p>
                <hr>
                <div class="checkbox-area">
                    <div class="checkbox-wrapper-19">
                        <input type="checkbox" id="cbtest-19" />
                        <!-- <p class="ck-text">위의 내용을 숙지했으며 서비스 탈퇴에 동의합니다.</p> -->
                        <label for="cbtest-19" class="check-box">
                    </div>
                    <div class="agree-text">
                        위의 내용을 숙지했으며 서비스 탈퇴에 동의합니다.
                    </div>


                </div>
                <hr>
                <div style="color: red; font-size: 10px;">
                    * 서비스 탈퇴 동의는 필수입니다 *
                </div>

                <div class="secss-btn">
                    <a href="myPage.me"  id="cancle">취소</a>
                    <input type="submit" value="서비스 탈퇴" id="secess" onclick="testConfirm()"></input>

                </div>
                
            </div>
        </form>
    </div>
    <script>

        function testConfirm(){ //회원 탈퇴
       
             if (!document.getElementById("cbtest-19").checked){
                alert("탈퇴에 동의해주시기바랍니다.");
            }else{ 
                if(confirm("정말로 탈퇴하시겠습니까?")){
            }
        }
        }
    </script>
</body>

</html>