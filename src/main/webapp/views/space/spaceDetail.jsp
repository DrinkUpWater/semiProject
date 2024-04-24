<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
<%@ page import="com.kh.space.model.vo.Space" %>
<%@ page import="com.kh.member.model.vo.Member" %>
<%@ page import="com.kh.common.Attachment" %>
<%@ page import="java.util.ArrayList" %>


      <%     
   		   HttpSession s=request.getSession();
		   String []tags=null;
		   String []guides=null;
           String []caution=null;
		   Member member=null;
		   int userNo=-1;
		   
		   
		   
           String spaceKind=(String)request.getAttribute("spaceKind");
           ArrayList<Attachment> attachment = (ArrayList<Attachment>)request.getAttribute("attachments");
           //System.out.println(spaceKind);
           member=(Member)s.getAttribute("loginUser");
           if(member!=null){
		    	 userNo=member.getUserNo();
		    }
		 
		    
		    String pickedMsg=(String)s.getAttribute("pickedMsg");
		    String picked=(String)s.getAttribute("picked");
		    if(picked==null){
		    	picked="찜하기";
		    }
		    
		    
		    Space space= (Space)request.getAttribute("space");
		
            space.getSpaceCaution();
		 
		   
		   if(space.getSpaceTag()!=null){
			 tags=space.getSpaceTag().split(" ");
		   }else{
			  tags=new String[1];
			  tags[0]=" ";
		   }
		   
		   
		   if(space.getSpaceInformation()!=null){
			 guides=space.getSpaceInformation().split("/");
		   }
		   else{
			  guides=new String[1];
			  guides[0]=" ";
		   }

           if(space.getSpaceCaution()!=null){
              caution=space.getSpaceCaution().split("/");
           }
           else{
            caution=new String[1];
            caution[0]=" ";
          }
		   
		 
		  
		   
		  boolean hostCheck=false;
		  if(space.getUserNo()==userNo){
			   hostCheck=true;
		  } 
    	
         
    	 String imgPercent=((attachment.size()*100)/(attachment.size()+1))+"%";
         
         String plus=imgPercent;
         String min="-"+imgPercent;
         
    
    
    %>
    
    <html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href='<%=request.getContextPath()%>/views/space/fullcalendar/custommain.css' rel='stylesheet' />

        <title>Document</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/91f9609a45.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=ZCOOL+KuaiLe&display=swap" rel="stylesheet">


        <link rel="stylesheet" href="<%=request.getContextPath()%>/views/space/css/review.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/views/space/css/qa.css"/>


        <script src='<%=request.getContextPath()%>/views/space/js/comment.js'></script>
        <script src="<%=request.getContextPath()%>/views/space/js/calenderClick.js"></script>
        <script src="<%=request.getContextPath()%>/views/space/js/modal.js"></script>
        <script src="<%=request.getContextPath()%>/views/space/js/reservationNum.js"></script>
        <script src='<%=request.getContextPath()%>/views/space/fullcalendar/main.min.js'></script>
    
        <script src='<%=request.getContextPath()%>/views/space/js/review.js'></script>
        <script src='<%=request.getContextPath()%>/views/space/js/picked.js'></script>


        <script src='<%=request.getContextPath()%>/views/space/fullcalendar/main.min.js'></script>
      
      
       
      
        <style>
            @media (max-width: 1200px) {

                #main,
                #temp {
                    width: 100%;
                }

                #section_1,
                #section_2 {
                    width: auto;
                }
            }

            @media (max-width: 780px) {
                #main {
                    flex-direction: column;
                }

                #section_1,
                #section_2 {
                    width: 100%;
                }
            }

            * {
                border: border-box;

            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }

            #temp {
                width: 1200px;
                height: 60px;
                border: solid goldenrod;
                margin: auto;
            }

            #main {
                width: 1200px;
                height: 100%;
                margin: auto;
                display: flex;
                justify-content: space-between;
                /* border: solid black; */
                margin-top: 50px;

            }

            #section_1 {
                height: 100%;
                width: 800px;
                /* border: solid salmon; */
                margin-right: 20px;
            }

            #space_id{
                display: flex;
                justify-content: space-between;
                
            }

            .space {
            
                display: grid;
                grid-template-rows: repeat(2, 200px);
                /* grid-template-columns: repeat(3, 1fr); */
                column-gap: 50px;

                /* border: solid 1px red;  */

                margin: 10px;
                font-size: 20px;
            }

            .space{
               overflow: auto;
            }

            .space p>span {
                display: inline-block;
                width: 300px;
                text-overflow: ellipsis;
                white-space: nowrap;

            }

            .title {

                margin-top: 50px;
            }

            .text {
                font-size: 30px;
            }

            .text2 {
                font-size: 20px;
            }




            .line {
                background-color: yellow;

            }

            #list>ul {
                display: flex;
                list-style: none;
                justify-content: space-between;
                border: solid 1px #7A36E9; /*필수*/
                margin: auto;
            }

            #list li {

                /* border: solid rosybrown; */
                padding: 10px;


            }

            #list a {
                text-decoration: none;


            }
            /*     -----     */

            #space_comment {/*그리드 따로 줫다.*/
                
                display: grid;
                grid-template-rows: repeat(1, 500px);
                /* grid-template-columns: repeat(3, 1fr); */
                column-gap: 50px;
                scrollbar-width: none;
                /* border: solid 1px red;  */

                /*margin: 30px; */
                font-size: 50px;
                height: 100%;
                align-items: center;
              
                /* display: inline-block; */
            }
            #space_comment > .img_div{
                width: calc(100%*(<%=attachment.size()+1%>)); /* 슬라이더의 너비를 화면에 꽉 차게 설정 */
                overflow: hidden; /* 컨테이너 밖의 이미지는 숨김 처리 */
                display: flex; /* 이미지들을 가로로 나열 */
                animation: slide infinite 60s linear ; /* 애니메이션 적용 */
             
                height:100%;
            }
            #space_comment img{

                 width: calc(100%/(<%=attachment.size()+1%>)); /* 각 이미지가 슬라이더 너비에 맞게 조정 */
                 flex-shrink: 0; /* 이미지가 압축되지 않도록 설정 */
                 height:100%;
            }

            @keyframes slide {
                0% { transform: translateX(0); }
                100%{ transform: translateX(<%=min%>);  
            } 
               

                    
            }

             /* --------  */


            
            .img_div {
                height: 100%;
                width:100%;
                /* border: solid brown; */
                margin-bottom: 50px;
                align-items: center;
                transition: all 1s ease-in;
            }

            .img_div>img {
                 max-width: 100%;
                 height: 100%;

            }
           
            .quest {
                display: flex;
                justify-content: space-evenly;
                list-style: none;
            }
       
        

            /*--------리뷰---------*/
         



            /*------------*/
            #section_2 {
                /* border: solid gray; */
                width: 400px;

            }

            #section_2 div {
                margin-top: 20px;

            }

            #space_option_comment {
                border: 1px solid grey;
            }

            #detail_space {

                display: flex;
                justify-content: space-between;
            }
            #choiced input{
                border: none;
            }

            #detail_space_choice ,#detail_myspace {

                border: solid 1px #704DE4;
                padding: 15px;
            }

            #time_choice {
                display: none;
            }
            
          
            .time_box{
                height:100%;
                width:100%;
              
            }

            .time{
                /* height:30%; */
                font-size: 20px;
                width:100%;
              
            }


            .price{
                font-size: 20px;
              
            }
            

            #time_choice>ul {

                display: flex;
                justify-content: space-between;
                list-style: none;
                overflow: auto;
            }

            .price {
                /* border: solid 1px rgb(215, 213, 213); */

                /* background-color: yellow */
               
            }

            #space_option_kind {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 10px;
                margin: 15px;
                padding: 15px;

            }

            .option_kind {

                padding: 3px 3px;
                text-align: center;
              
                /* border: 1px solid gray;
            */
            }

            .button {
                background-color: #704DE4;
                color: #FFFFFF;
                border: solid #FFFFFF;


            }

       
       
        .heartColor{
        	color:red;
        
        }

        #reservation_btn{
                background-color: #2d10e6;
                color: white;
                border: none;
                padding: 6px 12px;
                cursor: pointer;
        }

        #category_btn{
                background-color: #dabc23;
                color: white;
                border: none;
                padding: 6px 12px;
                cursor: pointer;
        }

        #count_person{
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 60%;
            color: #999999;
            border-radius: 5px;
            text-align: center;
        }
        #plus{
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-image: linear-gradient(to right, #6a11cb, #2575fc);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            outline: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        #plus:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        #plus:active {
            transform: translateY(1px);
            box-shadow: 0 3px 5px rgba(0, 0, 0, 0.12);
        }



        #minus{
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-image: linear-gradient(to right, #f53505, rgb(204, 157, 148));
            border: none;
            border-radius: 5px;
            cursor: pointer;
            outline: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        #minus:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        #minus:active {
            transform: translateY(1px);
            box-shadow: 0 3px 5px rgba(0, 0, 0, 0.12);
        }

          

        </style>



    </head>

  
    <body>
      
     

     
      
     <%@ include file="../common/menubar.jsp"%>
     
        
            
             <% if(pickedMsg!=null){ %>
            	<script>
            		alert("<%=pickedMsg%>");
            	</script>
             <%  s.removeAttribute("pickedMsg"); %>
            <%} %>

          
            <nav id="main" class="navbar-light bg-light">
                 <input id="spaceNum" type="text" value="<%=space.getSpaceNo()%>" hidden> <!--공간번호--> 
                 <input id="userNo" type="text" value="<%=userNo%>" hidden >
				<% if(hostCheck==true){ %>
				    <input id="hostCheck" type="text" value="true" hidden>
					
				<%}
				 else {%>
				    <input id="hostCheck" type="text" value="false" hidden>
				 
				 <%} %>
             


                <div id="section_1">

                    <!--찜하기-->

                    <div id="space_id" name="space_name" class="title">
                        <div class="text"><%=space.getSpaceName() %> </div> 
                        <div id="picked_divs">찜하기<i class='fa-regular fa-heart'></i></div>
                    </div>

			      <script>
                
                      
                 </script>


                    <div id="space_comment" class="space">

                     

                             <div class="img_div" >
                                <% for (Attachment at: attachment) { %>
                                    <img src="<%=request.getContextPath()%>/<%=at.getFilePath()%><%=at.getChangeName()%>"/>

                                 <% } %>
                                 <% if(!attachment.isEmpty()){%>
                                    <img src="<%=request.getContextPath()%>/<%=attachment.get(0).getFilePath()%><%=attachment.get(0).getChangeName()%>"/>
                                 <% } %>
                             </div>
                    
                    </div>
                    
                    <div style="margin-bottom: 50px; font-size: 25px;" >
                        <div><%=space.getSpaceOneIntroduce() %></div>

                         <div id="spaceTage" style="font-size:17px; ">
                            <% for(String tag:tags){ %>
                                <span ><a href="#" style="color: #2d10e6;"><%=tag%></a><span>&nbsp;
                            <% } %>
                          </div>

                     </div>

                   

                    <div id="list">
                        <ul>
                            <li><a href="#space_intro">공간소개</a></li>
                            <li><a href="#space_guide">시설안내</a></li>
                            <li><a href="#reservation_warn">유의사항</a></li>
                            <li><a href="#space_qa">Q&A</a></li>
                            <li><a href="#space_review">이용후기</a></li>
                        </ul>
                    </div>
                    <div id="space_intro" name="space_intro" class="title">
                        <div class="text">
                           공간소개
                         </div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>
                    <div id="space_intro_comment" class="space">
                         <%=space.getSpaceIntroduce() %><br>
                      
                    </div>

                    <div id="space_guide" name="space_guide" class="title">
                        <div class="text">시설안내</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>

                    <div id="space_guide_comment" class="space">
                       
                               <% for(String guide:guides){%>
                                  <tr><td><%=guide%></td></tr><br>
                               <% } %>

                         
                    </div>


                    <div id="reservation_warn" name="reservation_warn" class="title">
                        <div class="text">예약시 주의사항</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>


                    <div id="reservation_warn_comment" class="space">
                        <%for(String c:caution){ %>
                            <tr><td><%=c%></td></tr><br>
                       <% } %>

                        
                    </div>


                    <div id="space_road" class="title">
                        <div class="text">길찾기</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>

                    <div id="space_road_comment" class="space">

                        <div id="map" style="width:1000px;height:500px;"></div>
                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${api}&libraries=services,clusterer,drawing"></script>
                        <script>
                            let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                               mapOption = {
                                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                            };  

                            // 지도를 생성합니다    
                            let map = new kakao.maps.Map(mapContainer, mapOption); 

                            // 주소-좌표 변환 객체를 생성합니다
                            let geocoder = new kakao.maps.services.Geocoder();

                            // 주소로 좌표를 검색합니다
                            geocoder.addressSearch("<%=space.getSpaceAddress()%>" , function(result, status) {

                                // 정상적으로 검색이 완료됐으면 
                                if (status === kakao.maps.services.Status.OK) {

                                    let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                    let marker = new kakao.maps.Marker({
                                        map: map,
                                        position: coords
                                    });

                                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                                    let infowindow = new kakao.maps.InfoWindow({
                                       content: '<div style="width:150px;text-align:center;padding:6px 0;">내공간</div>'
                                    });
                                    infowindow.open(map, marker);

                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                } 
                            });    
                        </script>
                    </div>



                    <div id="space_qa" name="space_qa" class="title">
                        <div class="text">Q&A</div>
                        <hr>
                    </div>



                        <div id="space_qa_comment" class="space">

                      
                    
                            <table id="comment_table"  class="list-group" >

                                <tbody id="comment_body" class='qa_body'></tbody>
                                    
                                    <!-- <tr class="comment_list">    

                                        <th class="nickName" style="width:20%">ADMIN</th>
                                        <td class="mb-1" > 데이터
                                        </td>
            
                                    </tr>
            
                                    <tr class="comment_list" >
                                            <th class="clear"></th>
                                            <td class="time">2024-04-11</td>
                                    </tr>
            

                                  
                                    <tr class="host_reply_title">
                                            <th class="clear"></th>
                                            <td><button class="btn btn-link p-0 host-reply-toggle" data-target="#hostReply">호스트 답글 보기</button></td>
                                    </tr>
            
                                    <tr class="host_reply">
                                            <th class="clear"></th>
                                            <td> <div id="hostReply" class="host-reply-content mt-2" style="display:none;">
                                                <p>호스트 답글내용</p>
                                            </div></td>

                                    </tr>
                                
                            
                        

                                    <로그인이 되어있고 호스트일때만 보이게 한다.
                                    <tr id="reply_info" class="comment_list">
                                            <th class="clear"></th>
                                            <td>
                                                <div>답글</div>

                                                <div id="reply div" style="width:100%; display:flex; justify-content: space-between;">

                                                
                                                    <div style="width:100%;">
                                                        <textarea placeholder="입력하세요" style="width:100%"></textarea>
                                                    </div>

                                                    <div><button type="button">등록하기</button></div>

                                                </div>

                                            </td>
                                    </tr>

                                    <tr id="comment_margin">
                                      <td colspan="2" id="comment_line"><hr></td>
                                    </tr>
                                -->
                              
                            </table> 
                        </div>

                   





                        <% if(member!=null) {%>
                            <div class="container mt-4">
                                <div class="card">
                                    <div class="card-header bg-primary text-white">
                                      QA등록
                                    </div>
                                    <div class="card-body">
                                      
                                     
                                            <div class="mb-3">
                                                <label for="review_content" class="form-label">QA작성</label>
                                                <textarea class="form-control" id="content" name="content" placeholder="입력하세요" rows="3" style="width: 100%;"></textarea>
                                            </div>
                                            <div class="d-grid">
                                                <button type="button" id="qa_enroll" class="btn btn-primary btn-block">QA작성하기</button>
                                            </div>
                                       
                                    </div>
                                </div>
                            </div>
                         <% } %>



                        <div id="space_review_title" name="space_qa" class="title">
                            <div class="text">리뷰</div>
                            <hr>
                        </div>
                      


                        <div id="space_review" class="space">
     
                             <table id="review_table" class="list-group">

                                <tbody id="review_body" ></tbody>
                       
                            </table>
                        </div>  <!--reivew_content  reivew_enroll-->

                        <% if(loginUser!=null) {%>
                           
                               <input type="text" name="spaceNum"  value="<%=space.getSpaceNo()%>" hidden/>
                            
                               <div class="container mt-4">
                                    <div class="card">
                                        <div class="card-header bg-primary text-white">
                                        리뷰등록
                                        </div>
                                        <div class="card-body">
                                            <form>
                                                <input type="hidden" name="spaceNum" value="<%=space.getSpaceNo()%>"> <!-- Ensure server-side template rendering supports this syntax -->
                                                <div class="mb-3">
                                                    <label for="review_content" class="form-label">리뷰작성</label>
                                                    <textarea class="form-control" id="reivew_content" name="content" placeholder="입력하세요" rows="3" style="width: 100%;"></textarea>
                                                </div>
                                                <div class="d-grid">
                                                    <button type="button" id="reivew_enroll" class="btn btn-primary btn-block">리뷰등록하기</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                        <% } %>

              
                </div>


                <div id="section_2">


     			  <% if(spaceKind.equals("spaces")&&(loginUser.getUserNo()!=space.getUserNo())) {%>


                    <!-- 유저가 게스트면-->
                    <div id="detail_space" class="title">
                        <div class="text2"> 세부공간선택</div>
                        <div id="icon"><i class="fa-solid fa-heart-circle-bolt"></i></div>
                    </div>

                    <div id="detail_space_choice">

                        <div class="space2">결제후 바로 예약확정</div>
                        <div>빠르고 확실한 예약을 위한 KH룸모아 방문에 감사해요</div>
                        <div></div>


                        <div id="space_detail_select">
                            <input type="radio" id="type" name="space_type" value="공간유형">
                            <label for="type">공간유형</label>
                        </div>

                        <div id="space_detail_comment">

                            <div class="img_div"><img src="<%=request.getContextPath()%>/<%=space.getSpaceMimg() %>" ></div>
                            <div>세부공간이미지</div>
                            <br>

                             <table>
                                <th>연략처:</th>
                                <td><%=space.getSpaceTel()%></td>
                             </table>

                        </div>

                        <div id="space_option" class="title">
                            <div class="text2">공간 설명란</div>
                            <hr class="line2" style="background:#704DE4">
                        </div>
                        <div id="space_option_comment">
                            <table align="center">
                                <tr>
                                    <th>공간유형:</th>
                                    <td><%=space.getSpaceKind()%></td>
                                </tr>

                                <tr>
                                    <th>가격:</th>
                                    <td><%=space.getSpacePrice()%></td>
                                </tr>


                                <tr>
                                    <th>예약유형:</th>
                                    <td>카드결제</td>
                                </tr>

                                <tr>
                                    <th>수용인원:</th>
                                    <td id="MaxPerson"><%=space.getSpaceCapacity()%></td>
                                </tr>

                            </table>
                        </div>
                        <div>

                            <div id=option_kind class="title"></div>
                            <div class="text2">시설물 옵션종류</div>
                            <hr class="line2" style="background:#704DE4">
                        </div>

                        <div id="space_option_kind">
                            <div class="option_kind">
                                <i class="fa-solid fa-chair"></i>
                                <span class>의자/테이블</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-toolbox"></i>
                                <span class>장비대여</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-plug"></i>
                                <span class>전기</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-bowl-rice"></i>
                                <span class>취사시설</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-burger"></i>
                                <span class>음식물 반입가능</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-water"></i>
                                <span class>온수</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-restroom"></i>
                                <span class>내부화장실</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-bars-progress"></i>
                                <span class>TV 프로젝터</span>
                            </div>
                            
                            <div class="option_kind">
                                <i class="fa-solid fa-wifi"></i>
                                <span class>WI-FI</span>
                            </div>
                        </div>

                        <hr class="line2">
                        <div id="reservation" class="title">예약선택</div>
                        <hr class="line2" style="background:#704DE4">
                        <div id="reservation_choice">
                            <div>
                                <input type="radio" name="reservation" id="time" value="time">
                                <label for="time">시간단위 예약하기</label>
                            </div>

                          

                        </div>

                        <div id="date" class="title">날짜 선택</div>
                        <hr class="line2" style="background:#704DE4">

                        <div id="calendar">
                            <!--fc-daygrid-day-number-->

                        </div>


                      
                        <script>


                            //캘린더 이벤트
                          

                        </script>


                        <div id="time" class="title">
                            <div>시간선택</div>
                            <div id="choiced">
                                <table>
                                    <tr>
                                        <th>선택된 날짜</th>
                                        <td><input id=choiced_date type="text" disabled></td>
                                    </tr>
                                    <tr>
                                        <th>시간</th>
                                        <td><input id=choiced_time type="text" disabled></td>
                                   
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td><input id=gap_time type="number" disabled>시간</td>
                                     </tr>
                                 </table>
                            
                                
                              
                                <input id="choiced_price" type="number" hidden >
                            </div>
                        </div>
                        <hr class="line2" style="background:#704DE4">



                        <div id="time_choice">
                            <ul class="list-group list-group-horizontal" >
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time" style="display:inline;">9</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>
                                <li  class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">10</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">11</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">12</div>
                                        <div class="price">2000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">13</div>
                                        <div class="price">2000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">14</div>
                                        <div class="price">3000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">15</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">16</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">17</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">18</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">19</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">20</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>

                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">21</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>

                                <li class="list-group-item">
                                    <div class="time_box">
                                        <div class="time">22</div>
                                        <div class="price">1000</div>
                                    </div>
                                </li>


                            </ul>


                        </div>
                        <div id="reservation_checked">예약여부
                            <hr class="line2">
                            <div>예약가능합니다.</div>
                        </div>

                        <div id="count" class="title">총 예약인원</div>
                        <hr class="line2">
                        <div id="count_select" align="center">
                            <span ><button  id="minus">-</button></span>
                            <input id="count_person" type="number" name="number" disabled  style="width:60%">
                            <span ><button id="plus">+</button></span>
                        </div>
                    </div>

                    <script>

                        //예약인원버튼 이벤트

                       
                    </script>

                   

                       <!-- <% if (member!=null){ %>
                         <input id="userId" type="text" value="<%=member.getUserId()%>" hidden >
                        <% } else {%>
                            <input id="userId" type="text" value="-1" hidden >
                        <% } %> -->

                  		
                  		
                  
                        <div align="center" style="margin-top:0px;">
                            <% if(loginUser!=null){ %>
                        
                            <button  class="navbar-toggler" type="button" class="button" data-toggle="modal"  data-target="#pay-modal" 
                                id="reservation_btn" style="color:white">예약하기</button>
                            <button  id="category_btn"   class="navbar-toggler" type="button" class="button" style="color:white" onclick="location.href='<%=contextPath%>'">목록으로</button>
                            <%}else{%>
						
						       <button class="navbar-toggler" type="button" class="button" >로그인하세요</button>
						
							<%}%>
                            
                        </div>
						
						
						
                    
                    
                    
                    
                    
                    
                    <!-- 결제창 타켓  modal-->
                    <div class="modal" id="pay-modal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">결재하기</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body" align="center">
                                    <form action="reservationInsert.me"  method="POST">
                                        
                                          <input id="s"  type="text" name="spaceNum" value="<%=space.getSpaceNo()%>" hidden>
                                    
                                     
                                         <table>
                                            <tr>
                                                <th>사용자이름</th>
                                                <td><%=(loginUser!=null)?loginUser.getUserName():"none" %></td>
                                            </tr>
                                            <tr>
                                                <th>예약날짜</th>
                                                <td id="reservationDateDiv"></td> 
                                            </tr>
                                            <tr>
                                                <th>예약시간</th>
                                                <td id="reservationTimeDiv"></td>  
                                               
                                            </tr>
                                            <tr>
                                                <th>예약인원</th>
                                                <td id="personalCountDiv"></td>  
                            
                                            </tr>
                                            <tr>
                                                <th>결재금액</th>
                                                <td id="paymentDiv"></td>  
                                            </tr>
                                           
                                        </table>

                                        <br>
                                        <button id="edit-pwd-btn" type="submit" class="btn btn-sm btn-secondary">
                                            결재하기
                                        </button>

                                        <div id ="AddTime" ></div>
                                        <input id="userName" type="text" name="name" value="<%=(loginUser!=null)?loginUser.getUserName():"none" %>" hidden>
                                        <input type="text"  id="payment" name="payment" hidden >
                                        <input type="text" id="personalCount" name="count" hidden>
                                        <input type="text" id="reservationTime" name="time" hidden>
                                        <input type="text" id="reservationDate" name="date" id="re_time" hidden >
                                    </form>
                              
                
                                </div>


                                <script>
                                    //모달창 이벤트
            
                                </script>
                              


                            </div>
                        </div>
                    </div>
                    
                    
                    
                     <!--유저가 호스트면-->
                   <% } 
     			    else { %>
                  
					<div id="detail_myspace" >

                        <div id="space_detail_select">
                            <div class="text2"> 공간유형</div>

                        </div>

                        <div id="space_detail_comment">

                            <div class="img_div"><img src="<%=request.getContextPath()%>/<%=space.getSpaceMimg()%>"></div>
                            <div>세부공간이미지</div>
                            <br>
                            <table>
                                <th>연략처:</th>
                                <td><%=space.getSpaceTel()%></td>
                            </table>
                              

                        </div>

                        <div id="space_option" class="title">
                            <div class="text2">가구 설명란</div>
                            <hr class="line2" style="background:#704DE4">
                        </div>
                        <div id="space_option_comment">
                            <table align="center">
                                <tr>
                                    <th>공간유형:</th>
                                    <td><%=space.getSpaceKind()%></td>
                                </tr>

                                <tr>
                                    <th>가격:</th>
                                    <td><%=space.getSpacePrice()%></td>
                                </tr>


                                <tr>
                                    <th>예약유형:</th>
                                    <td>카드결제</td>
                                </tr>

                                <tr>
                                    <th>수용인원:</th>
                                    <td id="MaxPerson"><%=space.getSpaceCapacity()%></td>
                                </tr>

                            </table>
                        </div>
                        <div>

                            <div id=option_kind class="title"></div>
                            <div class="text2">시설물 옵션종류</div>
                            <hr class="line2" style="background:#704DE4">
                        </div>

                        <div id="space_option_kind">
                            <div class="option_kind">
                                <i class="fa-solid fa-chair"></i>
                                <span class>의자/테이블</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-toolbox"></i>
                                <span class>장비대여</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-plug"></i>
                                <span class>전기</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-bowl-rice"></i>
                                <span class>취사시설</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-burger"></i>
                                <span class>음식물 반입가능</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-water"></i>
                                <span class>온수</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-restroom"></i>
                                <span class>내부화장실</span>
                            </div>
                            <div class="option_kind">
                                <i class="fa-solid fa-bars-progress"></i>
                                <span class>TV 프로젝터</span>
                            </div>
                            
                            <div class="option_kind">
                                <i class="fa-solid fa-wifi"></i>
                                <span class>WI-FI</span>
                            </div>
                        </div>

                        <div align="center">
                            <button type="button" class="button"   onclick="location.href='<%=request.getContextPath()%>/update.sp?spaceNum=<%=space.getSpaceNo()%>'">수정하기</button>
                            <form action="#" method="post" style="display: inline;">
                                <button type="button" class="button" onclick="cancelReservation(<%=space.getSpaceNo()%>)">삭제하기</button>
                            </form>
                            <button type="button" class="button"     onclick="location.href='<%=request.getContextPath()%>/main.ho'">호스트 홈</button>
                        
                        </div>
                        <script>

                             function cancelReservation(spaceNo){
                                let confirmCheck=confirm("등록취소하시겠습니까?");
                                if(confirmCheck){
                                   location.href=`<%=request.getContextPath()%>/delete.sp?spaceNum=`+spaceNo+` `
                                }
                                else{
                                    return false;
                                }
                             }

                        </script>

                    </div>


                

                 </div>
                 
                 <%} %>

            </nav>

          


    </body>

    </html>