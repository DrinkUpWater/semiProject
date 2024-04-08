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
            margin-bottom: 100px; 
        }
        .login-top {
            background: #704DE4;
            width: 400px;
            height: 65px;
            border-radius: 20px;
            margin: auto;
            margin-top: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
        }
        .login-top h2 {
            color: #FFFFFF;
            text-align: center
        }
        .top-area{
            border-bottom: 2px solid #704DE4;
            font-size: 30px;
            height: 45px;
            font-weight: bold;
            padding-left: 15px;
            
        }
        .detail-area td{
            
            height: 50px;
        }
        .detail-area th{
            height: 50px;
            padding-bottom: 0px;
        }
        .detail-area {
            width: 92%;
            margin: 0 auto;
            border-spacing: 0px;
        }
        .detail-area input {
            width: 100%;
            height: 60px;
            background-color: rgb(238, 238, 238);
            border: none;
            padding-left: 20px;
        }
        .detail-area th {
            font-size: 28px;
            display: flex;
            align-items: center;
            font-weight: bold;
            padding-left: 10px;
        }
        .detail-area td {
            color: #818181;
        }
        .space-btns{
            width: 100%;
            height: 55px;
            display: flex;
            justify-content: space-around;
        }  
        .space-btns button{ 
            width: 12%;
            border: none;
            color: #FFFFFF;
            background-color: #704DE4;
            border-radius: 20px;
            
        }
        .body80 {
            width: 90%;
            margin-right: 10px;
        }
        td>button{
            width: 110px;
            height: 85%;
            background-color: #704DE4;
            color: white;
            border-radius: 12px;
            border: none;
            margin-left: 10px;
        }
        .last-btns{
            display: flex;
            justify-content: space-around;
        }
        .last-btns button{
            width: 280px;
            height: 50px;
            border-radius: 15px;
            border: none;
            color: white;
            font-size: 26px; 
            
        }
        .back-btn{
            background-color: rgb(70, 70, 70);
        }
        .save-btn{
            background-color: rgb(230, 61, 61);
        }
        

    </style>
</head>
<body>
    <div id="wrapper">
        <div class="login-top">
            <h2>시설물 등록</h2>
        </div>
        
        <br>

        <div class="top-area"><p>공간 유형을 선택해주세요.</p></div>
        
        <br><br><br>

        <table class="detail-area">
            <tr>
                <th>공간명</th>
                <td align="right">0자/18자</td>
            </tr>
            <tr>
                <td colspan="2"><input type="text" placeholder="고유 업체명을 입력해주세요. ex)인디워커스 하이브 회의실"></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>공간유형</th>
                <td></td>
            </tr>
            <tr>
                <td  colspan="2">
                    <div class="space-btns">
                        <button>파티룸</button>
                        <button>카페</button>
                        <button>강의실</button>
                        <button>회의실</button>
                        <button>세미나실</button>
                        <button>스터디룸</button>
                    </div>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>공간 한 줄 소개</th>
                <td align="right">0자/27자</td>
            </tr>
            <tr>
                <td colspan="2"><input type="text" placeholder="공간의 특장점을 한 문자응로 작성해주세요."></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>공간 소개</th>
                <td align="right">20자/500자</td>
            </tr>
            <tr>
                <td colspan="2"><input type="text" placeholder="게스트들에게 필요한 공간 정보를 상세하게 소개해주세요. 툴팁은 클릭해 작성 가이드를 확인할 수 있습니다."></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>공간 태그</th>
                <td align="right">최대 5개</td>
            </tr>
            <tr>
                <td class="body80"><input type="text" placeholder="게스트들이 선호할만한 주요 특징들을 키워드로 입력해주세요. (최대 5개)"></td>
                <td><button>추가 ▼</button></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>시설 안내</th>
                <td align="right">최대 10개</td>
            </tr>
            <tr>
                <td class="body80"><input type="text" placeholder="이용 가능한 시설에 대해 최대한 상세하게 입력해주세요. (최대 10개)"></td>
                <td><button>추가 ▼</button></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th >예약 시 주의사항</th>
                <td align="right">최대 10개</td>
            </tr>
            <tr>
                <td class="body80"><input type="text" placeholder="게스트들이 예약 시 확인해야 하는 주의사항을 입력해주세요. (최대 10개)"></td>
                <td><button>추가 ▼</button></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>대표 이미지</th>
                <td align="right">2048*1158 권장, 최대 3MB</td>
            </tr>
            <tr>
                <td class="body80"><input type="text" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, png)"></td>
                <td><button>파일 첨부</button></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>이미지</th>
                <td align="right">2048*1158 권장, 최대 3MB(최대 10장)</td>
            </tr>
            <tr>
                <td class="body80"><input type="text" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, png)"></td>
                <td><button>파일 첨부</button></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>주소</th>
                <td align="right">최대 10개</td>
            </tr>
            <tr>
                <td ><input type="text" placeholder="실제 서비스되는 공간의 주소를 입력해주세요."></td>
                <td ><button>주소 검색</button></td>
            </tr>
            <tr>
                <td colspan="2" class="body80"><input type="text" placeholder="상세주소"></td>
                
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>가격(1인 1시간 가격)</th>
            </tr>
            <tr>
                <td colspan="2"><input type="text" placeholder="ex) 1000"></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <th>위치 정보</th>
                <td align="right">0자/20자</td>
            </tr>
            <tr>
                <td colspan="2"><input type="text" placeholder="ex) 동대문역사문화공원역 도보 1분 거리"></td>
            </tr>
        </table>
        <br><br>
        <div class="last-btns">
            <button class="back-btn">이&nbsp&nbsp&nbsp&nbsp전</button>
            <button class="save-btn" type="submit">저&nbsp&nbsp&nbsp&nbsp장</button>
        </div>

    </div>
</body>
</html>