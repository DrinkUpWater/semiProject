<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 작성</title>
    <style>
        #notice-wrapper{
            width: 1200px;
            margin: auto;
        }
        #main{
            border-top: 1px solid #927f69;
            height: 90%;
            box-sizing: border-box;
        }
        h1{
            border-bottom: 1px solid #927f69;
            padding-bottom: 10px;
        }
        #name-wrapper{
            height: 50px;
            display: flex;
            display: none;
        }
        #name{
            width: 10%;
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
            box-sizing: border-box;
        }
        #name-input{
            border: 1px solid rgb(196, 194, 194);
            width: 100%;
            padding: 10px;
            font-size: 15px;
            box-sizing: border-box;
        }
        #title-wrapper{
            height: 50px;
            display: flex;
            margin-top: 20px;
        }
        #title{
            width: 8%;
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
            display: flex;
            
        }
        #content{
            width: 8%;
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
            height: 150px;
            display: flex;
        }
        #img{  
            width: 8%;
            display: flex;
            font-size: 20px;
            font-weight: 600;
            padding-top: 5px;
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
        #a2, #btn{
            border: 1px solid rgb(196, 194, 194);
            width: 100px;
            height: 100%;
            text-decoration: none;
            font-size: 15px;
            font-weight: 550;
            display: flex;
            justify-content: center;
            align-items: center;
			margin-left: 10px;
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
    <%@ include file="../common/menubar.jsp" %>
    <div id="notice-wrapper">
        <!-- <div id="h1"></div> -->
        <h3 style="color: #927f69">공지사항</h3>

       	<form action="<%=contextPath%>/insert.no" id="enroll-form" method="POST" >
	       	<div id="main">       
                <div id="name-wrapper">
                    <div id="name">이름</div> 
                    <!-- <input id="name-input" type="text"> -->
                </div>

	            <div id="title-wrapper">
	                <div id="title">제목 *</div>
	                <input id="title-input" type="text" name="title" placeholder="제목을 입력해주세요" required>
	            </div>
	
	            <div id="content-wrapper">
	                <div id="content">내용 *</div>
	                <textarea id="content-input" name="content" rows="20" placeholder="내용을 입력해주세요" required></textarea>  
	            </div>

	            <div id="img-wrapper">
	                <div id="img">이미지</div>
	                <div id="img-input">
                        <!--  <input id="a1" type="file" name="file"> -->
	                </div>
	            </div>

	            <div id="regist-area">
	                <div id="cancle" >
	                    <a href="<%=contextPath%>/list.no" id="a2">취소</a>
	                </div>
	                <div id="regist" >
	                    <button type="submit" id="btn">등록</button>
	                </div>
	            </div>
	
	        </div>
       	</form>
    </div>
    <script>
        function chooseFile(){
            const imgInput = document.querySelector("#file" + num);
                    imgInput.click();
        }
    </script>

</body>
</html>