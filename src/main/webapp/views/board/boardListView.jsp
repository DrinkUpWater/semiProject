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
            border-top: 4px solid rgb(218, 218, 218);;
            /* border-bottom: 3px solid rgb(218, 218, 218); */
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }
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
            width: 90px;
            height: 30px
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
        <h1 style="color: #927f69">일반게시판</h1>
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
                        <td class="title">안녕하세요 반갑습니다(8)</td>
                        <td>user08</td>
                        <td>2024.01.08</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td class="title">안녕하세요 반갑습니다(7)</td>
                        <td>user07</td>
                        <td>2024.01.07</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td class="title">안녕하세요 반갑습니다(6)</td>
                        <td>user06</td>
                        <td>2024.01.06</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td class="title">안녕하세요 반갑습니다(5)</td>
                        <td>user05</td>
                        <td>2024.01.05</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="title">안녕하세요 반갑습니다(4)</td>
                        <td>user04</td>
                        <td>2024.01.04</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="title">안녕하세요 반갑습니다(3)</td>
                        <td>user03</td>
                        <td>2024.01.03</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="title">안녕하세요 반갑습니다(2)</td>
                        <td>user02</td>
                        <td>2024.01.02</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td class="title">안녕하세요 반갑습니다(1)</td>
                        <td>user01</td>
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
        </div>
        
        <form action="">
            <div class="search-area" align="center">
                <select name="selectbar" id="selectbar">
                    <option value="">제목</option>
                    <option value="">내용</option>
                </select>
                <!-- <span class="sp">제목</span > -->
                <input type="text" class="search-input">
                <a href="" id="search-btn">검색</a>
            </div>
        </form>
    </div>



</body>
</html>