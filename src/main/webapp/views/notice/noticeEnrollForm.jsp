<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글작성</title>
    <style>
        #wrapper{
            
            width: 1200px;
<<<<<<< HEAD
            height: 780px;
            margin-top: 100px;

        }
        #table-main{
            border: 2px solid red;
            height: 630px;
            box-sizing: border-box;
        }

        #name-area{

            height: 50px;
            display: flex;
            
        }
        #name{
            border: 1px solid;
            width: 80px;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
            
        }
        #admin-id{
            border: 1px solid;
            width: 1000px;
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
        }
        /* #title-wrapper{
=======
            height: 700px;
            margin-top: 100px;  /*preview에서 예쁘게 볼려고 넣은거*/
            margin-left: 100px; /*preview에서 예쁘게 볼려고 넣은거*/
        }
        #main{
            height: 90%;
            box-sizing: border-box;
        }
        #title-wrapper{
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f
            height: 50px;
            display: flex;
        }
        h1{
            border-bottom: 1px solid;
            padding-bottom: 10px;
        }
        #title{
            width: 10%;
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
        }
        #title-input{
<<<<<<< HEAD
            border: 1px solid;
=======
            border: 1px solid rgb(196, 194, 194);
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f
            width: 100%;
            padding: 10px;
            font-size: 15px;
            box-sizing: border-box;
            
        }
        #content-wrapper{
            margin-top: 20px;
            height: 53%;
            display: flex;
            
        }
        #content{
            width: 10%;
            height: 100%;
            display: flex;
            font-size: 20px;
            font-weight: 600;
            padding-top: 5px;
            box-sizing: border-box;
        }
        #content-input{
            border: 1px solid rgb(196, 194, 194);
            width: 100%;
            padding: 10px;
            font-size: 15px;
            box-sizing: border-box;
        }
        #img-wrapper{
            height: 25%;
            display: flex;
        }
        #img{  
            width: 10%;
            height: 100%;
            display: flex;
            font-size: 20px;
            font-weight: 600;
            padding-top: 10px;
            box-sizing: border-box;
        }
        #img-input{
            
            border: 1px solid rgb(196, 194, 194);
            border-top: 0;
            background-color: rgb(233, 233, 233);
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
<<<<<<< HEAD
        } */

=======
        }
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f
        #a1{
            border: 1px solid rebeccapurple;
            width: 100px;
            height: 100px;
            text-decoration: none;
            background-color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 30px;
        }
        #a2, #a3{
<<<<<<< HEAD
            border: 1px solid #ddd;
=======
            border: 1px solid rgb(196, 194, 194);
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f
            width: 100px;
            height: 100%;
            text-decoration: none;
            font-size: 15px;
            font-weight: 550;
            display: flex;
            justify-content: center;
            align-items: center;
<<<<<<< HEAD
            color: #666;
            box-sizing: border-box;
        }
        #regist, #cancle{

            width: 80px;
            height: 40px;
            margin-left: 8px;
            display: flex;
            align-items: center;
            box-sizing: border-box;
        }
        #regist-area{
            margin-top: 39px;
            display: flex;
            flex-direction: row;
            justify-content: end;
            box-sizing: border-box;
=======
            box-sizing: border-box;
        }
        #regist-area{
            height: 58px; 
            display: flex;
            flex-direction: row;
            justify-content: end;
            padding-top: 17px;
            box-sizing: border-box;

>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f
        }

    </style>
</head>
<body>
    <div id="wrapper">
<<<<<<< HEAD
        <h1 style="color: #927f69">공지사항</h1>
        <div id="table-main">
            <table>
                <tbody>
                    <tr id="name-area">
                        <th id="name">이름</th>
                        <td id="admin-id"></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>사진</th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <!-- <div id="regist-area">
                <div id="regist" >
                    <a href="" id="a2">취소</a>
                </div>
                <div id="cancle" >
                    <a href="" id="a3">등록</a>
                </div>
            </div> -->

            <!---------------------------------------------->

=======
        <div id="h1">
            <h1 style="color: #927f69">공지사항</h1>
        </div>
        <div id="main">
>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f
            <!-- <div id="name-wrapper">
                <div  id="name">
                    이름
                </div>
                <div id="admin-id">
                    admin
                </div>
            </div> -->
            <div id="title-wrapper">
                <div id="title">
                    제목 *
                </div>
                <input id="title-input" type="text" placeholder="제목을 입력해주세요">

            </div>

            <div id="content-wrapper">
                <div id="content">
                    내용
                </div>
                <textarea id="content-input" placeholder="내용을 입력해주세요"></textarea>  
            </div>
            <div id="img-wrapper">
                <div id="img">
                    이미지
                </div>
                <div id="img-input">
                    <a href="" id="a1">@</a>
                </div>
            </div>
            <div id="regist-area">
                <div id="regist" >
                    <a href="" id="a2">취소</a>
                </div>
                <div id="cancle" >
                    <a href="" id="a3">등록</a>
                </div>
            </div>
<<<<<<< HEAD
        </div> -->

    </div>
=======
        </div>
    </div>

>>>>>>> bc08f2e59e04a385f8f38c6c91db16a597acbf4f


</body>
</html>