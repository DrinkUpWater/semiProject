<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controller.notice.model.vo.Notice, com.kh.common.NoticeAttachment" %>
<%
	Notice n = (Notice)request.getAttribute("notice");

	NoticeAttachment nat = (NoticeAttachment)request.getAttribute("noticeAttachment");
	
	int noticeReplyCount = (int)request.getAttribute("noticeReplyCount");
	
	int maxNoticeNo = (int)request.getAttribute("maxNoticeNo");
	
	int minNoticeNo = (int)request.getAttribute("minNoticeNo");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/resources/teo/favicon-16x16.png">
    <title>KH ROOMMOAH</title>
    <style>
        #notice-wrapper{
            width: 1200px;
            min-height: 735px;
            margin: auto;
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
         
            padding: 20px 0px;
        }
        #title{
            font-size: 20px;
            font-weight: 500;
            display: flex;
        }
        #writer-info{
            font-size: 14px;
            font-weight: 600;
            color: #666;  
        }
        #ud-de{
            padding-top: 5px;
        }
        #ud-de a{
            font-size: 14px;
            font-weight: 600;
            color: #666;  
            
        }
        #title-area span+span:before {
            display: inline-block;
            width: 1px;
            height: 12px;
            margin: 5px 10px 0;
            background-color: #afafaf;
            vertical-align: top;
            content: "";
        }
        #content-area a+a:before{
            display: inline-block;
            width: 1px;
            height: 12px;
            margin: 5px 10px 0;
            background-color: #afafaf;
            vertical-align: top;
            content: ""; 
        }
        #img-content{
        	max-width: 500px;
        	max-height: 500px;
        }
        #txt{
           padding: 30px 0 100px; 
           font-size: 14px;
           font-weight: 700;
        }
        #reply-count-area{
            margin: 0 0 10px 10px;
            font-size: 15px;
            line-height: 2;
            letter-spacing: -.9px;
            font-weight: 400;
            color: #999;
        }
        #reply-area{
            padding: 30px;
            border-top: 1px solid #ebebeb;
            background-color: #fafafa;
        }
        #reply-list{
            display: inline-block;
            margin-bottom: 38px;
            width: 100%;
            height: 100%;
        }
        .rlist-area{
            border-bottom: 1px solid #ebebeb;
            margin-bottom: 36px;
            padding-bottom: 36px;
        }
        .rlist-writer{
            margin-right: 5px;
            font-size: 13px;
            font-weight: 500;
            color: black;
        }
        .rlist-createDate{
            font-size: 13px;
            font-weight: 400; 
            color: #999;
        }
        .rlist-content{
            margin-top: 12px;
            font-size: 14px;
            color: #666;
        }
        .rlist-delete{
        	font-size: 14px;
        	color: #666;
        	float: right;
        	cursor: pointer;	        	
        }
        #reply-input{
            border: 1px solid;
            padding: 0  0 30px 0;
            background-color: #fff;
            height: 100px;
        }
        #reply-input textarea{
            width: 100%;
            height: 100px;
            border: 0;
            padding: 20px;
            font-size: 14px;
            opacity: 0.98;
            font-weight: 300;
            box-sizing: border-box;
            resize: none;
        }
        #btn-area{
            padding-top: 20px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        #btn1, #btn2, #btn3, #btn4{
            display: inline-block;
            border: 1px solid #ddd;
            height: 40px;
            text-decoration: none;
            padding: 0 25px;
            line-height: 40px;
            font-size: 15px;
            color: #666;
        }
        #btn1, #btn2, #btn3, #btn4{
            margin-left: 8px;
            background-color: #fff;
        }
        #btn4{
            float: right;
        }
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div id="notice-wrapper">	
    	<h2><span style="color: #927f69; cursor:pointer" onclick="location.href='<%=contextPath %>/list.no?cpage=1'">공지사항</span></h2>    				 
        <div id="main">
            <div id="notice-view">
                <div id="title-area">
                    <div id="title">
                        <%=n.getNoticeTitle() %>
                    </div>
                    <div id="writer-info">
                        <span><%=n.getNoticeWriter() %></span>  <!-- 회원 이름으로 뜨게 하고 싶으면 n.getNoticeWriter 쓰면 됨-->
                        <span><%=n.getCreateDate() %></span>
                    </div>
                </div>
                <div id="content-area">
                    <div id="ud-de" align="right">
                        <%if((loginUser != null && loginUser.getUserId().equals(n.getNoticeWriter())) || (loginUser != null && loginUser.getAdmin().equals("Y"))) { %>
                            <a href="<%=contextPath%>/updateForm.no?num=<%=n.getNoticeNo() %>" id="a1">수정하기</a>
                            <a href="#" id="cancelButton">삭제하기</a>
                        <%} %>
                    </div>
                    <script>
                        $(function(){                          
                            document.querySelector("#cancelButton").onclick=function(){
                                const confirmcheck = confirm("정말 삭제하시겠습니까?");
                                if(confirmcheck){
                                    location.href="<%=contextPath%>/delete.no?num=<%=n.getNoticeNo()%>";
                                }
                                else{
                                    return false;
                                }                     
                            }
                        })

                    </script>
                    <div id="txt">
                    	<%if(nat == null) {%>
                    		
                    	<%} else {%>
                    	<div id="img-area">
                        	<img src="<%=contextPath%>/<%=nat.getFilePath() + nat.getChangeName() %>" id="img-content">
                        </div>
                    	
                    	<%} %>

                    	<div>
                            <p><%=n.getNoticeContent() %></p>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
            <div id="reply-count-area">
               <!--  댓글달린 수 -->
                댓글 <span id="reply-count"></span>
            </div>
            <div id="reply-area">           	
                <div id="reply-list">
                    <!-- <div>
                        <div>댓글제목</div>
                        <div>댓글내용</div>
                        <div>2024.04.18</div>
                    </div> -->                   
                </div>
             	<script>
	                function deleteReply(replyNo, refNoticeNo){

	                        const confirmcheck = confirm("정말 삭제하시겠습니까?");
	                        if(confirmcheck){
	                        	location.href="<%=contextPath%>/drlist.no?num=" + replyNo + "&refNum=" + refNoticeNo;	                       	 	
	                        }
	                        else{
	                            return false;
	                        }                     
	                }
                </script>

                <div id="reply-input">
                	<%if(loginUser != null){ %>
                	<textarea name="" id="reply-content" cols="80" rows="20" placeholder="내용을 입력해주세요"></textarea>               	               	
                	<%} else {%>
                    <textarea name="" id="reply-content" readonly cols="80" rows="20" placeholder="댓글을 입력하시려면 로그인 해주세요"></textarea> 
                	<%} %>
                </div>
            </div>
            <div id="btn-area">
                <button id="btn1" onclick="location.href='<%=contextPath %>/list.no?cpage=1'">목록보기</button>
                <!-- <a href="<%=contextPath %>/list.no?cpage=1" id="a1">목록보기</a> -->
                <!-- 첫번째 게시글이면 이전글이 없어야 하고 마지막(최신) 게시글이면 다음글이 없어야 한다.-->
				<%if(minNoticeNo == n.getNoticeNo()){ %>
                <button style="display:none" id="btn2" onclick="location.href='<%=contextPath %>/detail.no?num=<%=n.getNoticeNo() - 1%>&pre=pre'">이전 글</button>
				<%} else{%>
				<button id="btn2" onclick="location.href='<%=contextPath %>/detail.no?num=<%=n.getNoticeNo() - 1%>&pre=pre'">이전 글</button>				
				<%} %>
				
				<%if(maxNoticeNo == n.getNoticeNo()){ %>
                <button style="display:none" id="btn3" onclick="location.href='<%=contextPath %>/detail.no?num=<%=n.getNoticeNo() + 1%>&next=next'">다음 글</button>
				<%} else{%>
				<button id="btn3" onclick="location.href='<%=contextPath %>/detail.no?num=<%=n.getNoticeNo() + 1%>&next=next'">다음 글</button>				
				<%} %>

				<%if(loginUser != null) {%>
                <span>
                    <button id="btn4" onclick="insertReply()">답글쓰기</button>
                </span>
                <%} else {%>
                <span>
                    <button id="btn4" onclick="insertReply()" disabled>답글쓰기</button>
                </span>
                <%} %>
            </div>
        </div>
        <script>
	        window.onload = function(){
	            selectReplyList();
	            setReplyCount();
	            setInterval(selectReplyList, 2000);
	         }
	         
             function selectReplyList(){
                $.ajax({
                    url : "rlist.no",
                    data : {
                        noticeNo : <%=n.getNoticeNo()%>
                    },
                    success : function(res){
                        let str = "";
                        for(let reply of res){
                            str += ("<div class='rlist-area'>" +
                                    "<span class='rlist-writer'>" + reply.replyWriter + "</span>" +
                                    "<span class='rlist-createDate'>" + reply.createDate + "</span>" +
                                    <%if((loginUser != null && loginUser.getAdmin().equals("Y"))) {%>
                                    "<span><button class='rlist-delete' style='text-decoration-line: none;' onclick='deleteReply(" + reply.replyNo+ "," + reply.refNoticeNo  + ")'>" + "삭제" + "</button></span>" +
                                    <%} %>
                                    "<div class='rlist-content'>" + reply.replyContent + "</div>" +                            
                                    "</div>") 
                        }
                        document.querySelector("#reply-area > #reply-list").innerHTML = str;
                        setReplyCount(res.length)
                    }, error : function(){
                        console.log("댓글 조회중 ajax 통신 실패")
                    }
                })
            }
             

            function setReplyCount(count){
                const rCount = document.querySelector("#reply-count");
                rCount.innerHTML = count;
            }

            function insertReply(){
                const noticeNo = <%=n.getNoticeNo()%>;
                const content = document.querySelector("#reply-content").value;

                $.ajax({
                    url : "rinsert.no",
                    data : {
                        noticeNo : noticeNo,
                        content : content
                    },
                    type : "POST",
                    success : function(res){
                        document.querySelector("#reply-content").value = "";
                        selectReplyList();
                        selectReplyCount();
                    }, error : function(){
                        console.log("댓글 작성중 ajax 통신 실패")
                    }

                })
            }                       
        </script>
    </div>
</body>
</html>