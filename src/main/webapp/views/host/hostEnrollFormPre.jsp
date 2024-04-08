<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            box-sizing: border-box;
        }
        #wrapper{
            width: 1200px;
            margin: 10px auto;    
        }
        .login-top {
            background: #704DE4;
            width: 400px;
            height: 65px;
            border-radius: 20px;
            margin: auto;
            margin-top: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
        }
        .login-top h2 {
            color: #FFFFFF;
            text-align: center
        }
        .top-area{
            border-bottom: 2px solid #704DE4;
            font-size: 30px;
            height: 45px;
            font: bold;
        }
        li {
            font-size: 20px;
        }
        .select-area{
            margin-left: 10%;
        }
        .select-area label{
            font-size: 25px;
        }
        .buttons{
            display: flex;
            justify-content: space-around;
        }
        .buttons button{
            width: 280px;
            height: 50px;
            border-radius: 15px;
            border: none;
            color: white;
            font-size: 26px; 
        }
        .back-btn{
            background-color: rgb(70, 70, 70);
        }
        .save-btn{
            background-color: rgb(230, 61, 61);
        }
        ul {
            margin-left: 50px;
        }

        /* ì²´í¬ë°ì¤ ì»¤ì¤í */
        /* The container */
        .container {
        display: block;
        position: relative;
        padding-left: 35px;
        margin-bottom: 12px;
        cursor: pointer;
        font-size: 22px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        line-height: 23px;
        }

        /* Hide the browser's default checkbox */
        .container input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
        height: 0;
        width: 0;
        }

        /* Create a custom checkbox */
        .checkmark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        background-color: #eee;
        }

        /* On mouse-over, add a grey background color */
        .container:hover input ~ .checkmark {
        background-color: #ccc;
        }

        /* When the checkbox is checked, add a blue background */
        .container input:checked ~ .checkmark {
        background-color: #704DE4;
        }

        /* Create the checkmark/indicator (hidden when not checked) */
        .checkmark:after {
        content: "";
        position: absolute;
        display: none;
        }

        /* Show the checkmark when checked */
        .container input:checked ~ .checkmark:after {
        display: block;
        }

        /* Style the checkmark/indicator */
        .container .checkmark:after {
        left: 9px;
        top: 5px;
        width: 5px;
        height: 10px;
        border: solid white;
        border-width: 0 3px 3px 0;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
        }
        
        
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div id="wrapper">
        <div class="login-top">
            <h2>시설물 등록</h2>
        </div>
        
        <br>

        <div class="top-area"><p>공간 유형을 선택해주세요.</p></div>
        
        <br><br><br>
        <ul>
            <li>공간 유형을 선택해주세요.</li>
            <li>선택한 공간 용도 안에서, 등록한 공간에 적합한 유형은 모두 선택이 가능합니다.</li>
            <li>검수 단계에서 검수 기준에 적합하지 않는 유형은 제외될 수 있습니다.</li>
            <li>검수 신청 후, 공간 유형은 고객센터를 통해서만 가능하오니, 신중히 선택해주세요!</li>
        </ul>
        <br><br><br>
        <form action="">
            <table class="select-area">
                <tr>
                    <td> 
                        <label class="container">파티룸
                            <input type="checkbox" id="party" name="" >
                            <span class="checkmark"></span>
                        </label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>최소 2인 이상 수용가능한 독립적인 공간으로 파티가 가능한 공간</p></td>
                </tr>
                <tr>
                    <td> 
                        <label class="container">카페
                            <input type="checkbox"  id="cafe" name="" >
                            <span class="checkmark"></span>
                        </label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>카페 전체를 대관하여 모임에 독립적으로 제공이 가능한 공간</p></td>
                </tr>
                <tr>
                    <td>
                        <label class="container">강의실
                            <input type="checkbox"  id="lecture" name="" >
                            <span class="checkmark"></span>
                        </label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>학습 및 교육 목적으로 강의, 수업, 세미나로 활용할 수 있는 공간</p></td>
                </tr>
                <tr>
                    <td>
                        <label class="container">회의실
                            <input type="checkbox"  id="meeting" name="" >
                            <span class="checkmark"></span>
                        </label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>비지니스 목적으로 진행되는 회의, 워크숍 관련한 시설이 제공되는 공간</p></td>
                </tr>
                <tr>
                    <td>
                        <label class="container">세미나실
                            <input type="checkbox"  id="seminar" name="" >
                            <span class="checkmark"></span>
                        </label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p>여럿이 함께 토론, 발표, 강연, 워크숍, 연수 등을 진행할 수 있는 시설이 제공되는 공간</p></td>
                </tr>
                <tr>
                    <td> 
                        <label class="container">스터디룸
                            <input type="checkbox"  id="study" name="" >
                            <span class="checkmark"></span>
                        </label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <p>스터디, 팀플, 공모전, 독서 등 학습 활동에 필요한 시설이 구비되어 <br>
                            '스터디 공간'으로 가능할 수 있는 공간
                    </td>
                </tr>
            </table>
            <br><br>
            <div class="buttons">
                <button class="back-btn">이전</button>
                <button class="save-btn" type="submit">다음</button>
            </div>
        </form>
    </div>
    
</body>
</html>