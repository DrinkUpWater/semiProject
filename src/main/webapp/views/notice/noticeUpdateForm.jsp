<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controller.notice.model.vo.Notice, com.kh.common.NoticeAttachment" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
	NoticeAttachment nat = (NoticeAttachment)request.getAttribute("nat");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 수정</title>
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
        #content-img{
            border: 1px solid rebeccapurple;
            width: 100px;
            height: 100px;
            text-decoration: none;
            background-color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 30px;
            cursor: pointer;
        }
        #a1, #btn{
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
        
        /* 툴팁 하려다가 실패*/
        /* [data-tooltip]{position:relative;}
        [data-tooltip]:before,
        [data-tooltip]:after{visibility:hidden;opacity:0;position:absolute;left:50%;transform:translateX(-50%);white-space:nowrap;transition:all .2s ease;font-size:11px;font-family:dotum;letter-spacing:-1px;}
        [data-tooltip]:before{content:attr(data-tooltip);height:20px;position:absolute;top:-20px;padding:5px 10px;border-radius:5px;color:#fff;background:#025272;box-shadow:0 3px 8px rgba(165, 165, 165, 0.5);}
        [data-tooltip]:after{content: '';border-left:5px solid transparent;top:2px;border-right:5px solid transparent;border-top:5px solid #025272;}
        [data-tooltip]:not([data-tooltip=""]):hover:before{visibility:visible;opacity:1;top:-30px}
        [data-tooltip]:not([data-tooltip=""]):hover:after{visibility:visible;opacity:1;top:-8px} */

    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div id="notice-wrapper">
        <!-- <div id="h1"></div> -->
        <h3 style="color: #927f69">공지사항 수정</h3>

       	<form action="<%=contextPath%>/update.no?num=<%=n.getNoticeNo() %>" id="update-form" method="post" enctype="multipart/form-data">
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
	                	<%if(nat != null) {%>
	                		<input type="hidden" name="originFileNo" value="<%=nat.getFileNo()%>">
	                	<%} %>
                    	<img id="content-img" name="content-img" onclick="chooseFile();">
	                </div>
	            </div>
	            
	            
	            <div style="display:none">
	            	<input type="file" name="file" id="file" onchange="loadImg(this)">
				</div>
				 
				
	            <div id="regist-area">
	                <div id="cancle" >
	                    <a href="<%=contextPath%>/detail.no?num=<%=n.getNoticeNo() %>" id="a1">취소</a>
	                </div>
	                <div id="regist" >
	                    <button type="submit" id="btn">등록</button>
	                </div>
	            </div>
	
	        </div>
       	</form>
    </div>
    <script>
    	function loadImg(inputFile){
    		if(inputFile.files.length == 1){
    			const reader = new FileReader();
    			
    			reader.readAsDataURL(inputFile.files[0]);
    			
    			reader.onload = function(ev){
    				document.getElementById("content-img").src = ev.target.result;
    			}
    		} else {
    			document.getElementById("content-img").src = null;
    		}
    	}
    
        function chooseFile(){
            const imgInput = document.querySelector("#file");
                    imgInput.click();
        }
    </script>
</body>
</html>