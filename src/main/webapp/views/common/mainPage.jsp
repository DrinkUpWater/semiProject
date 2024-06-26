<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.space.model.vo.Space, com.kh.common.PageInfo, java.util.ArrayList" %>
<%
	ArrayList<Space> spList = (ArrayList<Space>)request.getAttribute("spList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/resources/teo/favicon-16x16.png">
    <title>KH ROOMMOAH</title>
    <style>
        *{
            box-sizing: border-box;
        }

        #wrapper{
            width: 1200px;
            margin: 10px auto;    
        }
        .search-bar{
            position: relative;
            margin: 10px auto;
            display: flex;
            align-items: center;
            width: 500px;
        }
        .search-bar input{
            width: 500px;
            border: 2px solid #704DE4;
            border-radius: 20px;
            padding-left: 20px;
            height: 39px;
        }
        .search-bar > i{
            color: #704DE4;
            position: absolute;
            right: 20px;
        }
        .search-option {
            display: flex;
            margin-top: 30px;
        }
        .option1 {
            width: 75%;;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .option1 select, .option1 input{
            width: 25%;
            height: 38px;
        }
        .option2 {
            width: 25%;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .option2 div {
            
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .option3{
            margin-top :30px;
            display: flex;
            justify-content: space-between;
            gap: 30px;
            padding-left: 20px;
            padding-right: 10px;
            border-bottom: 1px solid rgb(138, 138, 138);
            height: 30px;
            margin-bottom: 20px;
            padding-bottom: 5px;
        }
        .option3 div{
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        .option3 div a {
            font-size: 20px;
        }
        .option3 div select{
            display: flex;
            border: none;
            font-size: 20px;
        }

        .main-grid{
            place-items: center;
            display: grid;
            column-gap: 16px;
            row-gap: 40px;
        }
        @media (max-width: 619px){
            .main-grid{grid-template-columns: 1fr;}
        }

        @media (min-width: 620px) and (max-width: 949px){
            .main-grid{grid-template-columns: 1fr 1fr;}
        }

        @media (min-width: 950px){
            .main-grid{grid-template-columns: 1fr 1fr 1fr;}
        }
        
        .info-preview {
            border: 1px solid rgb(180, 180, 180);
            width: 360px;
            height: 360px;
        }
        .space-picture{
            height: 220px;
            padding: 0;
            margin: 0;
            border: none;
        }
        .space-info{
            padding : 0 10px;
            padding-top: 10px;
            border-top: 1px solid rgb(180, 180, 180);
            
        }
        /* .space-info p span {
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        } */
        .price-info{
            display: flex;
            justify-content: space-between;
            align-items:baseline
        }
        .price-info>div>b{
            font-size: 20px;
            color: #704DE4;
        }
        .calender-select{
            position: relative;
        }

        .calender {
            width: 300px;
            position: absolute;
            top : 140px;
            left: 48%
        }
        .info-preview{
            cursor: pointer;
        }
        .space-info>b {
            margin-bottom: 15px;
        }
        #search-btn, #place-Info, #people-count, #place-kind, #map-info {
        	cursor: pointer;
        }
        .paging-area button{
        	background-color : white;
        	border: 1px solid rgb(180, 180, 180);
        	width: 30px;
        	height: 30px;
      	    text-align: center;
      	    padding-bottom: 4px;
      	    font-weight : 500;
        }
        .title-area{
       		display: flex;
       		justify-content: space-between;
        }
        .map-marker{
        	width: 100%;
        }

    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div id="wrapper">
        <div class="search-bar" align="center">
            <input id="keyword" type="search" name="search">
            <i id="search-btn" class="fa-solid fa-magnifying-glass"></i>
        </div>
      
            <div class="search-option">  
                <section class="option1">
                    <select id="place-Info" class="place-Info" >
                        <option value="">지역</option>
                        <option value="서울" name="pInfo">서울</option>
                        <option value="경기" name="pInfo">경기</option>
                    </select>
                    <select id="people-count" class="people-count" >
                        <option value="0" >인원</option>
                        <option value="1" name="pCount">1명</option>                        
                        <option value="2" name="pCount">2명</option>
                        <option value="3" name="pCount">3명</option>
                        <option value="4" name="pCount">4명</option>
                        <option value="5" name="pCount">5명</option>
                        <option value="6" name="pCount">6명</option>
                        <option value="7" name="pCount">7명</option>
                        <option value="8" name="pCount">8명</option>
                        <option value="9" name="pCount">9명</option>
                        <option value="10" name="pCount">10명 이상</option>
                    </select>
                    <select id="place-kind" class="place-kind" >
                    	<option value="">유형</option>
                    	<option value="파티룸">파티룸</option>
                    	<option value="카페">카페</option>
                    	<option value="강의실">강의실</option>
                    	<option value="회의실">회의실</option>
                    	<option value="세미나실">세미나실</option>
                    	<option value="스터디룸">스터디룸</option>
                    </select>
                </section>
                <div class="option2">
                    <div id="map-info"><button id="map-btn" type="button" class="btn btn-outline-primary btn-lg" data-toggle="modal" data-target="#myModal">지도</button></div>
                </div>
                
            </div>
            <!-- The Modal -->
			<div class="modal" id="myModal">
			  <div class="modal-dialog modal-xl">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">지도</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			<%-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${api}&libraries=services,clusterer,drawing"></script> --%>
			      <!-- Modal body -->
			      <div class="modal-body" >
			       <div id="map" style="width:100%;height:500px;"></div>
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
			
			    </div>
			  </div>
			</div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${api}&libraries=services,clusterer,drawing"></script>
					<script>
						$('#map-btn').click(function(){
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new kakao.maps.LatLng(37.50089653784943, 127.02815682483896   ), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };
							
							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							
							var geocoder = new daum.maps.services.Geocoder();
							
							let listData = new Array();
							let listSpName = new Array();
							<% for (Space sp : spList) { %>
								listData.push('<%=sp.getSpaceAddress()%>');
								listSpName.push('<%=sp.getSpaceName()%>');
							<%}%>
							
							listData.forEach(function(addr, index) {
							    geocoder.addressSearch(addr, function(result, status) {
							        if (status === daum.maps.services.Status.OK) {
							            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
							            var marker = new daum.maps.Marker({
							                map: map,
							                position: coords
							            });
							            var infowindow = new daum.maps.InfoWindow({
							                content: '<div style="width:150px;text-align:center;">' + listSpName[index] + '</div>',
							                disableAutoPan: true
							            });
							            infowindow.open(map, marker);
							        } 
							    });
							});
							
							setTimeout(function(){ map.relayout(); }, 100);
						})
		  			</script>
      
        <br>
        <div class="option3">
            <div>
               <!--  <a href="">전체</a> | 
                <a href="">시간단위</a> |
                <a href="">패키지단위</a> |
                <a href="">월단위</a> -->
            </div>
            <div>
                <select id="place-order">
                    <option value="SPACE_NO DESC">최신 순</option>
                    <option value="SPACE_COUNT DESC">베스트 공간 순</option>
                    <option value="SPACE_PRICE ASC">가격 낮은 순</option>
                    <option value="SPACE_PRICE DESC">가격 높은 순</option>
                </select>
            </div>
        </div>
        <br>
        <section class="main-grid">
           
            <c:forEach var="sp" items="${list}">
                <div class="info-preview" onclick="detailView('${sp.spaceNo}')">
                    <div class="space-picture"> 
                        <img src="<%=contextPath%>${sp.spaceMimg}" alt="썸네일" width="100%" height="100%">
                    </div>
                    <div class="space-info">
                        <div class="title-area" style="margin-bottom: 5px;">
                            <b>
                                ${sp.spaceName}
                            </b>
                            <span><i class="fa-regular fa-thumbs-up"></i> ${sp.spaceCount }</span>
                        </div>
                        <div>
                            <p>
                                <span>${sp.spaceAddress} <br> ${sp.spaceTag} </span>
                            </p>
                        </div>
                        <div class="price-info">
                            <div><b>${sp.spacePrice}</b> <span>원/시간</span></div> <span>최대 ${sp.spaceCapacity}인</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
           
                        
        </section>
        <br>
        <div class="paging-area" align="center" >
        	<c:if test="${pi.currentPage != 1}">
        		<button onclick="location.href='<%=contextPath%>/main.sp?cpage=${pi.currentPage - 1}'"><i class="fa-solid fa-chevron-left"></i></button>
        	</c:if>
	        <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
	       		<c:choose>
		       		<c:when test="${pi.currentPage == p}">
		        		<button disabled>${p}</button>
		       		</c:when >
		       		<c:otherwise>
		       			<button onclick="location.href='<%=contextPath%>/main.sp?cpage=${p}'">${p}</button>
		       		</c:otherwise>
	       		</c:choose>
	        </c:forEach>
	        <c:if test="${pi.currentPage != pi.endPage}">
        		<button onclick="location.href='<%=contextPath%>/main.sp?cpage=${pi.currentPage + 1}'"><i class="fa-solid fa-chevron-right"></i></button>
        	</c:if>
        </div> 
		<br><br>
    </div>
    <script>
    	
   		function detailView(spaceNo) {
       		location.href="detailview.sp?spaceNo="+spaceNo;
	    }
 
        $('#search-btn').click(function(){
        	$.ajax({
                url: "search.sp",
                data : {
                    keyword: $('#keyword').val(),
                    cpage: '1'
                },
                success : function(res){
                	drawSpaceList(res.list);
                	drawPagingBarKey(res.pi, res.list);
                },
                error : function(){
                	alert("실패")
                }
            })
        });
        
        $('#people-count, #place-Info, #place-kind, #place-order').change(function(){
        	$.ajax({
                url: "filteringSpace.sp",
                data : {
                    pCount: $("#people-count").val(),
                    pInfo: $("#place-Info").val(),
                    pKind: $("#place-kind").val(),
                    pOrder: $("#place-order").val(),
                    cpage: '1'
                },
                success : function(res){
                	drawSpaceList(res.list);
                	drawPagingBar(res.pi, res.list);
                	$("#keyword").val("");
                	
                },
                error : function(){
                	alert("실패")
                }
            })
        });

        $('#keyword').keypress(function(event){
            // 키 코드가 13이면(엔터 키) 버튼을 클릭합니다.
            if(event.which === 13){
                $('#search-btn').click();
            }
        });
        
        function drawSpaceList(data) {
        	let str = "";
        	if (data.length !== 0){
	        	for (let sp of data){
	        		str += '<div class="info-preview" onclick="detailView(\'' + sp.spaceNo + '\')">\n' +
			               '    <div class="space-picture"> \n' +
			               '        <img src="<%=contextPath%>' + sp.spaceMimg + '" alt="썸네일" width="100%" height="100%">\n' +
			               '    </div>\n' +
			               '    <div class="space-info">\n' +
			               '        <div class="title-area" style="margin-bottom: 5px;">\n' +
			               '            <b>\n' +
			               '                ' + sp.spaceName + '\n' +
			               '            </b>\n' +
			               '            <span><i class="fa-regular fa-thumbs-up"></i>' + ' ' +  sp.spaceCount + '</span>\n' +
			               '        </div>\n' +
			               '        <div>\n' +
			               '            <p>\n' +
			               '                <span>' + sp.spaceAddress + ' <br> ' + sp.spaceTag + ' </span>\n' +
			               '            </p>\n' +
			               '        </div>\n' +
			               '        <div class="price-info">\n' +
			               '            <div><b>' + sp.spacePrice + '</b> <span>원/시간</span></div> <span>최대 ' + sp.spaceCapacity + '인</span>\n' +
			               '        </div>\n' +
			               '    </div>\n' +
			               '</div>';
	            }
	        } else {
	        	str = '<br><br><h2>조건에 맞는 결과가 없습니다.</h2>';
	        }
	        	
	      
            document.querySelector(".main-grid").innerHTML = str;
        }
        
        function drawPagingBar(pi, list) {
        	let str =""; 
        	if (list.length == 0){
        	} else {
			    if (pi.currentPage != 1){
				   str = `<button onclick="ajaxPage(` + (pi.currentPage - 1) + `)"><i class="fa-solid fa-chevron-left"></i></button> \n`
			    }
			    for (let p = pi.startPage; p <= pi.endPage; p++){
				   if(pi.currentPage == p) {
					   str += `<button disabled>`+ p + `</button>\n` 
				   } else {
					   str += `<button onclick="ajaxPage(` + p + `)">` + p + `</button>\n` 
				   }
			    }
			    if (pi.currentPage != pi.endPage ){
				   str += `<button onclick="ajaxPage(` + (pi.currentPage + 1) + `)"><i class="fa-solid fa-chevron-right"></i></button> \n`
			    }
        	}
		  
		   document.querySelector(".paging-area").innerHTML = str;
        }
        
        function drawPagingBarKey(pi, list) {
        	let str =""; 
        	if (list.length == 0){
        	} else {
			    if (pi.currentPage != 1){
				   str = `<button onclick="ajaxPageKey(` + (pi.currentPage - 1) + `)"><i class="fa-solid fa-chevron-left"></i></button> \n`
			    }
			    for (let p = pi.startPage; p <= pi.endPage; p++){
				   if(pi.currentPage == p) {
					   str += `<button disabled>`+ p + `</button>\n` 
				   } else {
					   str += `<button onclick="ajaxPageKey(` + p + `)">` + p + `</button>\n` 
				   }
			    }
			    if (pi.currentPage != pi.endPage ){
				   str += `<button onclick="ajaxPageKey(` + (pi.currentPage + 1) + `)"><i class="fa-solid fa-chevron-right"></i></button> \n`
			    }
        	}
		  
		   document.querySelector(".paging-area").innerHTML = str;
        }
        
        function ajaxPage(p) {
	        $.ajax({
	            url: "filteringSpace.sp",
	            data : {
	                pCount: $("#people-count").val(),
	                pInfo: $("#place-Info").val(),
	                pKind: $("#place-kind").val(),
	                pOrder: $("#place-order").val(),
	                cpage: p
	            },
	            success : function(res){
	            	drawSpaceList(res.list);
	            	drawPagingBar(res.pi, res.list);
	            	$("#keyword").val("");
	            },
	            error : function(){
	            	alert("실패")
	            }
	        })
        }
        
        function ajaxPageKey(p) {
	        $.ajax({
	        	url: "search.sp",
                data : {
                    keyword: $('#keyword').val(),
                    cpage: p
                },
	            success : function(res){
	            	drawSpaceList(res.list);
	            	drawPagingBarKey(res.pi, res.list);
	            },
	            error : function(){
	            	alert("실패")
	            }
	        })
        }
    </script>
    
</body>
</html>