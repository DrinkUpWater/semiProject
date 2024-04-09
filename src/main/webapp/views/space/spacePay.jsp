<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='./fullcalendar/main.css' rel='stylesheet' />
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


    <style>
        @media (max-width: 1200px) {

            #wrapper,
            #temp {
                width: 100%;
            }

            #section_1,
            #section_2 {
                width: auto;
            }
        }

        @media (max-width: 780px) {
            #wrapper {
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

        #wrapper {
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
            /* border: solid 1px gray;  */
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
            border: solid 1px #7A36E9;
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

        .qa_table {
            display: flex;
            justify-content: space-evenly;
            border-bottom: 1px solid grey;


        }

        .qa_table div {
            margin-bottom: 30px;
        }

        .qa_table span {
            border: 1px solid rgb(224, 216, 216);

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

        #detail_space{
            
            display: flex;
            justify-content: space-between;
        }

        #detail_space_choice {

            border: solid 1px #704DE4;
            padding: 15px;
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

        /*================================================================*/


        * {
            box-sizing: border-box;
        }

        ul {
            list-style-type: none;
        }

        body {
            font-family: Verdana, sans-serif;
        }

        .month {
            padding: 70px 25px;
            width: 100%;
            background: #1abc9c;
            text-align: center;
        }

        .month ul {
            margin: 0;
            padding: 0;
        }

        .month ul li {
            color: white;
            font-size: 20px;
            text-transform: uppercase;
            letter-spacing: 3px;
        }

        .month .prev {
            float: left;
            padding-top: 10px;
        }

        .month .next {
            float: right;
            padding-top: 10px;
        }

        .weekdays {
            margin: 0;
            padding: 10px 0;
            background-color: #ddd;
        }

        .weekdays li {
            display: inline-block;
            width: 13.6%;
            color: #666;
            text-align: center;
        }

        .days {
            padding: 10px 0;
            background: #eee;
            margin: 0;
        }

        .days li {
            list-style-type: none;
            display: inline-block;
            width: 13.6%;
            text-align: center;
            margin-bottom: 5px;
            font-size: 12px;
            color: #777;
        }

        .days li .active {
            padding: 5px;
            background: #1abc9c;
            color: white !important
        }

        /* Add media queries for smaller screens */
        @media screen and (max-width:720px) {

            .weekdays li,
            .days li {
                width: 13.1%;
            }
        }

        @media screen and (max-width: 420px) {

            .weekdays li,
            .days li {
                width: 12.5%;
            }

            .days li .active {
                padding: 2px;
            }
        }

        @media screen and (max-width: 290px) {

            .weekdays li,
            .days li {
                width: 12.2%;
            }
        }

    </style>



</head>


<body>
    
    <%@ include file="../common/menubar.jsp" %>

    <div id="wrapper">

        <div id="section_1">


            <div id="space_id" name="space_name" class="title">
                <div class="text">ìì½ê³µê°</div>
            </div>

            <div id="space_comment" class="space">
                <div align="left" class="img_div">
                    <img src="../../resources/space_img/test.png">
                </div>
                <div style=" padding-top:20px; ">
                    <span>
                       
                    </span>

                </div>
            </div>

         
            <div id="space_intro" name="space_intro" class="title">
                <div class="text">ê³µê°ìê°</div>
                <hr class="line2" style="background:rgb(235, 229, 229) ">
            </div>
            <div id="space_intro_comment" class="space">
                [ê°ë¨ì­ 10ë²ì¶êµ¬ 1ë¶ê±°ë¦¬]
                <br><br>
                ì´ë¤ ë§ë¨ë ëì¶©íì§ ìë ì¬ëë¤ì ìí ê°ì±ê³µê°,ê³µíëì¤ìëë¤.
                <br><br>
                #ì¤í°ëë£¸
                #íìì¤
                #ìì¼íí°
                #ë¸ë¼ì´ëì¤ì
                <br>
                ë± ë¤ìí ëª¨ìê³µê°ì¼ë¡ íì©í  ì ììµëë¤.


            </div>

            <div id="space_guide" name="intro" class="title">
                <div class="text">ìì¤ìë´</div>
                <hr class="line2" style="background:rgb(235, 229, 229) ">
            </div>

            <div id="space_guide_comment" class="space">
                <table>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>ì´ê³ ì ìì´íì´+ì ê¸°ì¢ ê°ë¥í ì¶©ì ê¸°</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>ì ìê¸°+ì°ë¸ê¸° í°+ ë³µì­ìí°+ì¬ê³¼í°+ìë©ë¦¬ì¹´ë¸+ê°ì</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>ì ìê¸°+ì°ë¸ê¸° í°+ ë³µì­ìí°+ì¬ê³¼í°+ìë©ë¦¬ì¹´ë¸+ê°ì</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>ì ìê¸°+ì°ë¸ê¸° í°+ ë³µì­ìí°+ì¬ê³¼í°+ìë©ë¦¬ì¹´ë¸+ê°ì</td>
                        </tr>

                        <tr>
                            <td>5</td>
                            <td>ì ìê¸°+ì°ë¸ê¸° í°+ ë³µì­ìí°+ì¬ê³¼í°+ìë©ë¦¬ì¹´ë¸+ê°ì</td>
                        </tr>

                        <tr>
                            <td>6</td>
                            <td>ì ìê¸°+ì°ë¸ê¸° í°+ ë³µì­ìí°+ì¬ê³¼í°+ìë©ë¦¬ì¹´ë¸+ê°ì</td>
                        </tr>

                    </tbody>

                </table>



            </div>


            <div id="reservation_warn" name="warn" class="title">
                <div class="text">ìì½ì ì£¼ìì¬í­</div>
                <hr class="line2" style="background:rgb(235, 229, 229) ">
            </div>
            <div id="reservation_warn_comment" class="space">
                <table>
                    <tbody>
                        <tr>
                            <td>1.</td>
                            <td>ìµì 1ì¸,ìµë 12ì¸ê¹ì§ ì´ì© ê°ë¥í©ëë¤.</td>
                        </tr>

                        <tr>
                            <td>2.</td>
                            <td>3ì¸ë¶í° ìµì 2ìê°ë¶í° ì´ì© ê°ë¥í©ëë¤.</td>
                        </tr>
                        <tr>
                            <td>3.</td>
                            <td>ìì½ì ì ìê¸ ì ë¡ ë§ ê°ë¥íë©°,ìì½ë ì¬ì©ìê° ì ì í´ì¤íì¬ë ìì¬ ìê°ì íë¶ì´ ë¶ê°í©ëë¤.</td>
                        </tr>
                        <tr>
                            <td>4.</td>
                            <td>ì¶ê°ì¸ìì ì°ë½ì£¼ìë©´ ìë´ ëìëë¦¬ê³  ìì¼ë©° ì¸ì ë³ë ê°ë¥ì± ììì ìµì ì¸ìì¼ë¡ ìì½í ì¸ì íì ì´
                                ëë©´ ì°ë½í, ê³ì¢ì´ì²´ë¡ ì¶ê°ê¸ì¡ ì§ë¶í´ì£¼ìë©´ ë©ëë¤.
                            </td>
                        </tr>

                        <tr>
                            <td>5.</td>
                            <td>ì§ëì¹ ììì ì¼ê°í´ì£¼ì¸ì</td>
                        </tr>

                        <tr>
                            <td>6.</td>
                            <td>ììë¬¼ ì·¨ìì ê°ë¥íë,êµ¬ë¹ë ììë¬¼ ì°ë ê¸° ë´í¬ì ë´ìí 1ì¸µ
                                íë¬¸ ì°ë ê¸°ì¥ì ì§ì  ë°°ì¶í´ì£¼ìì¼í©ëë¤.
                            </td>
                        </tr>

                    </tbody>

                </table>
            </div>


            <div id="space_road" class="title">
                <div class="text">ê¸¸ì°¾ê¸°</div>
                <hr class="line2" style="background:rgb(235, 229, 229) ">
            </div>
            <div id="space_road_comment" class="space">

                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.378379236162!2d127.03290899999996!3d37.49899300000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec255555555%3A0x3565475c3365c5bb!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1712133003105!5m2!1sko!2skr"
                    style="border:0; width:100%; height:200%;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>

            </div>

            <div id="space_qa" name="QanA" class="title">
                <div class="text">Q&A</div>
                <hr>
            </div>
            <div id="space_qa_comment" class="space">
                <div class="qa_table">

                    <div><img src="#">ì¬ì§1</div>
                    <div>
                        <div>ëë¤ì</div>
                        <div>ë´ì©ë´ì©ë´ì©asdfadsfasdf</div>
                        <div>í¸ì¤í¸ëµê¸</div>
                        <div>ìê°ìê°</div>

                    </div>

                </div>

                <div class="qa_table">

                    <div><img src="#">ì¬ì§2</div>
                    <div>
                        <div>ëë¤ì</div>
                        <div>ë´ì©ë´ì©ë´ì©asdfadsfasdf</div>
                        <div>í¸ì¤í¸ëµê¸</div>
                        <div>ìê°ìê°</div>

                    </div>
                </div>

                <div class="qa_table">

                    <div><img src="#">ì¬ì§3</div>
                    <div>
                        <div>ëë¤ì</div>
                        <div>ë´ì©ë´ì©ë´ì©asdfadsfasdf</div>
                        <div>í¸ì¤í¸ëµê¸</div>
                        <div>ìê°ìê°</div>

                    </div>

                </div>



            </div>

            <div id="space_review" name="space_review" class="title">
                <div class="text">ë¦¬ë·°</div>
                <hr>
            </div>
            <div id="space_review_comment" class="space">


                <div class="qa_table">

                    <div><img src="#">ì¬ì§1</div>
                    <div>
                        <div>ëë¤ì</div>
                        <div>ë¦¬ë·°ë¦¬ë·°ë¦¬ë·°</div>
                        <div>ìê°ìê°</div>

                    </div>

                </div>

                <div class="qa_table">

                    <div><img src="#">ì¬ì§2</div>
                    <div>
                        <div>ëë¤ì</div>
                        <div>ë¦¬ë·°ë¦¬ë·°ë¦¬ë·°</div>
                        <div>ìê°ìê°</div>

                    </div>
                </div>

                <div class="qa_table">

                    <div><img src="#">ì¬ì§3</div>
                    <div>
                        <div>ëë¤ì</div>
                        <div>ë¦¬ë·°ë¦¬ë·°ë¦¬ë·°</div>
                        <div>ìê°ìê°</div>

                    </div>

                </div>



            </div>

        </div>




        <div id="section_2">

           <div id="payMent_div">
                <table>
                    <tr>
                        <th>ìì½ë ì§</th>
                        <td>2024ë 04 05ì¼</td>
                    </tr>

                    <tr>
                        <th>ê¸ì¡</th>
                        <td>3000</td>
                    </tr>

                    <tr>
                        <th>ìì½ì¸ì</th>
                        <td>3ëª</td>
                    </tr>

                </table>
                <hr class="line2" style="background-color: #704DE4;">
                <div align="right">15000ì</div>

                <button  style="width:100%">ê²°ì íê¸°</button>

           </div>



         </div>

</body>

</html>