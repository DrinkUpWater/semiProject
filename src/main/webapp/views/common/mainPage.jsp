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
        
    

    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div id="wrapper">
        <div class="search-bar" align="center">
            <input type="search" name="search">
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>
        <form action="mainP.sp" method="get">
            <div class="search-option">  
                <section class="option1">
                    <select class="place-Info" onchange="clickFilterBtn()">
                        <option value="">지역</option>
                        <option value="서울" name="pInfo">서울</option>
                        <option value="경기" name="pInfo">경기</option>
                    </select>
                    <input type="text" name="pInfo" style="display: none;">
                    <select class="people-count" onchange="clickFilterBtn()">
                        <option value="" >인원</option>
                        <option value="1" name="pCount">1명</option>                        <option value="2" name="pCount">2명</option>
                        <option value="3" name="pCount">3명</option>
                        <option value="4" name="pCount">4명</option>
                        <option value="5" name="pCount">5명</option>
                        <option value="6" name="pCount">6명</option>
                        <option value="7" name="pCount">7명</option>
                        <option value="8" name="pCount">8명</option>
                        <option value="9" name="pCount">9명</option>
                        <option value="10" name="pCount">10명 이상</option>
                    </select>
                    <input type="text" name="pCount" style="display: none;">
                    <input type="date" value="날짜">
                </section>
                <div class="option2">
                    <div>필터</div>
                    <div>지도</div>
                </div>
                
            </div>
            <button id="filter-btn" type="submit" style="display: none;"></button>
        </form>
        <br>
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
        <br>
        <section class="main-grid">
           

            <c:forEach var="sp" items="${list}">
                <div class="info-preview" onclick="detailView('${sp.spaceNo}')">
                    <div class="space-picture"> 
                        <img src="<%=contextPath%>${sp.spaceMimg}" alt="썸네일" width="100%" height="100%">
                    </div>
                    <div class="space-info">
                        <div style="margin-bottom: 5px;">
                            <b>
                                ${sp.spaceName}
                            </b>
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

    </div>
    <script>
   		function detailView(spaceNo) {
       		location.href="detailview.sp?spaceNo="+spaceNo;
	    }

        
        const pCountArr = document.querySelector('.people-count').children;
        pCountArr["${pCount}"].selected = true;
        document.querySelector('option[value="${pInfo}"]').selected = true;
        <c:remove var="pInfo"/>
        <c:remove var="pCount"/>

        function clickFilterBtn(){
            let pInfo = document.querySelector(".place-Info").value;
            $('input[name=pInfo]').val(pInfo);
            let pCount = document.querySelector(".people-count").value;
            $('input[name=pCount]').val(pCount);
            document.querySelector('#filter-btn').click();
        }   
    </script>
    
</body>
</html>