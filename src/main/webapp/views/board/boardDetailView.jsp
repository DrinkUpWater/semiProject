<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일반게시판 상세페이지</title>
    <style>
        #wrapper{
            width: 1200px;
            height: 735px;
            margin-top: 100px;  /*preview에서 예쁘게 볼려고 넣은거*/
            margin-left: 100px; /*preview에서 예쁘게 볼려고 넣은거*/
            box-sizing: border-box;
        }
        #main{
            height: 630px;
            box-sizing: border-box;
        }
        #title-area{
            border-top: 1px solid #927f69;
            border-bottom: 1px solid #ebebeb;
            height: 30%;
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
            /* border: 1px solid; */
        }
        #txt{
           padding: 30px 0 100px; 
           font-size: 14px;
           font-weight: 700;
        }
        #comment-count{
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
            opacity: 0.8;
            font-weight: 50;

            box-sizing: border-box;
            resize: none;
        }
        #btn-area{
            padding-top: 20px;
            box-sizing: border-box;
        }
        a{
            display: inline-block;
            border: 1px solid #ddd;
            height: 40px;
            text-decoration: none;
            padding: 0 25px;
            line-height: 40px;
            font-size: 15px;
            color: #666;
        }
        #a2, #a3{
            margin-left: 8px;
        }
        #span2{
            float: right;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <h1 style="color: #927f69">일반게시판</h1>
        <div id="main">
            <div id="notice-view">
                <div id="title-area">
                    <div id="title">
                        <h3>회원이 입력한 제목</h3>
                    </div>
                    <div id="span1">
                        <span>관리자</span>
                        <span>작성한 날짜</span>
                    </div>
                </div>
                <div id="content-area">
                    <div id="txt">
                        <p>회원이 입력한 내용</p>

                        <p>회원이 입력한내용2</p>

                        <p>회원이 입력한내용3</p>
                    </div>
                </div>
            </div>
            <div id="comment-count">
                댓글달린 수
            </div>
            <div id="comment-area">
                <p>댓글달면 여길로 추가됨</p>
                <div id="comment-write">
                    <textarea name="" id="" cols="80" rows="20" placeholder="댓글을 입력하시려면 네이버 로그인 해주세요"></textarea>
                </div>
            </div>
            <div id="btn-area">
                <a href="" id="a1">목록보기</a>
                <a href="" id="a2">이전 글</a>
                <a href="" id="a3">다음 글</a>
                <span>
                    <a href="" id="span2">답글쓰기</a>
                </span>
            </div>
        </div>
    </div>
</body>
</html>