<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세페이지</title>
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
        #title-area{
            border: 1px solid;
            height: 100px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }
        #title{
            font-size: 20px;
            display: flex;
        }
        #span1{
            font-size: 14px;
            font-weight: 600;
            color: #666;  
        }
        #title-area span+span:before {
            display: inline-block;
            width: 1px;
            height: 12px;
            margin: 2px 10px 0;
            background-color: #ebebeb;
            vertical-align: top;
            content: "";
        }
        #content-area{
            border: 1px solid;
            height: 200px;
            
        }
        #txt{
           padding: 30px 0 100px; 
           font-size: 14px;
           font-weight: 700;
        }
        #comment-count{
            border: 1px solid black;
            margin: 0 0 10px 10px;
            font-size: 15px;
            line-height: 2;
            letter-spacing: -.9px;
            font-weight: 400;
            color: #999;
        }
        #comment-area{
            padding: 30px;
            border-top: 1px solid #ebebeb;
            background-color: #fafafa;
        }
        #comment-write{
            border: 1px solid;
            padding: 0  0 30px 0;
            background-color: #fff;
            height: 100px;
        }
        #comment-write textarea{
            width: 100%;
            height: 58px;
            border: 0;
            padding: 20px;
            font-size: 14px;
            font-weight: 570;
            box-sizing: border-box;
            resize: none;
        }
        

    </style>
</head>
<body>
    <div id="wrapper">
        <h1 style="color: #927f69">공지사항</h1>
        <div id="main">
            <div id="notice-view">
                <div id="title-area">
                    <div id="title">
                        <h3>관리자가 입력한 제목</h3>
                    </div>
                    <div id="span1">
                        <span>관리자</span>
                        <span>작성한 날짜</span>
                    </div>
                </div>
                <div id="content-area">
                    <div id="txt">
                        <p>관리자가 입력한 내용</p>

                        <p>관리자가 입력한내용2</p>

                        <p>관리자가 입력한내용2</p>
                    </div>
                </div>
            </div>
            <div id="comment-count">
                댓글달린 수
            </div>
            <div id="comment-area">
                <div id="comment-write">
                    <textarea name="" id="" cols="80" rows="20" placeholder="댓글을 입력하시려면 네이버 로그인 해주세요"></textarea>
                </div>
            </div>
  


            <div>

            </div>
        </div>
    </div>
</body>
</html>