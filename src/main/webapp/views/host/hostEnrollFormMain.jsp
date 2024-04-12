<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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
            padding-right: 50px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
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
        .input-text {
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
            font-size: 15px;
        }
        .space-btns{
            width: 100%;
            height: 55px;
            display: flex;
            justify-content: space-around;
        }  
        .space-btns div{
            display: flex;
            align-items: center;
            font-size: 26px;
        }
        .space-btns div input{
            background-color: #704DE4;
        }
        /* .space-btns button{ 
            width: 12%;
            border: none;
            color: #FFFFFF;
            background-color: #704DE4;
            border-radius: 20px; 
        } */
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
        
        .red-color{
            color: red;
            font-size: 20px;
            font-weight: bold;
        }
        .space-btns input{
            height: 30px;
            width: 20px;
            padding: 0;
            margin: 0;
        }
        

    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp"%>
    <div id="wrapper">
    	<br>
        <form action="">
            <div class="login-top">
                <h2>시설물 등록</h2>
            </div>
            
            <br>

            <div class="top-area">
                <p>공간 유형을 선택해주세요.</p>
                <span style="color: red; font-size: 20px;">*필수입력</span>
            </div>
            
            
            <br><br><br>

            <table class="detail-area">
                <tr>
                    <th>공간명<span class=red-color>*</span></th>
                    <td colspan="2" align="right"><span class="textCount1">0</span>/18자</td>
                </tr>
                <tr>
                    <td colspan="3"><input class="input-text input-host1" type="text" maxlength="18" placeholder="고유 업체명을 입력해주세요. ex)인디워커스 하이브 회의실" required></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>공간유형<span class=red-color>*</span></th>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td  colspan="3">
                        <div class="space-btns">
                            <div>
                                <input type="checkbox" id="party" name="spaceType" value="party" >
                                <label for="party">&nbsp파티룸</label>
                            </div>
                            <div>
                                <input type="checkbox" id="cafe" name="spaceType" value="cafe">
                                <label for="cafe">&nbsp카페</label>
                            </div>
                            <div>
                                <input type="checkbox" id="lecture" name="spaceType" value="lecture">
                                <label for="lecture">&nbsp강의실</label>
                            </div>
                            <div>
                                <input type="checkbox" id="meeting" name="spaceType" value="meeting">
                                <label for="meeting">회의실</label>
                            </div>
                            <div>
                                <input type="checkbox" id="seminar" name="spaceType" value="seminar">
                                <label for="seminar">&nbsp세미나실</label>
                            </div>
                            <div>
                                <input type="checkbox" id="study" name="spaceType" value="study">
                                <label for="study">&nbsp스터디룸</label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>공간 한 줄 소개<span class="red-color">*</span></th>
                    <td colspan="2" align="right"><span class="textCount2">0</span>/27자</td>
                </tr>
                <tr>
                    <td colspan="3"><input class="input-text input-host2" type="text" maxlength="27" placeholder="공간의 특장점을 한 문자응로 작성해주세요." required></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>공간 소개<span class="red-color">*</span></th>
                    <td colspan="2" align="right"><span class="textCount3">0</span>/500자</td>
                </tr>
                <tr>
                    <td colspan="3"><input class="input-text input-host3" type="text" maxlength="500" placeholder="게스트들에게 필요한 공간 정보를 상세하게 소개해주세요. 툴팁은 클릭해 작성 가이드를 확인할 수 있습니다." required></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>공간 태그<span class="red-color">*</span></th>
                    <td colspan="2" align="right">최대 5개</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" type="text" placeholder="게스트들이 선호할만한 주요 특징들을 키워드로 입력해주세요. (최대 5개)" required></td>
                    <td><button>추가 ▼</button></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>시설 안내<span class="red-color">*</span></th>
                    <td colspan="2" align="right">최대 10개</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" type="text" placeholder="이용 가능한 시설에 대해 최대한 상세하게 입력해주세요. (최대 10개)" required></td>
                    <td><button>추가 ▼</button></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th >예약 시 주의사항<span class="red-color">*</span></th>
                    <td colspan="2" align="right">최대 10개</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" type="text" placeholder="게스트들이 예약 시 확인해야 하는 주의사항을 입력해주세요. (최대 10개)" required></td>
                    <td><button>추가 ▼</button></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>대표 이미지<span class="red-color">*</span></th>
                    <td colspan="2" align="right">2048*1158 권장, 최대 3MB</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" type="text" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, png)" required></td>
                    <td><button>파일 첨부</button></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>이미지<span class="red-color">*</span></th>
                    <td colspan="2" align="right">2048*1158 권장, 최대 3MB(최대 10장)</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" type="text" placeholder="이미지 파일을 추가해 주세요. (JPG, JPEG, png)" required></td>
                    <td><button>파일 첨부</button></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>주소<span class="red-color">*</span></th>
                    <td colspan="2" align="right"></td>
                </tr>
                <tr>
                    <td colspan="2" ><input class="input-text" type="text" placeholder="실제 서비스되는 공간의 주소를 입력해주세요." required></td>
                    <td ><button>주소 검색</button></td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" type="text" placeholder="상세주소" required></td>
                    
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>가격(1인 1시간 가격)<span class="red-color">*</span></th>
                </tr>
                <tr>
                    <td colspan="3"><input class="input-text" type="text" placeholder="ex) 1000" required></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>위치 정보</th>
                    <td colspan="2" align="right"><span class="textCount4">0</span>/20자</td>
                </tr>
                <tr>
                    <td colspan="3"><input class="input-text input-host4" type="text" maxlength="20" placeholder="ex) 동대문역사문화공원역 도보 1분 거리"></td>
                </tr>
            </table>
            <br><br>
            <div class="last-btns">
                <button class="back-btn">이&nbsp&nbsp&nbsp&nbsp전</button>
                <button class="save-btn" type="submit">저&nbsp&nbsp&nbsp&nbsp장</button>
            </div>
        </form>
    </div>
    
    <script>
        $(".input-host1").keyup(function(e) {
            content = $(this).val();
            $(".textCount1").text(content.length); 
        });
        $(".input-host2").keyup(function(e) {
            content = $(this).val();
            $(".textCount2").text(content.length); 
        });
        $(".input-host3").keyup(function(e) {
            content = $(this).val();
            $(".textCount3").text(content.length); 
        });
        $(".input-host4").keyup(function(e) {
            content = $(this).val();
            $(".textCount4").text(content.length); 
        });
        
       	
        const spaceType = "${spaceType}";
       	const inputArr = document.querySelectorAll("input[name=spaceType]");
       	for (let input of inputArr) {
       		if (spaceType.includes(input.value)){
       			input.checked = true;
       		}
       	}
        

    </script>

</body>
</html>