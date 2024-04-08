<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
    <title>Document</title>
    <style>
        body {
            width: 1200px;
            margin:auto;
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
    </style>
</head>
<body>
    <%@ include file="..common/menubar.jsp" %>
    <div class="reservation-header">
        예약 내역
    </div>

    <div class="reservation-body">
        <div class="total-rsvt-area">
            <p>총 예약권 : n건</p>
        </div>
 
        <hr>
        <table class="table table-striped" border="1">
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

                <tr class="reservation-list" onclick="detailview()">
                    <td>1</td>
                    <td>
                        <button type="button" class="btn-rserv" data-toggle="modal" data-target="#myModal" >
                            뿌링뿌링뿌링클감작마자
                        </button>
                        
                        <!-- The Modal -->
                        <div class="modal" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
            
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title" >예약내용</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
            
                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="table-area" >
                                        <table  class="modal-tb-css">
                                            <tr>
                                                <td class="trtd">예약 신청일</td>
                                                <td align="center" style="color: red;">2017.06.05(월)</td>
                                            
                                            </tr>
                                            <tr>
                                                <td class="trtd">예약공간</td>
                                                <td align="center">스페이스클라우드 작업실도서관</td>
                                            </tr>
                                            <tr>
                                                <td class="trtd">예약내용</td>
                                                <td align="center">2017.06.20 - 2017.06.21</td>
                                            </tr>
                                            <tr>
                                                <td class="trtd">예약인원</td>
                                                <td align="center">5명</td>
                                            </tr>
                                            <tr>
                                                <td class="trtd">요청사항</td>
                                                <td>
                                                    세월의 야속함세월의 야속함을 느껴요 숲에 온 느낌의<br>
                                                </td>
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
                    <td>user01</td>
                    <td>15</td>
                    <td>100000</td>
                    <td>2023-09-22s</td>
                </tr>


                <tr>
                    <td>1</td>
                    <td>첫 번째 예약공간</td>
                    <td>user01ddddddddddddddddd</td>
                    <td>15ddddddddddd</td>
                    <td>110050</td>
                    <td>2023-09-22s</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>첫 번째 예약공간</td>
                    <td>user01</td>
                    <td>user01</td>
                    <td>15100000</td>
                    <td>2023-09-22s</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>첫 번째 예약공간</td>
                    <td>user01</td>
                    <td>15</td>
                    <td>11000005</td>
                    <td>2023-09-22s</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>첫 번째예약공간</td>
                    <td>user01</td>
                    <td>15</td>
                    <td>210005</td>
                    <td>2023-09-22s</td>
                </tr>
            </tbody>

        </table>
        <br><br>
        <hr>
<!-- 
        <div class="modal-body">
            <div class="table-area" >
            <table class="modal-tb-css">
                <tr>
                    <td>예약 신청일</td>
                    <td>2017.06.05(월)</td>
                
                </tr>
                <tr>
                    <td>예약공간</td>
                    <td>스페이스클라우드 작업실도서관</td>
                    <td></td>
                </tr>
                <tr>
                    <td>예약내용</td>
                    <td>2017</td>
                </tr>
                <tr>
                    <td>예약인원</td>
                    <td>5명</td>
                </tr>
                <tr>
                    <td>요청사항</td>
                    <td>세월의 야속함을 느껴요 숲에 온 느낌의<br> 흙냄새기모띠양꼬치
                       함을 느껴요 숲에 온 느낌의<br> 흙냄새기모띠양꼬치</td>
                </tr>
                <tr>
                    <div class="img-area">
                        <img src="" alt="">
                    </div>
                </tr>
            </table>
            </div>
        
        </div> -->

 
    
</body>
</html>