<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            border-radius: 20px;
            border-color: #704DE4;
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
            border: 2px solid #704DE4;
            width: 30%;
            height: 36px;
            border-radius: 20px;
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
            border: 1px solid black;
            width: 360px;
            height: 340px;
        }
        .space-picture{
            height: 200px;
            margin-bottom: 0px;
        }
        .space-info{
            padding: 0 5px
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
        
        /* 달력 css */
        
        * {box-sizing: border-box;}
        ul {list-style-type: none;}
        body {font-family: Verdana, sans-serif;}

        .month {
        padding: 30px 25px;
        width: 100%;
        background: #704DE4;
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
        padding: 10px;
        background-color: #ddd;
        }

        .weekdays li {
        display: inline-block;
        width: 12%;
        color: #666;
        text-align: center;
        }

        .days {
        padding: 10px ;
    
        background: #eee;
        margin: 0;
        }

        .days li {
        list-style-type: none;
        display: inline-block;
        width: 12%;
        text-align: center;
        margin-bottom: 5px;
        font-size:12px;
        color: #777;
        }

        .days li .active {
        padding: 5px;
        background: #704DE4;
        color: white !important
        }

    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div id="wrapper">
        <div class="search-bar" align="center">
            <input type="search" name="search">
            <i class="fa-solid fa-magnifying-glass">d</i>
        </div>

        <div class="search-option">
            <section class="option1">
                <select name="" id="">
                    <option value="">지역</option>
                    <option value="">서울</option>
                    <option value="">경기</option>
                </select>
                <select name="" id="calender-select">
                    <option value="">인원</option>
                    <option value="">1명</option>
                    <option value="">2명</option>
                    <option value="">3명</option>
                    <option value="">4명</option>
                    <option value="">5명</option>
                    <option value="">6명</option>
                    <option value="">7명</option>
                    <option value="">8명</option>
                    <option value="">9명</option>
                    <option value="">10명 이상</option>
                </select>
                <input type="date" value="날짜">
            </section>
            <div class="option2">
                <div>필터</div>
                <div>지도</div>
            </div>
        </div>
        <div class="option3">
            <div>
                <a href="">전체</a> | 
                <a href="">시간단위</a> |
                <a href="">패키지단위</a> |
                <a href="">월단위</a>
            </div>
            <div>
                <select name="" id="">
                    <option value="">최신 순</option>
                    <option value="">베스트 공간 순</option>
                    <option value="">가격 낮은 순</option>
                    <option value="">가격 높은 순</option>
                </select>
            </div>
        </div>

        <section class="main-grid">
            <div class="info-preview">
                <div class="space-picture" style="border:  1px solid black;"> 
                    <img src="" alt="썸네일" width="100%" height="100%">
                </div>
                <div class="space-info">
                    <br>
                    <b>
                        [오픈이벤트] 르씨엘 2호점
                    </b>
                    <p>
                        <span>봉천동 | #서울대입구 #스터디룸 #파티룸 #독서모임 #온라인콘서트 </span>
                    </p>
                    <div class="price-info">
                        <div><b>1,000</b> <span>원/시간</span></div> <span>최대 12인 ○7 ♡18</span>
                    </div>
                </div>
            </div>
            <div class="info-preview"></div>
            <div class="info-preview"></div>
            <div class="info-preview"></div>
            <div class="info-preview"></div>
            <div class="info-preview"></div>
            <div class="info-preview"></div>
            <div class="info-preview"></div>
            <div class="info-preview"></div>
        </section>

        <!-- 달력
        <div class="calender">
            <div class="month">      
                <ul>
                    <li class="prev">&#10094;</li>
                    <li class="next">&#10095;</li>
                    <li>
                    4월<br>
                    <span style="font-size:18px">2024</span>
                    </li>
                </ul>
            </div>

            <ul class="weekdays">
            <li>Mo</li>
            <li>Tu</li>
            <li>We</li>
            <li>Th</li>
            <li>Fr</li>
            <li>Sa</li>
            <li>Su</li>
            </ul>

            <ul class="days">  
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
                <li>6</li>
                <li>7</li>
                <li>8</li>
                <li>9</li>
                <li><span class="active">10</span></li>
                <li>11</li>
                <li>12</li>
                <li>13</li>
                <li>14</li>
                <li>15</li>
                <li>16</li>
                <li>17</li>
                <li>18</li>
                <li>19</li>
                <li>20</li>
                <li>21</li>
                <li>22</li>
                <li>23</li>
                <li>24</li>
                <li>25</li>
                <li>26</li>
                <li>27</li>
                <li>28</li>
                <li>29</li>
                <li>30</li>
                <li>31</li>
            </ul>
        </div> -->
    </div>
</body>
</html>