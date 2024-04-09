<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
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


        <script src=" <%=request.getContextPath()%>/views/space/js/calenderClick.js"></script>
        <script src="<%=request.getContextPath()%>/views/space/js/modal.js"></script>
        <script src="<%=request.getContextPath()%>/views/space/js/reservationNum.js"></script>
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


            .space {
            
                display: grid;
                grid-template-rows: repeat(2, 250px);
                /* grid-template-columns: repeat(3, 1fr); */
                column-gap: 50px;

                border: solid 1px red; 

                margin: 10px;
                font-size: 20px;
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
                display: inline-block;
            }

            .img_div {
                height: 100%;
                /* border: solid brown; */
                margin-bottom: 50px;
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
                border:solid blue;
               
            }
           
            #comment_table{
                height:100%;
              
            }
            #comment_info{
                width:100%;
            }
            .qa_table div{
                /* height:100%; */
                /* border:solid 1px green ; */
              
            }
   

            #content_info{
               
                width:90%;
                margin-left:10%;
                word-break: break-all;
                border: solid 1px blue; 
                overflow:auto;
                height:100%;
              
            }

            #content{
               
               /* overflow:auto; */
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

            .qa_table ul{
                
                height:100%;
                overflow:auto;
              
            }

            .qa_table ul>li{
                list-style: none;
                margin:15px;
            }


            .comment_list{
                margin-bottom: 100px;
                /* border:  solid pink; */
            }
            

            #content_info{
               
                width:90%;
                margin-left:10%;
              
                border: solid 1px blue; 
              
                height:100%;
              
            }
        
           

            #comment_list>ul{
                text-align: center;
                border: solid 1px rgb(216, 80, 65);
            }
            #comment_list li{
                
                list-style: none;
            }

        
            #comment_margin{
                margin: 10px;
                height:100%;
            }
            #space_review_comment{
                /* display :grid;
                grid-template-rows: repeat(2, 250px);
                border:solid 1px green ; */
            }

            /* #space_qa_comment{
                display :grid;
                grid-template-rows: repeat(2, 250px);
                border:solid 1px red ;
            } */


            #space_review_comment{
                /* display :grid;
                grid-template-rows: repeat(2, 250px);
                border:solid 1px green ; */
            }

            /* #space_qa_comment{
                display :grid;
                grid-template-rows: repeat(2, 250px);
                border:solid 1px red ;
            } */



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

            #detail_space_choice {

                border: solid 1px #704DE4;
                padding: 15px;
            }

            #time_choice {
                display: none;
            }

            #time_choice>ul {

                display: flex;
                justify-content: space-between;
                list-style: none;
                overflow: auto;
            }

            .price {
                border: solid rgb(215, 213, 213);

                background-color: yellow;
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

       

          /*답글 hover처리*/

             .host_replay{
                display: none;
            } 

            /* #host_replay_title:hover+#host_replay{
                display: block;
            } */ 

          

        </style>



    </head>


    <body>
        <%@ include file="../common/menubar.jsp" %>

            <div id="main">

                <div id="section_1">


                    <div id="space_id" name="space_name" class="title">
                        <div class="text"> 르씨엘 2호점</div>
                    </div>
                    <div id="space_comment" class="space">
                        <div align="left" class="img_div">

                            <img src="<%=request.getContextPath()%>/resources/space_img/test.png">

                        </div>
                        <div style=" padding-top:20px; ">
                            <span>
                                sdfgsfdg sdfg
                                asdfadsf
                                asdfadsfadsf
                                asdasdfdasfasdfadsfdsdsadsf
                                fasdf
                                시설물 설명
                                시설물 설명
                                시설물 설명
                                시설물 설명
                                시설물 설명
                                시설물 설명
                                시설물 설명
                            </span>

                        </div>
                    </div>

                    <div id="list">
                        <ul>
                            <li><a href="#space_intro">공간소개</a></li>
                            <li><a href="#intro">시설안내</a></li>
                            <li><a href="#warn">유의사항</a></li>
                            <li><a href="#QanA">Q&A</a></li>
                            <li><a href="#space_review">이용후기</a></li>
                        </ul>
                    </div>
                    <div id="space_intro" name="space_intro" class="title">
                        <div class="text">공간소개</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>
                    <div id="space_intro_comment" class="space">
                        [강남역 10번출구 1분거리]
                        <br><br>
                        어떤 만남도 대충하지 않는 사람들을 위한 감성공간,공튜디오입니다.
                        <br><br>
                        #스터디룸
                        #회의실
                        #생일파티
                        #브라이덜샤워
                        <br>
                        등 다양한 모임공간으로 활용할 수 있습니다.


                    </div>

                    <div id="space_guide" name="intro" class="title">
                        <div class="text">시설안내</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>

                    <div id="space_guide_comment" class="space">
                        <table>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>초고속 와이파이+전기종 가능한 충전기</td>
                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td>정수기+산딸기 티+ 복숭아티+사과티+아메리카노+간식</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>정수기+산딸기 티+ 복숭아티+사과티+아메리카노+간식</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>정수기+산딸기 티+ 복숭아티+사과티+아메리카노+간식</td>
                                </tr>

                                <tr>
                                    <td>5</td>
                                    <td>정수기+산딸기 티+ 복숭아티+사과티+아메리카노+간식</td>
                                </tr>

                                <tr>
                                    <td>6</td>
                                    <td>정수기+산딸기 티+ 복숭아티+사과티+아메리카노+간식</td>
                                </tr>

                            </tbody>

                        </table>







                    </div>


                    <div id="reservation_warn" name="warn" class="title">
                        <div class="text">예약시 주의사항</div>
                        <hr class="line2" style="background:rgb(235, 229, 229) ">
                    </div>


                    <div id="reservation_warn_comment" class="space">
                        <table>
                            <tbody>
                                <tr>
                                    <td>1.</td>
                                    <td>최소 1인,최대 12인까지 이용 가능합니다.</td>
                                </tr>

                                <tr>
                                    <td>2.</td>
                                    <td>3인부터 최소 2시간부터 이용 가능합니다.</td>
                                </tr>
                                <tr>
                                    <td>3.</td>
                                    <td>예약은 선입금 제로 만 가능하며,예약된 사용시간 전에 퇴실하여도 잔여 시간은 환불이 불가합니다.</td>
                                </tr>
                                <tr>
                                    <td>4.</td>
                                    <td>추가인원은 연락주시면 안내 도와드리고 있으며 인원 변동 가능성 있을시 최소 인원으로 예약후 인원 확정이
                                        되면 연락후, 계좌이체로 추가금액 지불해주시면 됩니다.
                                    </td>
                                </tr>

                                <tr>
                                    <td>5.</td>
                                    <td>지나친 소음은 삼가해주세요</td>
                                </tr>

                                <tr>
                                    <td>6.</td>
                                    <td>음식물 취식은 가능하나,구비된 음식물 쓰레기 봉투에 담은후 1층
                                        후문 쓰레기장에 직접 배출해주셔야합니다.
                                    </td>
                                </tr>

                            </tbody>

                        </table>
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

                    <div id="space_qa" name="QanA" class="title">
                        <div class="text">Q&A</div>
                        <hr>
                    </div>



                    <div id="space_qa_comment" class="space">

                      
                        <table id="comment_table" >
                            <% for(int i=0; i<5; i++){ %>

                                <tbody>
                                 <tr class="comment_list">    

                                    <th class="nickName" style="width:20%">닉네임</th>
                                    <td >내용내용내용내용내용내용내용내용내용내용내용내용내용내용
                                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용
                                            내용내용내용내용내용내용내용내용내용내용내용내용내용내용
                                    </td>
        
                                 </tr>
        
                                 <tr class="comment_list" >
                                        <th class="clear"></th>
                                        <td>시간</td>
                                 </tr>
        

                                 <!--호스트 답글창-->
                                <tr class="host_replay_title"+<%=i%>>
                                        <th></th>
                                        <td><p>호스트답글</p></td>
                                </tr>
        
                                <tr class="host_replay">
                                        <th></th>
                                        <td>호스트 답글내용</td>

                                </tr>
                               
                          
                       

                                <!--로그인이 되어있고 호스트일때만 보이게 한다.-->
                                <tr id="reply_info" class="comment_list">
                                        <th></th>
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
                            </tbody>

                             
                           
                        <%} %>
                       

                        </table>
                    </div>

                    <script>

                      
    



                      

                    </script>

                  
                        <div id="comment_info">
                            <th></th>
                            <td>
                                <div>QA등록하기</div>

                                <div id="comment div" style="width:100%; display:flex; justify-content: space-between;">


                                
                                    <div style="width:100%;">
                                        <textarea placeholder="입력하세요" style="width:100%"></textarea>
                                    </div>



                                    <div><button type="button">등록하기</button></div>

                                </div>

                            </td>
                        </div>


                      




                    <div id="space_qa_review" class="space">

                        <div id="space_review" name="space_review" class="title">
                            <div class="text">리뷰</div>
                            <hr>
                        </div>
                    </div>



                </div>
              



                <div id="section_2">

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

                            <div class="img_div"><img src="<%=request.getContextPath()%>/resources/space_img/test.png" >세부공간이미지</div>

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
                                    <td>xxxxxx</td>
                                </tr>

                                <tr>
                                    <th>공간면적:</th>
                                    <td>xxxxxx</td>
                                </tr>


                                <tr>
                                    <th>예약유형:</th>
                                    <td>xxxxx</td>
                                </tr>

                                <tr>
                                    <th>최소1명~N명:</th>
                                    <td>xxxxx</td>
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
                                선택된 날짜:<input id=choiced_date type="text" disabled>
                                <input id=choiced_time type="text" disabled>
                                <input id=gap_time type="number" disabled>시간
                                <input id="choiced_price" type="number" hidden >
                            </div>
                        </div>
                        <hr class="line2" style="background:#704DE4">



                        <div id="time_choice">
                            <ul>
                                <li>
                                    <div class="time_box">
                                        <span class="time">9</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">10</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">11</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">12</span>
                                        <span class="price">2000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">13</span>
                                        <span class="price">2000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">14</span>
                                        <span class="price">3000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">15</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">16</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">17</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">18</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">19</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="time_box">
                                        <span class="time">20</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>

                                <li>
                                    <div class="time_box">
                                        <span class="time">21</span>
                                        <span class="price">1000</span>
                                    </div>
                                </li>

                                <li>
                                    <div class="time_box">
                                        <span class="time">22</span>
                                        <span class="price">1000</span>
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



                    <div align="center" style="margin-top:0px;">
                        <button type="button" class="button" data-toggle="modal"  data-target="#pay-modal" 
                            id="reservation_btn">예약하기</button>
                        <button type="button" class="button">목록으로</button>
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
                                    <form action="#" method="POST">
                                        <input type="hidden" name="userId" value="">
                                        <table>
                                            <tr>
                                                <td>사용자이름</td>
                                                <td><input id="userName" type="text" name="name" disabled value="user"></td>
                                            </tr>
                                            <tr>
                                                <td>예약날짜</td>
                                                <td><input type="text" id="reservationDate" name="date" id="re_time" disabled></td>
                                            </tr>
                                            <tr>
                                                <td>예약시간</td>
                                                <td><input type="text" id="reservationTime" name="time" disabled>
                                            
                                            </tr>
                                            <tr>
                                                <td id ="AddTime" >


                                                </td>

                                            </tr>
                                            <tr>
                                                <td>예약인원</td>
                                                <td><input type="text" id="personalCount" name="count" disabled></td>
                                            </tr>
                                            <tr>
                                                <td>결재금액</td>
                                                <td><input type="number"  id="payment" name="payment" disabled ></td>
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


                    <div style="display: block;">

                        <div id="space_detail_select">
                            <div class="text2"> 공간유형</div>

                        </div>

                        <div id="space_detail_comment">

                            <div class="img_div"><img src="<%=request.getContextPath()%>/resources/space_img/test.png">세부공간이미지</div>

                            <div class="img_div"><img src="../../resources/space_img/test.png">세부공간이미지</div>


                            <div class="img_div"><img src="<%=request.getContextPath()%>/resources/space_img/test.png">세부공간이미지</div>

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
                                    <td>xxxxxx</td>
                                </tr>

                                <tr>
                                    <th>공간면적:</th>
                                    <td>xxxxxx</td>
                                </tr>


                                <tr>
                                    <th>예약유형:</th>
                                    <td>xxxxx</td>
                                </tr>

                                <tr>
                                    <th>최소1명~N명:</th>
                                    <td>xxxxx</td>
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
                                <button type="submit" class="button">취소하기</button>
                            </form>
                            <button type="button" class="button" onclick="location.href=history.back();">목록으로</button>
                        </div>

                    </div>





                </div>

            </div>



    </body>

    </html>