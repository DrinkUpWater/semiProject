<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글작성</title>
    <style>
        #wrapper{
            width: 1200px;
            height: 700px;
            border: 1px solid; 
            margin-top: 100px;  /*preview에서 예쁘게 볼려고 넣은거*/
            margin-left: 100px; /*preview에서 예쁘게 볼려고 넣은거*/
        }
        #main{
            border: 3px solid red;
            height: 630px;
            box-sizing: border-box;
        }
        #name-wrapper{
            border: 1px solid;
            height: 50px;
            display: flex;
        }
        #name{
            border: 1px solid;
            width: 10%;
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
            
        }
        #admin-id{
            border: 1px solid;
            width: 90%;
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
        }
        #title-wrapper{
            border: 1px solid;
            height: 50px;
            display: flex;
        }
        #title{
            border: 1px solid;
            width: 10%;
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
        }
        #title-input{
            width: 100%;
            padding: 10px;
            font-size: 15px;
            
        }
        #content-wrapper{
            border: 1px solid;
            height: 380px;
            display: flex;
            
        }
        #content{
            border: 1px solid;
            width: 10%;
            height: 100%;
            display: flex;
            font-size: 20px;
            font-weight: 600;
            padding-top: 5px;
            box-sizing: border-box;
        }
        #content-input{
            background-color: blue;
            border: 1px solid;
            width: 100%;
            padding: 10px;
            font-size: 15px;
        }
        #img-wrapper{
            border: 1px solid;
            height: 137px;
            display: flex;
        }
        #img{
            border: 1px solid;
            width: 10%;
            height: 100%;
            display: flex;
            font-size: 20px;
            font-weight: 600;
            padding-top: 10px;
            box-sizing: border-box;

        }
        #img-input{
            background-color: rgb(206, 204, 204);
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
        }

        a{
            border: 1px solid rebeccapurple;
            width: 100px;
            height: 100px;
            text-decoration: none;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 30px;
        }


    </style>
</head>
<body>
    <div id="wrapper">
        <h1 style="color: #927f69">공지사항</h1>
        <div id="main">
            <div id="name-wrapper">
                <div  id="name">
                    이름
                </div>
                <div id="admin-id">
                    admin
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
                    <a href="" >@</a>
                </div>
                
            </div>
        </div>
    </div>
    <div id="regist" style="font-size: 20px;">
        <a href="">등록</a>
        
    </div>
    <div id="cancle" style="font-size: 20px;">
        <a href="">취소</a>
    </div>

</body>
</html>