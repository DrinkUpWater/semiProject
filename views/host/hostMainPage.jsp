<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
    <style>
        #wrapper{
            width: 1200px;
            margin: 10px auto;    
        }
        .host-main{
            width: 1100px;
            height: 750px;
            display: flex;
            
            border: 1px solid black;
        }
        .left-side{
            margin: auto;
            margin-left : 10px;
            padding: auto;
            width: 50% ;
        }
        .right-side{
            width: 50%;
            margin : auto;
            
        }
        .right-side img {
            display: flex;
            align-items: center;
            margin-left: 30px;
            width: 500px;
            height: 400px;
            border: 1px solid black;
        }
        .left-side > div > h1{
            font-size: 40px;
        }
        .margin-left-30px{
            margin-left: 30px;
        }
        .left-side button {
            width: 150px;
            height: 50px;
            border: none;
            color: #FFFFFF;
            background-color: #704DE4;
            border-radius: 15px;
            font-size: 18px;
        }
    </style>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div id="wrapper">
        <div class="host-main">
            <div class="left-side">
                <div>
                    <h1>
                        지금 MZ세대들을 위한 <br>
                        공간 비지니스를 시작해보세요
                    </h1>
                </div>
                <br>
                <div class="margin-left-30px"><button>공간등록하기</button></div>
                <br>
                <div class="margin-left-30px">
                    <p>|등록 가능 공간| 모임&#183;파티룸&#183;스터디&#183;카페&#183;회의실&#183;세미나실까지 </p>
                </div>
            </div>
            <div class="right-side">
                <img src="" alt="">
            </div>
        </div>
    </div>
</body>
</html>