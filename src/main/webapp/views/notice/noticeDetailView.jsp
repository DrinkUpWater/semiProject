<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controller.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세페이지</title>
    <style>
        #notice-wrapper{
            width: 1200px;
            height: 735px;
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
        #reply-count{
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
        border: 1px solid red;
        margin-bottom: 38px;
        width: 100%;
        height: 100%;
        }
        #reply-write{
            border: 1px solid;
            padding: 0  0 30px 0;
            background-color: #fff;
            height: 100px;
        }
        #reply-write textarea{
            width: 100%;
            height: 130px;
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
        #a1, #a2 {
            
        }
        #btn4{
            float: right;
        }
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div id="notice-wrapper">
        <h2 style="color: #927f69" id="h2">공지사항</h2>
        <div id="main">
            <div id="notice-view">
                <div id="title-area">
                    <div id="title">
                        <%=n.getNoticeTitle() %>
                    </div>
                    <div id="span1">
                        <span>관리자</span>  <!-- 회원 이름으로 뜨게 하고 싶으면 n.getNoticeWriter 쓰면 됨-->
                        <span><%=n.getCreateDate() %></span>
                    </div>
                </div>
                <div id="content-area">
                    <div id="txt">
                        <p><%=n.getNoticeContent() %></p>
                    </div>
                    
                </div>
            </div>
            <div id="reply-count">
                댓글달린 수
            </div>
            <div id="reply-area">
                <div id="reply-list">
                    <!-- <div>
                        <div>댓글제목</div>
                        <div>댓글내용</div>
                        <div>2024.04.18</div>
                    </div> -->
                </div>
                <div id="reply-write">
                    <textarea name="" id="reply-content" cols="80" rows="20" placeholder="댓글을 입력하시려면 네이버 로그인 해주세요"></textarea>
                </div>
            </div>
            <div id="btn-area">
                <button id="btn1" onclick="location.href='<%=contextPath %>/list.no?cpage=1'">목록보기</button>
                <!-- <a href="<%=contextPath %>/list.no?cpage=1" id="a1">목록보기</a> -->
                <!-- 첫번째 게시글이면 이전글이 없어야 하고 마지막(최신) 게시글이면 다음글이 없어야 한다.-->
                <button id="btn2" onclick="location.href='<%=contextPath %>/detail.no?num=<%=n.getNoticeNo() - 1%>'">이전 글</button>
                <button id="btn3" onclick="location.href='<%=contextPath %>/detail.no?num=<%=n.getNoticeNo() + 1%>'">다음 글</button>
	
	 			<%if(loginUser != null && loginUser.getUserId().equals(n.getNoticeWriter())) { %>
                <a href="<%=contextPath%>/updateForm.no?num=<%=n.getNoticeNo() %>" id="a1">수정하기</a>
                <a href="<%=contextPath%>/delete.no?num=<%=n.getNoticeNo() %>" id="a2">삭제하기</a>
				<%} %>
                <span>
                    <button id="btn4" onclick="insertReply()">답글쓰기</button>
                </span>
            </div>
        </div>
        <script>
	        window.onload = function(){
	            selectReplyList();
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
                            str += ("<div>" +
                                    "<div>" + reply.replyWriter + "</div>" +
                                    "<div>" + reply.replyContent + "</div>" +
                                    "<div>" + reply.createDate + "</div>" +
                                    "</div>")
                        }
                        document.querySelector("#reply-area > #reply-list").innerHTML = str;
                    }, error : function(){
                        console.log("댓글 조회중 ajax 통신 실패")
                    }
                })
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
                    }, error : function(){
                        console.log("댓글 작성중 ajax 통신 실패")
                    }

                })
            }
        </script>
    </div>
</body>
</html>