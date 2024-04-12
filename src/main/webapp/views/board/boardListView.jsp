<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일반게시판</title>
    <style>
        #board-wrapper{
            width: 1200px;
            margin: auto;
        }
        #table{
            border-top: 1px solid #927f69;
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }
        tr{
            cursor: pointer;
            padding: 16px;
        }
        th {
            border-bottom: 1px solid rgb(201, 201, 201);
            padding-top: 20px;
            padding-bottom: 20px;
        }
        td {
            padding-top: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgb(201, 201, 201);
        }
        .title{
            text-align: left;
        }
        #a1, #a2, #a3{
            text-decoration: none;
            border: 1px solid rgb(201, 201, 201);
            display: inline-block;
            width: 35px;
            height: 35px;
            font-size: 15px;
            line-height: 32px;
            color: black;
            margin-left: 10px;
            text-align: center;
            box-sizing: border-box;
        }

        #write-btn {
            border: 1px solid rgb(201, 201, 201);
            width: 70px;
            height: 35px;
            float: right;
            line-height: 32px;
            box-sizing: border-box;
        }
        #btnList-area{
            margin-top: 10px;
        }
        #search-area{
             box-sizing: border-box;
             padding-top: 15px;
             display: flex;
             flex-direction: row;
             justify-content: center;
             align-items: end;
             box-sizing: border-box;
        }
        #selectbar{
            border: 1px solid rgb(201, 201, 201);
            width: 90px;
            height: 35px
        }
        #search-input{
            border: 1px solid rgb(201, 201, 201);
            width: 300px;
            height: 35px;
            margin-left: 10px;
        }
        #search-btn{
            border: 1px solid rgb(201, 201, 201);
            width: 60px;
            height: 35px;
            line-height: 32px;
            background-color: #fafafa;
            margin-left: 10px;
        }

    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div id="board-wrapper" >
        <h3 style="color: #927f69">일반게시판</h3>
        <div id="table-wrapper">

            <table id="table">
                <thead align="center">
                    <th width="30">번호</th>
                    <th width="400">제목</th>
                    <th width="50">작성자</th>
                    <th width="60">작성일</th>
                </thead>
                <tbody>
                    <tr onclick="trClick();">
                        <td>8</td>
                        <td class="title">일반게시판입니다(8)</td>
                        <td>user08</td>
                        <td>2024.01.08</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td class="title">일반게시판입니다(7)</td>
                        <td>user07</td>
                        <td>2024.01.07</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td class="title">일반게시판입니다(6)</td>
                        <td>user06</td>
                        <td>2024.01.06</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td class="title">일반게시판입니다(5)</td>
                        <td>user05</td>
                        <td>2024.01.05</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="title">일반게시판입니다(4)</td>
                        <td>user04</td>
                        <td>2024.01.04</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="title">일반게시판입니다(3)</td>
                        <td>user03</td>
                        <td>2024.01.03</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="title">일반게시판입니다(2)</td>
                        <td>user02</td>
                        <td>2024.01.02</td>
                    </tr> 
                    <tr>
                        <td>1</td>
                        <td class="title">일반게시판입니다(1)</td>
                        <td>user01</td>
                        <td>2024.01.01</td> 
                    </tr>
                </tbody>
            </table>
            <%-- 
            <%if(loginUser != null) {%>
                <!-- 관리자로 로그인 했을 때 뜨는 버튼 -->
                <div id="btnList-area">
                    <div class="btnList" align="center">
                        <a href="" id="a1">&lt;</a>
                        <a href="" id="a2">1</a>
                        <a href="" id="a3">&gt;</a>
                        
                        <div id="write-btn><a href="<%=contextPath %>/enroll.bo">글쓰기</a></div>
                    </div> 
                </div>
            <%} %>
            --%>

            <div id="btnList-area">
                <div class="btnList" align="center">
                    <a href="" id="a1">&lt;</a>
                    <a href="" id="a2">1</a>
                    <a href="" id="a3">&gt;</a>
                    
                    <a href="<%=contextPath %>/enroll.bo" id="write-btn">글쓰기</a>
                </div> 
            </div>



        </div>
        
        <form action="">
            <div id="search-area" align="center">
                <select name="selectbar" id="selectbar">
                    <option value="">제목</option>
                    <option value="">내용</option>
                </select>
                <input type="text" id="search-input">
                <a href="" id="search-btn">검색</a>
            </div>
        </form>
    </div>
    <script>
        // $(function(){
        //     $(".table > tbody > tr").click(function(){
        //         const noticeNo = $(this).children().eq(0).text();
        //         location.href="<%=contextPath%>/detail.no?num=" + noticebo + "";
        //     })
        // })
        function trClick(){
            // 테스트용으로 그냥 디테일뷰만 뜨게 한거임(위의 방법으로 해야함)
            location.href="<%=contextPath%>/detail.bo";
        }

    </script>
</body>
</html>