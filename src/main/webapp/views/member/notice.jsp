<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일반게시판</title>
    <style>
        #wrapper{
            
            width: 1200px;
            height: 700px;
            /* border: 1px solid; */
            margin-top: 100px;  /*preview에서 예쁘게 볼려고 넣은거*/
            margin-left: 100px; /*preview에서 예쁘게 볼려고 넣은거*/
        }
        .table{
            border-top: 4px solid rgb(218, 218, 218);;
            border-bottom: 3px solid rgb(218, 218, 218);
            width: 100%;
            text-align: center;
            border-collapse: collapse;

        }
        th, td{
            border-bottom: 1px solid rgb(180, 180, 180);
            padding: 20px;
        }
        .btnList{
            /* border: 1px solid; */
        }
        .btnList > a{
            text-decoration: none;
            border: 1px solid gray;
            display: inline-block;
            width: 35px;
            height: 35px;
            font-size: 15px;
            line-height: 35px;
            color: black;
            margin-top: 10px;
            margin-left: 10px;
        }
        #a4{
            width: 50px;
            float: right;
        }
        .write-btn{

            border: 1px solid;
            height: 50px;
        }
        span{
            font-size: 15px;
        }
        .searchbar{
            margin-top: 20px;
            display: flex;
            height: 30px;
            gap:20px;
            justify-content: center;
            padding-right: 90px;

        }
        .ipt{
            width: 300px;
            height: 25px;
        }

       
        form{
            /* border: 1px solid; */
        }
        .title{
            text-align: left;
        }
        #selectbar{
            width: 90px;
            height: 30px;

        }
    
        #a5{
             height: 100%;
            width: 60px;
            text-decoration: none;
            line-height: 30px;
            border: 1px solid rgb(116, 116, 116);
            color: black;
        }
        #a5:hover{
            opacity: 0.66;
          
        }
    </style>
</head>
<body>

    

    <div id="wrapper" >
        <h1 style="color: #927f69">공지사항</h1>
        <table class="table">
            <thead align="center">
                <th width="70">번호</th>
                <th width="400">제목</th>
                <th width="70">작성자</th>
                <th width="80">작성일</th>
            </thead>
            <tbody>
                <tr>
                    <td>8</td>
                    <td class="title">공지사항입니다(8)</td>
                    <td>관리자</td>
                    <td>2024.01.08</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td class="title">공지사항입니다(7)</td>
                    <td>관리자</td>
                    <td>2024.01.07</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td class="title">공지사항입니다(6)</td>
                    <td>관리자</td>
                    <td>2024.01.06</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td class="title">공지사항입니다(5)</td>
                    <td>관리자</td>
                    <td>2024.01.05</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td class="title">공지사항입니다(4)</td>
                    <td>관리자</td>
                    <td>2024.01.04</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td class="title">공지사항입니다(3)</td>
                    <td>관리자</td>
                    <td>2024.01.03</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="title">공지사항입니다(2)</td>
                    <td>관리자</td>
                    <td>2024.01.02</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td class="title">공지사항입니다</td>
                    <td>관리자</td>
                    <td>2024.01.01</td>
                </tr>
            </tbody>
        </table>
        <div class="d1">
            <div class="btnList" align="center">
                <a href="">&lt;</a>
                <a href="">1</a>
                <a href="">&gt;</a>
                <a href="" id="a4">글쓰기</a>
            </div> 
        </div>
        <form action="">
            <div class="searchbar" align="center">
                <select name="selectbar" id="selectbar">
                    <option value="">제목</option>
                    <option value="">내용</option>
                </select>
                <!-- <span class="sp">제목</span > -->
                <input type="text" class="ipt">
            
                    <a href="" id="a5">검색</a>
       
            </div>

        </form>


    </div>