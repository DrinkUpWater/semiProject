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
            border-top: 1px solid #927f69;
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }
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
        }
        a{
            text-decoration: none;
            border: 1px solid gray;
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
            width: 90px;
            height: 30px;
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

    </style>
</head>
<body>
    <div id="wrapper" >
        <h2 style="color: #927f69">일반게시판</h2>
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
                    <td class="title">안녕하세요 반갑습니다</td>
                    <td>user01</td>
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
        </div>
        <form action="">
            <div id="search-area" >
                <span>
                    <select name="select-menu" id="select-menu">
                        <option value="">제목</option>
                        <option value="">내용</option>
                    </select>
                </span>
                <input type="text" id="text-input">
                <a href="" id="search-btn">검색</a>
            </div>

        </form>


    </div>



</body>
</html>