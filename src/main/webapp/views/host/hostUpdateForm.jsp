<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kh.common.Attachment" %>

<%
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function searchAddr(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            console.log(data);
	            $('#spaceAddress').val(data.address);
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }
	    }).open();
	}
	</script>
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
        td button{
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
        .hidden-spaceinfo, .hidden-spaceinfo-btn, .hidden-caution, .hidden-caution-btn {
            display: none;
        }
        .detail-area{
            position: relative;
        }
        .hidden-spaceinfo-btn, .hidden-caution-btn{
            position: absolute;
            right : 43px;
            
        }
        .hidden-spaceinfo-btn button, .hidden-caution-btn button{
            height: 50px;
        }
        .main-img-hidden, .detail-img-hidden{
            display: none;
        }
        .img-area img{
            margin-right: 2px;
            margin-bottom: 3px;
        }
        .img-area img:hover{
            cursor: pointer;
            scale: 0.98;
        }
        input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}

    </style>
</head>
<body>
    <%@ include file="../common/menubarHost.jsp"%>
    <div id="wrapper">
    	<br>
        <form action="update.sp" method="POST" enctype="multipart/form-data">
            <input style="display: none;" type="text" name="userNo" value="${loginUser.userNo}">
            <input style="display: none;" type="text" name="spaceNo" value="${sp.spaceNo}">
            <input style="display: none;" type="text" name="spaceMimg" value="${sp.spaceMimg}">
            <div class="login-top">
                <h2>시설물 수정</h2>
            </div>
            
            <br>

            <div class="top-area">
                <p>공간 정보를 입력해주세요.</p>
                <span style="color: red; font-size: 20px;">*필수입력</span>
            </div>
            
            
            <br><br><br>

            <table class="detail-area">
                <tr>
                    <th>공간명<span class=red-color>*</span></th>
                    <td colspan="2" align="right"><span class="textCount1">0</span>/18자</td>
                </tr>
                <tr>
                    <td colspan="3"><input id="input-name" class="input-text input-host1" name="spaceName" type="text" maxlength="18" value="${sp.spaceName }" placeholder="고유 업체명을 입력해주세요. ex)인디워커스 하이브 회의실" required></td>
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
                                <input type="checkbox" id="party" name="spaceKind" value="파티룸" >
                                <label for="party">&nbsp파티룸</label>
                            </div>
                            <div>
                                <input type="checkbox" id="cafe" name="spaceKind" value="카페">
                                <label for="cafe">&nbsp카페</label>
                            </div>
                            <div>
                                <input type="checkbox" id="lecture" name="spaceKind" value="강의실">
                                <label for="lecture">&nbsp강의실</label>
                            </div>
                            <div>
                                <input type="checkbox" id="meeting" name="spaceKind" value="회의실">
                                <label for="meeting">&nbsp회의실</label>
                            </div>
                            <div>
                                <input type="checkbox" id="seminar" name="spaceKind" value="세미나실">
                                <label for="seminar">&nbsp세미나실</label>
                            </div>
                            <div>
                                <input type="checkbox" id="study" name="spaceKind" value="스터디룸">
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
                    <td colspan="3"><input id="input-intro1" class="input-text input-host2" name="spaceOneIntroduce" type="text" maxlength="27" value="${sp.spaceOneIntroduce}" placeholder="공간의 특장점을 한 문자응로 작성해주세요." required></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>공간 소개<span class="red-color">*</span></th>
                    <td colspan="2" align="right"><span class="textCount3">0</span>/500자</td>
                </tr>
                <tr>
                    <td colspan="3"><input id="input-intro2" class="input-text input-host3" name="spaceIntroduce" type="text" maxlength="500" value="${sp.spaceIntroduce}" placeholder="게스트들에게 필요한 공간 정보를 상세하게 소개해주세요." required></td>
                </tr>
                <tr><td colspan="3"></td></tr>

                <!-- 공간 태그 -->
                <tr>
                    <th>공간 태그<span class="red-color">*</span></th>
                    <td colspan="2" align="right">최대 5개</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" id="spaceTag" type="text" placeholder="게스트들이 선호할만한 주요 특징들을 키워드로 입력해주세요. (최대 5개)"></td>
                    <td><button class="tag-btn" type="button" onclick="insertTag()">추가 ▼</button></td>
                </tr>
                <tr class="hidden-tag">
                    <td colspan="2" class="body80"> <input class="input-text" type="text" name="spaceTag" value="${sp.spaceTag}" readonly required></td>
                    <td><button type="button" onclick="deleteTag()">삭제</button></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>


                 <!--시설 안내  -->
                    <th>시설 안내<span class="red-color">*</span></th>
                    <td colspan="2" align="right">최대 10개</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" id="spaceInformation-input" type="text" placeholder="이용 가능한 시설에 대해 최대한 상세하게 입력해주세요. (최대 10개)" ></td>
                    <td><button class="spaceInfo-btn" type="button" onclick="insertSpaceInfo()">추가 ▼</button></td>
                </tr>
                <tr><td class="hidden-spaceinfo-btn"><button type="button" onclick="deleteSpaceInfo()">삭제</button></td></tr>
                <tr class="hidden-spaceinfo"> 
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>

                <!-- 예악 시 주의 사항 -->
                    <th >예약 시 주의사항<span class="red-color">*</span></th>
                    <td colspan="2" align="right">최대 10개</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" id="spaceCaution-input" type="text" placeholder="게스트들이 예약 시 확인해야 하는 주의사항을 입력해주세요. (최대 10개)" ></td>
                    <td><button class="caution-btn" type="button" onclick="insertCaution()">추가 ▼</button></td>
                </tr>
                <tr><td class="hidden-caution-btn"><button type="button" onclick="deleteCaution()">삭제</button></td></tr>
                <tr class="hidden-caution"> 
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>

                <!-- 대표 이미지 .. -->
                    <th>대표 이미지<span class="red-color">*</span></th>
                    <td colspan="2" align="right">2048*1158 권장, 최대 3MB</td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><img src="<%=contextPath%>${sp.spaceMimg} " id="title-img" width="25%" height="170"></td>
                    <td><button style="height: 50px;" type="button" onclick="chooseFile(1)">파일 수정</button></td>
                </tr>
                <tr><td colspan="3"></td></tr>

                <!-- 이미지 -->
                <tr>
                    <th>이미지<span class="red-color">*</span></th>
                    <td colspan="2" align="right">2048*1158 권장, 최대 3MB(최대 5장)</td>
                </tr>
                <tr>
                    <td colspan="3" class="img-area">
	                        <img id="content-img1" width="19%" height="160;" onclick="chooseFile(2)">
	                        <img id="content-img2" width="19%" height="160;" onclick="chooseFile(3)">
	                        <img id="content-img3" width="19%" height="160;" onclick="chooseFile(4)">
	                        <img id="content-img4" width="19%" height="160;" onclick="chooseFile(5)">
	                        <img id="content-img5" width="19%" height="160;" onclick="chooseFile(6)">
                    </td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>주소<span class="red-color">*</span></th>
                    <td colspan="2" align="right"></td>
                </tr>
                <tr>
                    <td colspan="2" ><input id="spaceAddress" class="input-text" type="text" name="spaceAddress" value="${sp.spaceAddress }" required readonly></td>
                    <td ><button type="button" onclick="searchAddr()">주소 검색</button></td>
                </tr>
                <tr>
                    <td colspan="2" class="body80"><input class="input-text" name="spaceDetailAddress" type="text" value="${sp.spaceDetailAddress }" placeholder="상세주소" required></td>
                    
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>가격(1인 1시간 가격)<span class="red-color">*</span></th>
                </tr>
                <tr>
                    <td colspan="3"><input id="input-price" class="input-text" name="spacePrice" type="number" value="${sp.spacePrice }" placeholder="숫자만 입력해주세요." required></td>
                </tr>
                <tr><td colspan="3"></td></tr>
                <tr>
                    <th>위치 정보</th>
                    <td colspan="2" align="right"><span class="textCount4">0</span>/20자</td>
                </tr>
                <tr>
                    <td colspan="3"><input id="input-shortinfo" class="input-text input-host4" name="spaceLocation" type="text" maxlength="20" value="${sp.spaceLocation }" placeholder="ex) 동대문역사문화공원역 도보 1분 거리"></td>
                </tr>
                <tr>
                    <th></th>
                </tr>
                <tr>
                    <th>전화번호<span class="red-color">*</span></th>
                    <td colspan="1" align="right"><th>수용 인원<span class="red-color">*</span></th></td>
                </tr>
                <tr>
                    <td colspan="2" ><input id="input-tel" style="padding-right: 50px;" class="input-text" type="text" name="spaceTel" value="${loginUser.phone}" placeholder="'-' 없이 입력해주세요." required></td>
                    <td  class="body80"><input class="input-text" name="spaceCapacity" type="number" value="${sp.spaceCapacity }" placeholder="최대 인원" required></td>
                </tr>
            </table>

            <div style="display: none;">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1)">
                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2)">
                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3)">
                <input type="file" name="file4" id="file4" onchange="loadImg(this, 4)">
                <input type="file" name="file5" id="file5" onchange="loadImg(this, 5)">
                <input type="file" name="file6" id="file6" onchange="loadImg(this, 6)">
            </div>

            <br><br>
            <div class="last-btns">
                <button class="back-btn" type="button" onclick="history.back()">취&nbsp&nbsp&nbsp&nbsp소</button>
                <button class="save-btn" type="submit">수&nbsp&nbsp&nbsp&nbsp정</button>
            </div>
        </form>
    </div>
    <script>
    	
    	$(function(){
    		<% for (int i = 0; i < list.size(); i++) { %>
    			$("#content-img" + <%=i+1%>).attr("src", "<%=request.getContextPath()%><%=list.get(i).getFilePath()%><%=list.get(i).getChangeName()%>");
	        <% } %>
    	})
    	
    
        function backPage() {
            location.href="enrollPre.ho";
        }

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
        
       	
        const spaceKind = "${sp.spaceKind}";
       	const inputArr = document.querySelectorAll("input[name=spaceKind]");
       	for (let input of inputArr) {
       		if (spaceKind.includes(input.value)){
       			input.checked = true;
       		}
       	}
       	const spaceTagg = "<c:out value='${sp.spaceTag}'/>"
       	let spaceTaggArr = spaceTagg.split('#');
       	if(spaceTaggArr.length >= 5){
       		$(".tag-btn").attr("disabled", true);
            $(".tag-btn").css("background-color", "gray");
       	}
       	
        // 공간태그 입력 및 삭제
        function insertTag() {
            const tag = document.querySelector("#spaceTag").value;
            if (tag != ""){
                $(".hidden-tag input").val($(".hidden-tag input").val()+'#'+tag+' ');
                document.querySelector("#spaceTag").value = "";
                $(".hidden-tag").css('display', 'table-row');
                let count = document.querySelector(".hidden-tag input").value.split('#').length - 1;
                if (count >= 5){
                    $(".tag-btn").attr("disabled", true);
                    $(".tag-btn").css("background-color", "gray");
                }
            } else {
                alert("공간 태그를 입력해주세요!");
                $('#spaceTag').focus();
            }
        }
        function deleteTag() {
            $(".hidden-tag input").val('');
            $(".tag-btn").attr("disabled", false);
            $(".tag-btn").css("background-color", "#704DE4");
        }
        
        const spaceInfo = "<c:out value='${sp.spaceInformation}'/>"
        let spaceInfoArr = spaceInfo.split('/');
        
        if(spaceInfoArr.length >= 10){
        	$(".spaceInfo-btn").attr("disabled", true);
            $(".spaceInfo-btn").css("background-color", "gray");
        }
        
        // 시설안내 입력 및 삭제
        let spaceInfoCheck = 1;
        for(let info of spaceInfoArr){
        	$(".hidden-spaceinfo").css('display', 'table-row');
            $(".hidden-spaceinfo-btn").css('display', 'table-row');
            let a = document.createElement('input');
            a.value = info;
            a.classList.add("input-text");
            a.name = "spaceInformation";
            a.readOnly = true;
            document.querySelector('.hidden-spaceinfo').appendChild(a);
            document.querySelector("#spaceInformation-input").value = "";
            spaceInfoCheck++;
        }
        function insertSpaceInfo() {
            const tag = document.querySelector("#spaceInformation-input").value;
            
            if (tag != ""){
                $(".hidden-spaceinfo").css('display', 'table-row');
                $(".hidden-spaceinfo-btn").css('display', 'table-row');
                let a = document.createElement('input');
                a.value = spaceInfoCheck + ". " + tag;
                a.classList.add("input-text");
                a.name = "spaceInformation";
                a.readOnly = true;
                document.querySelector('.hidden-spaceinfo').appendChild(a);
                document.querySelector("#spaceInformation-input").value = "";
                spaceInfoCheck++;
            } else {
                alert("시설 안내를 입력해주세요!");
                $('#spaceInformation-input').focus();
            }
            if (spaceInfoCheck == 11){
                $(".spaceInfo-btn").attr("disabled", true);
                $(".spaceInfo-btn").css("background-color", "gray");
            }
            
        }
        function deleteSpaceInfo() {
            $('.hidden-spaceinfo').children().remove();
            $(".hidden-spaceinfo-btn").css('display', 'none');
            $(".spaceInfo-btn").attr("disabled", false);
            $(".spaceInfo-btn").css("background-color", "#704DE4");
            spaceInfoCheck = 1;
        }
	
        const spaceCautions = "<c:out value='${sp.spaceCaution}'/>"
        let spaceCautionArr = spaceCautions.split('/');	
        
		if(spaceCautionArr.length >= 10){
			$(".caution-btn").attr("disabled", true);
            $(".caution-btn").css("background-color", "gray");
        }
        
        // 주의사항 입력 및 삭제
        let spaceCaution = 1;
        
        for(let caution of spaceCautionArr){
        	$(".hidden-caution").css('display', 'table-row');
            $(".hidden-caution-btn").css('display', 'table-row');
            let a = document.createElement('input');
            a.value = caution;
            a.classList.add("input-text");
            a.name = "spaceCaution";
            a.readOnly = true;
            document.querySelector('.hidden-caution').appendChild(a);
            document.querySelector("#spaceCaution-input").value = "";
            spaceCaution++;
        }
        
        function insertCaution() {
            const tag = document.querySelector("#spaceCaution-input").value;
            if (tag != ""){
                $(".hidden-caution").css('display', 'table-row');
                $(".hidden-caution-btn").css('display', 'table-row');
                let a = document.createElement('input');
                a.value = spaceCaution + ". " + tag;
                a.classList.add("input-text");
                a.name = "spaceCaution";
                a.readOnly = true;
                document.querySelector('.hidden-caution').appendChild(a);
                document.querySelector("#spaceCaution-input").value = "";
                spaceCaution++;
            } else {
                alert("예약 시 주의사항을 입력해주세요!");
                $('#spaceCaution-input').focus();
            }
            if (spaceCaution == 11){
                $(".caution-btn").attr("disabled", true);
                $(".caution-btn").css("background-color", "gray");
            }  
        }
        function deleteCaution() {
            $('.hidden-caution').children().remove();
            $(".hidden-caution-btn").css('display', 'none');
            $(".caution-btn").attr("disabled", false);
            $(".caution-btn").css("background-color", "#704DE4");
            spaceCaution = 1;
        }

        //이미지 관련 script
        function loadImg(inputFile, num){
            
            if (inputFile.files.length == 1) {
                const reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(ev) {
                    switch(num){
                        case 1: document.getElementById("title-img").src = ev.target.result; 
                                $('.main-img').css('display', 'none');
                                $('.main-img-hidden').css('display', 'table-row');
                                break;
                        case 2: document.querySelector("#content-img1").src = ev.target.result;
                                $('.detail-img').css('display', 'none');
                                $('.detail-img-hidden').css('display', 'table-row');
                                break;
                        case 3: $("#content-img2").attr("src", ev.target.result); break;
                        case 4: $("#content-img3").attr("src", ev.target.result); break;
                        case 5: $("#content-img4").attr("src", ev.target.result); break;
                        case 6: $("#content-img5").attr("src", ev.target.result); break;
                    }
                }
            } else {
                switch(num){
                    case 1: document.getElementById("title-img").src = null; break;
                    case 2: document.querySelector("#content-img1").src = null; break;
                    case 3: $("#content-img2").attr("src", null); break;
                    case 4: $("#content-img3").attr("src", null); break;
                    case 5: $("#content-img4").attr("src", null); break;
                    case 6: $("#content-img5").attr("src", null); break;
                }

            }
        }
        function chooseFile(num){
            const imgInput = document.querySelector("#file" + num);
            imgInput.click();
        }
        $('#spaceTag').keypress(function(event){
            if(event.which === 13){
                $('.tag-btn').click();
                $('#spaceTag').focus();
            }
        });
        $('#spaceInformation-input').keypress(function(event){
            if(event.which === 13){
                $('.spaceInfo-btn').click();
            }
        });
        $('#spaceCaution-input').keypress(function(event){
            if(event.which === 13){
                $('.caution-btn').click();
            }
        });
    </script>

</body>
</html>