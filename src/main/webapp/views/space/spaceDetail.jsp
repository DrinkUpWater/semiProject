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
		
		   
		 
		   
		   if(space.getSpaceTag()!=null){
			 tags=space.getSpaceTag().split(" ");
		   }else{
			  tags=new String[1];
			  tags[0]=" ";
		   }
		   
		   
		   if(space.getSpaceInformation()!=null){
			 guides=space.getSpaceInformation().split(",");
		   }
		   else{
			  guides=new String[1];
			  guides[0]=" ";
		   }
		   
		 
		  
		   
		  boolean hostCheck=false;
		  if(space.getUserNo()==userNo){
			   hostCheck=true;
		  } 
    	
         
    	 
    	
       
    
    
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


        <script src="<%=request.getContextPath()%>/views/space/js/calenderClick.js"></script>
        <script src="<%=request.getContextPath()%>/views/space/js/modal.js"></script>
        <script src="<%=request.getContextPath()%>/views/space/js/reservationNum.js"></script>
        <script src='<%=request.getContextPath()%>/views/space/fullcalendar/main.min.js'></script>
        <script src='<%=request.getContextPath()%>/views/space/js/comment.js'></script>
        <script src='<%=request.getContextPath()%>/views/space/js/review.js'></script>

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
                grid-template-rows: repeat(2, 250px);
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

            #space_comment>div {
                height: 100%;
                /* display: inline-block; */
            }
           

            .img_div {
                height: 100%;
                width:100%;
                /* border: solid brown; */
                margin-bottom: 50px;
                align-items: center;
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



            #space_qa_comment{
                overflow: auto;
                /* border:solid blue; */
               
            }
           
            /*----------QA--------------*/
            #comment_table{
                height:100%;
                width:100%;
              
            }

            /* #comment_table tr th td{
                width:100%;
            } */

            #comment_table td {
                padding-top: 8px;
                padding-bottom: 8px;
            }

             #comment_table th, #comment_table td {
                /* vertical-align: top; */
            }

            #comment_table .time {
                font-size: 0.8rem;
                color: #666;
            }

            #review_table .time{
                font-size: 0.8rem;
                color: #666;
            }

            .time{
                font-size: 0.8rem;
                color: #666;
            }


            #comment_table .time {
                font-size: 0.8rem;
                color: #666;
            }

            
            .comment_list{
             /* resize:none; */
             padding: 8px;
           }
           .comment_list >th{
              width:200px;
           }
           .comment_list >td{
              width:500px;
           }
          
          

           #hostReplyContent{
             width:50px;
           }
            .clear {
                width: 20%;
            }
            .mb-1 {
                margin-bottom: .25rem;
            }
            textarea{
               
              resize:none;
              /* resize:vertical; */
              height: 100%;
           
            }

            .comment_list:last-child {
               border-bottom: none;
             }
         


             .nickName {
                 font-weight: bold;
             }

             #comment_info{
                width:100%;
             }
           
            .host-reply-content {
                background-color: #f9f9f9;
                padding: 8px;
                margin-top: 5px;
                border-left: 3px solid #007bff;
            }

            .host-reply-toggle {
                font-size: 0.9rem;
                color: #007bff;
                cursor: pointer;
                padding: 0;
                border: none;
                background: none;
             }

             button[type="button"],button[type="submit"]{
                background-color: #6623da;
                color: white;
                border: none;
                padding: 6px 12px;
                cursor: pointer;
            }
            button[type="button"]:hover ,button[type="submit"]:hover{
             background-color: #0056b3;
            }


            #comment_list{
               /* display:none; */
                
               width:90%;
                margin-left:10%;
               border: solid 1px salmon;
               
              
            }
            #comment_list>ul{
                text-align: center;
                border: solid 1px rgb(216, 80, 65);
            }
            #comment_list li{
                
                list-style: none;
            }


            .comment_list{
                margin-bottom: 100px;
              
            }
            
           
            #comment_list li{
                
                list-style: none;
            }

        

            /*--------리뷰---------*/
           
            #space_review{
                overflow: auto;
                /* border:solid blue; */
               
            }




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

            #detail_space_choice {

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
                border: solid 1px rgb(223, 219, 219);
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

				<% if(hostCheck==true){ %>
				    <input id="hostCheck" type="text" value="true" hidden>
					
				<%}
				 else {%>
				    <input id="hostCheck" type="text" value="false" hidden>
				 
				 <%} %>
				


                <div id="section_1">


                    <div id="space_id" name="space_name" class="title">
                        <div class="text"><%=space.getSpaceName() %> </div> 
                        <div id="picked_divs" onclick="picked(this)" >찜하기<i class='fa-regular fa-heart'></i></div>
                    </div>

			      <script>
                
                        window.onload = function(){
                      
                        	  pickedview();
                          
                          };
                          
                         
                          
                        function pickedview(){
                         	 	
                        	  <%if(member==null){%>
                        	     
                       	 	 	  return false;
                       	 
                       		  <% }%>  
                        	
                              let spaceNo=document.querySelector("#spaceNum").value;
                              let picked=document.querySelector("#picked")
                              let pickedText=document.querySelector("#picked_divs");
                          	
                              
                              $.ajax({

                                  url:'pickedcheck.sp',
                                  type:'GET',
                              
                                  data:{
                                      spaceNum:spaceNo
                       
                                  },

                                  success:function(response){
                                 
                                  
                                  if(response==="찜하기"){
                                 	 pickedText.innerHTML=response+"<i class='fa-regular fa-heart'></i>"
                                  
                                  }
                                  else{
                                 	 pickedText.innerHTML=response+"<i class='fa-solid fa-heart' style='color:red'></i>"
                                  }
                                  
                                 },
                                  error:function(error){
                                      console.log("error"+error);

                                  }


                              })
                         
                         	 
                         	 
                         }
                                 
                                 
                             
                          
                              function picked(_this){
                            	
                            	  <%if(member==null){%>
                            	     alert("로그인해주세요");
                              	 	 return false;
                              	 
                              	 <% }%>  
                            	  
                            	  
                                let spaceNo=document.querySelector("#spaceNum").value;
                                let picked=document.querySelector("#picked")
                            
                                
                                $.ajax({

                                    url:'picked.sp',
                                    type:'GET',
                                
                                    data:{
                                        spaceNum:spaceNo
                         
                                    },

                                    success:function(response){
                                    console.log(response);
                                    
                                    if(response==="찜하기"){
                                    	_this.innerHTML=response+"<i class='fa-regular fa-heart'></i>"
                                    
                                    }
                                    else{
                                    	_this.innerHTML=response+"<i class='fa-solid fa-heart' style='color:red'></i>"
                                    }
                                    
                                   },
                                    error:function(error){
                                        console.log("error"+error);

                                    }


                                })
                           
                                

                                // if(_this.innerText==="찜하기"){
                                //     _this.innerText="찜해제";
                                //     alert("찜해제되었습니다.")
                                // }
                                // else{
                                //     _this.innerText="찜하기";
                                //     alert("찜하기");
                                // }



                             }

                       </script>


			   <div id="space_comment" class="space">

                        <div class="img_div" >

                            <img src="<%=request.getContextPath()%>/<%=space.getSpaceMimg()%>"/>
                            
                         </div>

                        <div style=" padding-top:20px; ">
                            <span>
                                <%=space.getSpaceOneIntroduce() %>
                            </span>

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
                        <table>
                          <% for(String tag:tags){ %>
                              <span><a href="#"><%=tag%></a><span>&nbsp;
                          <% } %>
                        </table>
                    </div>

                    <div id="space_guide" name="space_guide" class="title">
                        <div class="text">시설안내</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>

                    <div id="space_guide_comment" class="space">
                        <table>
                            <tbody>
                               <% for(String guide:guides){%>
                                  <tr><td><%=guide%></td></tr>
                               <% } %>

                            </tbody>

                        </table>







                    </div>


                    <div id="reservation_warn" name="reservation_warn" class="title">
                        <div class="text">예약시 주의사항</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>


                    <div id="reservation_warn_comment" class="space">
                          <%=space.getSpaceCaution()%>
                    </div>


                    <div id="space_road" class="title">
                        <div class="text">길찾기</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>
                    <div id="space_road_comment" class="space">


                       <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.378379236162!2d127.03290899999996!3d37.49899300000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec255555555%3A0x3565475c3365c5bb!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1712133003105!5m2!1sko!2skr"
                            style="border:0; width:100%; height:200%;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade" > </iframe>

                        

                    </div>



                    <div id="space_qa" name="space_qa" class="title">
                        <div class="text">Q&A</div>
                        <hr>
                    </div>



                    <div id="space_qa_comment" class="space  container mt-4">

                    
                            <table id="comment_table" class="list-group" >
                                
                                    
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

                    <script>
                        // $(document).ready(function(){
                        //     $(".host-reply-toggle").click(function(){
                        //         let targetId = $(this).data("target");
                        //         $(targetId).toggle();
                        //     });
                        // });
                    </script>

                        <% if(member!=null) {%>
                    
                        <div id="comment_info" style="height:80px">
                            <th></th>
                            <td>
                                <div class="QA" style="  font-size: 1.2rem; margin-top:30px">QA등록하기</div>

                                <div id="comment div" style="width:100%; height:100%; display:flex; justify-content:center;">
                                    
                                    <div style="width:100%">
                                        <textarea id="content" placeholder="입력하세요" style="width:500px;"  ></textarea>
                                       
                                    </div>



                                    <div style=" width:100%; height:100%;"><button id="comment_enroll" type="button" style="height:100%;" >등록하기</button></div>

                                </div>

                            </td>
                        </div>

                         <% } %>



                        <div id="space_review_title" name="space_qa" class="title">
                            <div class="text">리뷰</div>
                            <hr>
                        </div>
                      


                        <div id="space_review" class="space">
     
                             <table id="review_table" class="list-group">

                                <tbody class='comment_body'></tbody>
                       
                            </table>



                        </div>

                        <% if(loginUser!=null) {%>
                            <form action="<%=contextPath%>/reviewInsert.sp" method="POST">
                                <input id="spaceNum" type="text" value="1" hidden> <!--공간번호--> 
                            
                                    <div id="comment_info" style="height:80px">
                                        <th></th>
                                        <td>
                                            <div class="review" style="  font-size: 1.2rem; margin-top:30px">리뷰 등록하기</div>

                                            <div id="comment div" style="width:100%; height:100%; display:flex; justify-content:center;">

                                                <input type="text" name="spaceNum"  value="<%=space.getSpaceNo()%>" hidden>
                                                <div style="width:100%">
                                                    <textarea id="content" placeholder="입력하세요" name="content" style="width:500px;" ></textarea>
                                                </div>
                                                <div style=" width:100%; height:100%;"><button id="comment_enroll" type="submit" style="height:100%;">등록하기</button></div>
                                            </div>
                                       
                                        
                                              
                                        </td>   
                                    </div>
                            </form> 
                        <% } %>
                                        
                                  
                                   

                                   
                            
                      

                </div>
              



                <div id="section_2">


     			  <% if(spaceKind.equals("spaces")) {%>


                    <!-- 유저가 게스트면-->
                    <div id="detail_space" class="title">
                        <div class="text2"> 세부공간선택</div>
                        <div id="icon">아이콘 아이콘</div>
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

                            <div class="img_div"><img src="<%=request.getContextPath()%>/<%=attachment.get(0).getFilePath()%>" >세부공간이미지</div>

                            <p>
                                <span>서울대 입구..스터디룸 카페 예약
                                    서울대 입구..스터디룸 카페 예약
                                    서울대 입구..스터디룸 카페 예약
                                    서울대 입구..스터디룸 카페 예약
                                    서울대 입구..스터디룸 카페 예약
                                </span>
                            </p>

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
                            <div class="option_kind">1</div>
                            <div class="option_kind">2</div>
                            <div class="option_kind">3</div>
                            <div class="option_kind">4</div>
                            <div class="option_kind">5</div>
                            <div class="option_kind">6</div>
                            <div class="option_kind">7</div>
                            <div class="option_kind">8</div>
                            <div class="option_kind">9</div>
                            <div class="option_kind">10</div>
                            <div class="option_kind">11</div>
                            <div class="option_kind">12</div>
                        </div>

                        <hr class="line2">
                        <div id="reservation" class="title">예약선택</div>
                        <hr class="line2" style="background:#704DE4">
                        <div id="reservation_choice">
                            <div>
                                <input type="radio" name="reservation" id="time" value="time">
                                <label for="time">시간단위 예약하기</label>
                            </div>

                            <div>
                                <input type="radio" name="reservation" id="pack" value="pack">
                                <label for="pack">패키지로 예약하기</label>
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
                            <div>예약불가합니다.</div>
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

                       <input id="userNo" type="text" value="<%=userNo%>" hidden >

                       <!-- <% if (member!=null){ %>
                         <input id="userId" type="text" value="<%=member.getUserId()%>" hidden >
                        <% } else {%>
                            <input id="userId" type="text" value="-1" hidden >
                        <% } %> -->

                  		
                  		
                  
                        <div align="center" style="margin-top:0px;">
                            <% if(loginUser!=null){ %>
                        
                            <button  class="navbar-toggler" type="button" class="button" data-toggle="modal"  data-target="#pay-modal" 
                                id="reservation_btn" style="color:white">예약하기</button>
                            <button class="navbar-toggler" type="button" class="button" style="color:white" onclick="location.href='<%=contextPath%>'">목록으로</button>
                            <%}else{%>
						
						       <button class="navbar-toggler" type="button" class="button" style="color:white">로그인하세요</button>
						
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
                                                <td>사용자이름</td>
                                                <td><input id="userName" type="text" name="name" value="<%=(loginUser!=null)?loginUser.getUserName():"none"%>"></td>
                                            </tr>
                                            <tr>
                                                <td>예약날짜</td>
                                                <td><input type="text" id="reservationDate" name="date" id="re_time" ></td>
                                            </tr>
                                            <tr>
                                                <td>예약시간</td>
                                                <td><input type="text" id="reservationTime" name="time" >
                                            
                                            </tr>
                                            <tr>
                                                <td id ="AddTime" >
															

                                                </td>

                                            </tr>
                                            <tr>
                                                <td>예약인원</td>
                                                <td><input type="text" id="personalCount" name="count" ></td>
                                            </tr>
                                            <tr>
                                                <td>결재금액</td>
                                                <td><input type="text"  id="payment" name="payment"  ></td>
                                            </tr>
                                           
                                        </table>
                                        <br>
                                        <button id="edit-pwd-btn" type="submit" class="btn btn-sm btn-secondary">
                                            결재하기
                                        </button>

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
     			   
					<div >

                        <div id="space_detail_select">
                            <div class="text2"> 공간유형</div>

                        </div>

                        <div id="space_detail_comment">

                            <div class="img_div"><img src="<%=request.getContextPath()%>/<%=attachment.get(0).getFilePath()%>">세부공간이미지</div>
                    

                            <p>
                                <span>서울대 입구..스터디룸 카페 예약
                                    서울대 입구..스터디룸 카페 예약
                                    서울대 입구..스터디룸 카페 예약
                                    서울대 입구..스터디룸 카페 예약
                                    서울대 입구..스터디룸 카페 예약
                                </span>
                            </p>

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
                            <div class="option_kind">1</div>
                            <div class="option_kind">2</div>
                            <div class="option_kind">3</div>
                            <div class="option_kind">4</div>
                            <div class="option_kind">5</div>
                            <div class="option_kind">6</div>
                            <div class="option_kind">7</div>
                            <div class="option_kind">8</div>
                            <div class="option_kind">9</div>
                            <div class="option_kind">10</div>
                            <div class="option_kind">11</div>
                            <div class="option_kind">12</div>
                        </div>  

                        <div align="center">
                            <form action="#" method="post" style="display: inline;">
                                <button type="button" class="button" onclick="location.href='<%=request.getContextPath()%>/delete.sp?spaceNum=<%=space.getSpaceNo()%>'">취소하기</button>
                            </form>
                            <button type="button" class="button"     onclick="location.href='<%=request.getContextPath()%>/main.ho'">호스트 홈</button>
                        </div>

                    </div>


                

                 </div>
                 
                 <%} %>

            </nav>

          


    </body>

    </html>