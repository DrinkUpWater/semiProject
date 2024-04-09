<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일반게시판</title>
    <style>
        #wrapper{
            width: 1200px;
            height: 700px;
            margin-top: 100px;  /*preview에서 예쁘게 볼려고 넣은거*/
            margin-left: 100px; /*preview에서 예쁘게 볼려고 넣은거*/
        }
        .table{
<<<<<<< HEAD:src/main/webapp/views/notice/noticeListView.jsp
            border-top: 1px solid #927f69;
=======

            border-top: 4px solid rgb(218, 218, 218);;
            /* border-bottom: 3px solid rgb(218, 218, 218); */
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f:src/main/webapp/views/notice/noticeView.jsp
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }
<<<<<<< HEAD:src/main/webapp/views/notice/noticeListView.jsp
        th{
            border-bottom: 1px solid rgb(212, 212, 212);
            padding: 20px;
            padding-right: 0px;
            padding-left: 0px;
        }
        td{
            border-bottom: 1px solid #ebebeb;
            padding: 20px;
            padding-right: 0px;
            padding-left: 0px;
        }
        #btnList-area{
             margin-top: 30px;
=======

        th {
            border-bottom: 1px solid rgb(201, 201, 201);
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 0;
            padding-right: 0;
        }
        td {
            padding-top: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgb(201, 201, 201);
            
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f:src/main/webapp/views/notice/noticeView.jsp
        }
        .title{
            text-align: left;
        }
        /* .btnList{

        } */
        a{
            text-decoration: none;
            border: 1px solid rgb(201, 201, 201);
            display: inline-block;
            width: 35px;
            height: 35px;
            font-size: 15px;
            line-height: 35px;
            color: black;
            margin-left: 10px;
            text-align: center;
            box-sizing: border-box;
        }
        #write-btn{
<<<<<<< HEAD:src/main/webapp/views/notice/noticeListView.jsp
            width: 80px;
            float: right;
        }
        #search-area{
            border: px solid red; 
            display: flex;
            justify-content: center;
            align-items: end;
            margin-top: 23px;   
        }
        .title{
            text-align: left;
        }
        #select-menu{
            border: 1px solid;
=======
            width: 70px;
            float: right;
        }
        .search-area{
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
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f:src/main/webapp/views/notice/noticeView.jsp
            width: 90px;
            height: 30px
        }
        #text-input{
            border: 1px solid;
            width: 300px;
            height: 26px;
            margin-left: 10px;
        }
        #search-btn{
            width: 60px;
            height: 30px;
            line-height: 30px;
            background-color: #fafafa;
        }

        .search-input{
            border: 1px solid rgb(201, 201, 201);
            width: 300px;
            height: 26px;
            margin-left: 5px;
        }
        #search-btn{
            width: 60px;
            height: 28px;
        }
    </style>
</head>
<body>
    <div id="wrapper" >
<<<<<<< HEAD:src/main/webapp/views/notice/noticeListView.jsp
        <h2 style="color: #927f69">공지사항</h2>
        <table class="table">
            <thead align="center">
                <th width="40">번호</th>
                <th width="400">제목</th>
                <th width="60">작성자</th>
                <th width="70">작성일</th>
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
        <div id="btnList-area">
            <div class="btnList" align="center">
                <a href="">&lt;</a>
                <a href="">1</a>
                <a href="">&gt;</a>
                <a href="" id="write-btn">글쓰기</a>
            </div> 
=======
        <h1 style="color: #927f69">공지사항</h1>
        <div id="table-wrapper">
            <table class="table">
                <thead align="center">
                    <th width="30">번호</th>
                    <th width="400">제목</th>
                    <th width="50">작성자</th>
                    <th width="60">작성일</th>
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
                        <td class="title">공지사항입니다(1)</td>
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
                    
                    <a href="" id="write-btn">글쓰기</a>
                </div> 
            </div>
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f:src/main/webapp/views/notice/noticeView.jsp
        </div>
        
        <form action="">
<<<<<<< HEAD:src/main/webapp/views/notice/noticeListView.jsp
            <div id="search-area" >
                <span>
                    <select name="select-menu" id="select-menu">
                        <option value="">제목</option>
                        <option value="">내용</option>
                    </select>
                </span>
                <input type="text" id="text-input">
=======
            <div class="search-area" align="center">
                <select name="selectbar" id="selectbar">
                    <option value="">제목</option>
                    <option value="">내용</option>
                </select>
                <!-- <span class="sp">제목</span > -->
                <input type="text" class="search-input">
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f:src/main/webapp/views/notice/noticeView.jsp
                <a href="" id="search-btn">검색</a>
            </div>
        </form>
    </div>



</body>
</html>