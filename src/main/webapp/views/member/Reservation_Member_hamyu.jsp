<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.kh.common.vo.PageInfo, java.util.ArrayList, com.kh.space.model.vo.Reservation" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Reservation> list =(ArrayList<Reservation>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage =pi.getStartPage();
	int endPage =pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
     <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=ZCOOL+KuaiLe&display=swap" rel="stylesheet">

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  
    <title>Document</title>
    <style>
        #wrapper {
            width: 1200px;
            margin: auto;
        }
        .reservation-header{
            width: 100%;
            height: 50px;
            background: #704DE4;
            color: white;
            text-align: center;
            line-height: 55px;
            font-size: large;
            font-weight: bold;

        }

        .reservation-body{
            /* margin-left:150px; */
            margin-right:150px;
            width: 100%;
            height: 1000px;
        }
        .total-rsvt-area{
            margin-top: 50px;
            width: 100%;
            height: 80px;
            background: #4D4D4D;


            padding: 30px;
        }

        .total-rsvt-area> p{
            color:white;
            font-size:large;
        }
        .reservation-menubar{
            height: 50px;
            width: 100%;
            /* border: 1px solid; */
            display: flex;
            justify-content: space-around;
            line-height: 70px;
            margin-top: 60px;
        }
        li{
            list-style-type : none ;
            font-size: 17px;
            font-weight: bold;
            color:#969696;
        }
        hr{
            border: 1px solid;
            color:#969696;
            
        }
        .thead-dark{
            font-size: 18px;
            color:#969696;

        }
        .reservation-list{
            cursor: pointer;
        }
      
        .modal-title{
            font-weight: bold;
            color:#969696;
            padding-top: 10px;
        }
        .btn-rserv{
            border: 0;
            background-color: rgba(0, 0, 0, 0);;
            text-decoration: underline;
            color: rgb(4, 133, 207);
        }
        .close{
            color: red;
            font-size: 30px;
            position: absolute; /* 절대 위치 지정 */
            top: 20px; 
            right: 10px; 
         
        }
        .modal-header{
           display: flex;
           
        }
        .modal-dialog{
            width: 700px;
            /* border: 1px solid green;  */
        }

        .modal-body{
            display: flex;
            border: 1px solid rgb(201, 43, 69);
            width: 100%;
        }
        .table-area{
            width: 100%;
            /* border: 1px solid; */
        }
 
        .modal-tb-css{
            width: 100%;
        }
        .modal-tb-css tr td{
            color:#4D4D4D;
            font-size: 20px;
            padding-bottom: 5px;
            padding-top: 20px;
        }
        .modal-tb-css tr{
            border-bottom: 1px solid #e6e1e1;
        }
        .trtd{
            font-weight: bold;
        }
        .img-area{
            border: 1px solid;
            height: 300px;
            width: 50%;

        }
    	.paging-area>button{
    	 	text-decoration: none;
            border: 1px solid gray;
            display: inline-block;
            width: 35px;
            height: 35px;
            font-size: 15px;
            line-height: 35px;
            color: black;
            margin-top: 10px;
            margin-left: 10px;
            }
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div id="wrapper">
        <div class="reservation-header">
            예약 내역
        </div>

        <div class="reservation-body">
            <div class="total-rsvt-area">
                <p>총 예약권 : ${pi.listCount}건</p>
            </div>
    
            <hr>
            <table class="table table-striped" border="1"  >
                <thead class="thead-dark">
                    <tr>
                        <th>No.</th>
                        <th>예약공간</th>
                        <th>예약인원</th>
                        <th>호스트명</th>
                        <th>금액</th>
                        <th>예약 신청일</th>
                    </tr>
                </thead>
				<tbody>

					<c:choose>
						<c:when test="${empty pi.listCount }">
							<!-- 예약을 해본적이 없을 경우 -->
							<tr>
								<td colspan=6>예약내역 내용이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 예약을 해본 경험이 있을 경우 -->
                            <c:forEach var="p" items="${list}" varStatus="status">
                                <tr class="reservation-list">
                                <td>${p.reservationNo }</td>
									<td>
										<button type="button" class="btn-rserv" data-toggle="modal"
											data-target="#myModal">${p.spaceName }</button> <!-- The Modal -->
										<div class="modal" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="modal-header">
														<h4 class="modal-title">예약내용</h4>
														<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>

													<!-- Modal body -->
													<div class="modal-body">
														<div class="table-area">
															<table class="modal-tb-css">
																<tr>
																	<td class="trtd">예약 신청일</td>
																	<td align="center" style="color: red;">${p.reservationDate}</td>

																</tr>
																<tr>
																	<td class="trtd">예약공간</td>
																	<td align="center">${p.spaceName }</td>
																</tr>
																<tr>
																	<td class="trtd">예약내용</td>
																	<td align="center">${p.time1 }-${p.time2 }</td>
																</tr>
																<tr>
																	<td class="trtd">예약인원</td>
																	<td align="center">${p.headCount}명</td>
																</tr>

																<tr>
																	<div class="img-area">
																		<img src="" alt="">
																	</div>
																</tr>
															</table>
														</div>

													</div>


													<!-- Modal footer -->


												</div>
											</div>
										</div>

										</div>
									</td>
									<td>${p.headCount}명</td>
									<td>${p.userName }</td>
									<!-- host이름으로 수정해야함 -->
									<td>${p.totalPrice}</td>
									<td>${p.reservationDate}</td>
                                </tr>
								</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
					
			</table>
            <br><br>

			<div class="paging-area" align="center">

				<%
                  if (currentPage != 1) {
                %>
				<button
					onclick="location.href='reservation.me?cpage=<%=currentPage - 1%>'">&lt;</button>
				<%} %>
				
				<% for(int p=startPage; p<=endPage; p++){ %>
					<%if (p==currentPage) { %>
						<button disabled><%=p %></button>
					<%}else{ %>
						<button onclick="location.href='reservation.me?cpage=<%=p%>'"><%=p%></button>
					<% } %>
				<% } %>

				<%if(currentPage != maxPage){ %>
				<button
					onclick="location.href='<%=contextPath%>/reservation.me?cpage=<%=currentPage + 1%>'">&gt;</button>
				<%} %>
			</div>
			<hr>


		</div>
		</div>
	
</body>
</html>