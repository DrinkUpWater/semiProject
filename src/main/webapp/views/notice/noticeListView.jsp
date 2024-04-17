<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.PageInfo, controller.notice.model.vo.Notice"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <style>
        #notice-wrapper{
            width: 1200px;
            margin: auto;
        }
        #table{
            border-top: 1px solid #927f69;
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }
        tr{
            cursor: pointer;
            padding: 16px;
        }
        th {
            border-bottom: 1px solid rgb(201, 201, 201);
            padding-top: 20px;
            padding-bottom: 20px;
        }
        td {
            padding-top: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgb(201, 201, 201);
        }
        .title{
            text-align: left;
        }
        #btn1, #btn2, #btn3{
            text-decoration: none;
            border: 1px solid rgb(201, 201, 201);
            display: inline-block;
            width: 35px;
            height: 35px;
            font-size: 15px;
            line-height: 32px;
            color: black;
            margin-left: 10px;
            text-align: center;
            box-sizing: border-box;
        }

        #write-btn {
            border: 1px solid rgb(201, 201, 201);
            width: 70px;
            height: 35px;
            float: right;
            line-height: 32px;
            box-sizing: border-box;
            display: inline-block;
        }
        #btnList-area{
            margin-top: 10px;
        }
        #search-area{
             box-sizing: border-box;
             padding-top: 15px;
             display: flex;
             flex-direction: row;
             justify-content: center;
             align-items: end;
             box-sizing: border-box;
        }
        #selectbar{
            border: 1px solid rgb(201, 201, 201);
            width: 90px;
            height: 35px
        }
        #search-input{
            border: 1px solid rgb(201, 201, 201);
            width: 300px;
            height: 35px;
            margin-left: 10px;
        }
        #search-btn{
            border: 1px solid rgb(201, 201, 201);
            width: 60px;
            height: 35px;
            line-height: 32px;
            background-color: #fafafa;
            margin-left: 10px;
        }

    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div id="notice-wrapper" >
        <h3 style="color: #927f69">공지사항</h3>
        <div id="table-wrapper">

            <table id="table">
                <thead align="center">
                    <th width="30">번호</th>
                    <th width="400">제목</th>
                    <th width="50">작성자</th>
                    <th width="60">작성일</th>
                    <th width="30">조회수</th>
                </thead>
                <tbody>
                	<%if(list.isEmpty()) {%>
                		<tr>
                			<td align="center">존재하는 공지사항이 없습니다.</td>
                		</tr>
                	<% } else { %>
                		<%for(Notice n : list) {%>
                			<tr>
		                        <td><%=n.getNoticeNo() %></td>
		                        <td class="title"><%=n.getNoticeTitle() %></td>
		                        <td><!--<%=n.getNoticeWriter() %> --> 관리자</td>
		                        <td><%=n.getCreateDate() %></td>
		                        <td><%=n.getCount() %></td>
                    		</tr>
                		<% } %>
                	<% } %>
                </tbody>
            </table>

            
                
                <div id="btnList-area">
                    <div class="btnList" align="center">
                        <%if(currentPage != 1) {%>
                    	<button id="btn1" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage - 1%>'">&lt;</button>
                        <%} %>
                        <%for(int p = startPage; p <= endPage; p++) {%>
                            <%if(p == currentPage) {%>
                                <button id="btn2" disabled><%=p %></button>
                            <%} else {%>
                                <button id="btn2" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=p %>'"><%=p %></button>
                            <%} %>
                        <%} %>
                        <%if(currentPage != maxPage) {%>
                            <button id="btn3" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage + 1%>'">&gt;</button>
                        <%} %>

                        <!-- 관리자로 로그인 했을 때 뜨는 버튼 -->
                        <%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
                        	<div id="write-btn"><a href="<%=contextPath %>/enroll.no">글쓰기</a></div>
                   		<%} %>
                    </div> 
                </div>
        </div>
         
        <form action="">
            <div id="search-area" align="center">
                <select name="selectbar" id="selectbar">
                    <option value="">제목</option>
                    <option value="">내용</option>
                </select>
                <input type="text" id="search-input">
                <a href="" id="search-btn">검색</a>
            </div>
        </form>
    </div>
    <script>
         $(function(){
             $("#table > tbody > tr").click(function(){
                 const noticeNo = $(this).children().eq(0).text();
                 location.href="<%=contextPath%>/detail.no?num=" + noticeNo;
             })
         })


    </script>
</body>
</html>