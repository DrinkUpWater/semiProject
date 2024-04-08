<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글작성</title>
    <style>
        #wrapper{

            width: 1200px;
            height: 800px;
            margin-top: 100px;  /*preview에서 예쁘게 볼려고 넣은거*/
            margin-left: 100px; /*preview에서 예쁘게 볼려고 넣은거*/
        }
        #main{
            height: 90%;
            box-sizing: border-box;
        }
        #name-wrapper{

            height: 40px;
            display: flex;
        }
        #name{
            width: 10%;
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
        }
        #member-id{
            /* border: 1px solid rgb(196, 194, 194); */
            width: 100%;
            display: flex;
            align-items: center;
            padding: 10px;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
        }

        #title-wrapper{

            height: 40px;
            display: flex;
            margin-top: 20px;
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
            border: 1px solid rgb(196, 194, 194);
            width: 100%;
            padding: 10px;
            font-size: 15px;
            box-sizing: border-box;
            
        }
        #content-wrapper{

            margin-top: 20px;
            height: 52%;
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
            height: 22%;
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
        }
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
            border: 1px solid rgb(196, 194, 194);
            width: 100px;
            height: 100%;
            text-decoration: none;
            font-size: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
        }
        #regist-area{
            height: 58px; 
            display: flex;
            flex-direction: row;
            justify-content: end;
            padding-top: 17px;
            box-sizing: border-box;

        }

    </style>
</head>
<body>
    <div id="wrapper">
        <div id="h1">
            <h1 style="color: #927f69">일반게시판</h1>
        </div>
        <div id="main">
            <div id="name-wrapper">
                <div  id="name">
                    이름
                </div>
                <div id="member-id">
                    user01 <!-- id의 앞4자리만 표기하고 뒷자리는 별표4개로 표시해야함-->
                </div>
            </div>
            <div id="title-wrapper">
                <div id="title">
                    제목
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
        </div>
    </div>



</body>
</html>