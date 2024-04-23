<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=ZCOOL+KuaiLe&display=swap" rel="stylesheet">

        <style>
            #wrapper {
                width: 1200px;
                margin: auto;
            }

            tr>th {
                font-size: 20px;
            }

            table {
                margin-top: 20px;
            }

            .join-user {
                margin: auto;
                margin-top: 120px;
                width: 600px;
                height: 100%;
                /* height: 850px; */
                border: 1px solid;
                border-radius: 20px;
                background: #F2F6FF;
                padding: 30px;
                margin-bottom: 100px;
            }

            .text-header {
                font-weight: 600;
                font-size: 25px;
            }

            .text-header2 {
                font-size: 20px;
                color: #676262;
                font-weight: bold;
            }


            .user-id {
                font-weight: bold;
                font-size: 15px;
            }

            .user-id td {
                display: none;
                font-size: 13px;
            }

            .cantid {
                color: red;
            }

            .useableid {
                color: #34B407;
            }

            .cantPwd {
                font-size: 13px;
                color: red;
                font-weight: 600;
                display: none;
            }

            .cantPwdCheck {
                font-size: 13px;
                color: red;
                font-weight: 600;
                display: none;
            }

            .usealbePwd {
                font-size: 13px;
                color: #34B407;
                font-weight: 600;
                display: none;
            }

            td>input {
                width: 100%;
                height: 45px;
                background: #EEEEEE;
                border-radius: 5px;
                border: 0;
                margin-bottom: 15px;
            }

            [type="radio"]:checked {
                border: 0.4em solid rgb(109, 72, 212);
            }

            [type="radio"] {
                /* vertical-align: middle; */

                appearance: none;
                border: max(2px, 0.1em) solid gray;
                border-radius: 50%;
                width: 1.25em;
                height: 1.25em;
                transition: border 0.2s ease-in-out;
                margin-top: 20px;
                margin-left: 55px;
            }

            .ck-gender {
                padding-right: 20px;
            }

            [type="email"] {
                width: 100%;
            }

            .u-email {
                width: 47.75%;
                height: 45px;
                background: #EEEEEE;
                border-radius: 5px;
                border: 0;
            }

            .email-header {
                font-size: 20px;
                font-weight: bold;
            }

            .select-email {
                width: 47.75%;
                height: 45px;
                background: #EEEEEE;
                border-radius: 5px;
                border: 0;
            }

            .btn-area {

                display: flex;
                margin-top: 30px;
                height: 60px;
                justify-content: space-between;
                padding: 0px 50px;

            }

            .join-btn {
                width: 200px;
                font-size: 25px;
                border: 0;
                border-radius: 8px;
                background: #704DE4;
                color: white;
            }

            .cancle {
                color: white;
                background: #f84242;
                border-radius: 8px;
                width: 200px;
                text-align: center;
                line-height: 57px;
                font-size: 25px;

            }

            .cancle:hover {
                background-color: #a50000;
                text-decoration: none;
                color: white;
            }

            .join-btn:hover {
                background: #432c8d;
            }

            .input-pwd-check {
                padding-bottom: 30px;
            }
            .pwd-color{
                color: #c2c0c0;
            }
            #oldPwd-area{
                display: none;
                color: red;
            }
        </style>
    </head>

    <body>
        <%@ include file="../common/menubar.jsp" %>
		<%
			String nickName = loginUser.getNickName();
			String phone = loginUser.getPhone();
		  	StringBuffer ph = new StringBuffer(phone);
	    	ph.insert(3,'-');
	    	ph.insert(8,'-');
			
	    	String email = loginUser.getEmail();	
			int index = email.indexOf("@");
			String emailSelect = email.substring(index+1); //admin@kh.or.kr => kh.or.kr만추출
			email = email.substring(0,index); //admin@kh.or.kr => admin만 추출
			
			String birth = loginUser.getBirth();	
		%>
	<div id="wrapper">
                <div class="join-user">
                    <form action="update.me" id="login-form" method="post">

                        <input id="uesrId" type="hidden" name="userId" value="${loginUser.userId }"> 
                        <table width="100%" class="tb" border="1">
                            <tr>
                                <input type="button" value="비밀번호 변경" onclick="pwdUpdate()" style="margin-right: 10px;">
                                <input type="button" value="변경 취소" onclick="canclePwdUpdate()">
                            </tr>
                            <tr class="user-id">
                                <th class="pwd-color">현재 비밀번호</th>
                                <td colspan="2" id="oldPwd-area" align="right">
                                    *틀린 비밀번호입니다.
                                </td>
                           
                            </tr>
                            <tr>
                                <td colspan="3" class="input-id">
                                    <input type="password" name="oldPwd" id="oldPwd" minlength="6"
                                        maxlength="15" placeholder="" onblur="onbcrt()"
                                        required readonly>
                                </td>
                            </tr>

                            <!--변경할 비밀번호 -->
                            <tr>
                                <th class="pwd-color">변경할 비밀번호</th>
                                <td class="cantPwd" colspan="2" align="right">*사용할 수 없는 비밀번호입니다.</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="input-pwd">
                                    <input type="password" name="userPwd" id="userPwd" maxlength="20"
                                        placeholder="" onblur="onbcrt();onb();" required readonly>

                                </td>
                            </tr>


                            <!-- 비밀번호 확인 -->
                            <tr class="user-pwd-check">
                                <th class="pwd-color">비밀번호 확인</th>
                                <td class="cantPwdCheck" align="right">*비밀번호가 일치하지 않습니다</td>
                                <td class="usealbePwd" align="right">비밀번호 동일합니다</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="input-pwd-check">
                                    <input type="password" id="userPwdCheck" placeholder="" onblur="onb()" readonly>
                                </td>
                            </tr>
                      
                            <!-- 닉네임 -->
                            <tr class="user-nickname">
                                <th colspan="3">닉네임</th>
                            </tr>

                            <tr>
                                <td colspan="3" class="input-nickname">
                                    <input type="text" id="userNickName" name="nickName"
                                        placeholder=" 특수문자 제외(',~,!,@,#,$,%,^...)최대 8글자" value="<%=nickName%>">
                                </td>
                            </tr>


                            <!-- 전화번호 -->
                            <tr>
                                <th colspan="3">전화번호</th>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <input type="text" id="phone" name="phone" placeholder=" 휴대폰 번호 입력(‘-’제외 11자리 입력)" 
                                        value="<%=ph%>">
                                </td>
                            </tr>

                            <!-- 생년월일 -->
                            <tr>
                                <th colspan="3">생년월일</th>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <input type="text" id="birth" name="birth" placeholder=" 주민번호 앞자리(8글자)" value="<%=birth %>" readonly>

                                </td>
                            </tr>
                        </table>

                        <h4 class="email-header">이메일</h4>
                        <input type="text" class="u-email" placeholder="" id="email" name="email" value="<%=email%>">
                        <b>@</b>
                        <select class="select-email" name="select-email">
                            <option value="<%=emailSelect %>"><%=emailSelect %></option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option alue="hotmail.com">hotmail.com</option>
                            <option value="korea.com">korea.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="yahoo.com">yahoo.com</option>
                        </select>
                        <div class="btn-area">
                            <button type="submit" class="join-btn" onclick="return editUser()">정보 수정</button>
                            <a href="#" onclick="history.back();" type="button" class="cancle">돌아가기</a>
                        </div>
                    </form>

                </div>
                <script>

                    // let oldPwdArea = document.getElementById("oldPwd-area"); //현재 비밀번호 확인 영역(맞으면 HTMLinner띄움)

                    // let oldPwd = document.getElementById("oldPwd"); //현 비밀번호
                    // let userPwd = document.getElementById("userPwd");          //변경할 비밀번호
                    // let userPwdCheck = document.getElementById("userPwdCheck"); //변경된 비밀번호 확인
                    // let userNickName = document.getElementById("userNickName");
                    // let phone = document.getElementById("phone");
                    // let birth = document.getElementById("birth");
                    // let email = document.getElementById("email");
                    // let select_email = document.querySelector(".select-email");



                    function pwdUpdate(){//비밀번호 변경버튼 클릭시
                        let oldPwd = document.getElementById("oldPwd"); 
                        let userPwd = document.getElementById("userPwd");   
                        let userPwdCheck = document.getElementById("userPwdCheck");
                        document.querySelectorAll(".pwd-color").forEach(function(el){ //모든 pwd-color 폰트색 검정으로 변경
                            el.style.color="black"; 
                        })
                        oldPwd.removeAttribute("readonly");
                        oldPwd.placeholder=" 비밀번호 입력(문자,숫자,특수문자 포함 8~20자)";
                        userPwd.removeAttribute("readonly");
                        userPwd.placeholder=" 비밀번호 입력(문자,숫자,특수문자 포함 8~20자)";
                        
                        userPwdCheck.removeAttribute("readonly");
                        userPwdCheck.placeholder=" 비밀번호 재입력";
                    }

                    function canclePwdUpdate(){//비밀번호 변경 취소버튼 클릭시
                        let oldPwd = document.getElementById("oldPwd"); 
                        let userPwd = document.getElementById("userPwd");   
                        let userPwdCheck = document.getElementById("userPwdCheck");
                        document.querySelectorAll(".pwd-color").forEach(function(el){ //모든 pwd-color 폰트색 검정으로 변경
                        el.style.color="#c2c0c0"; 

                        oldPwd.setAttribute("readonly",true);
                        oldPwd.placeholder="";
                        userPwd.setAttribute("readonly",true);
                        userPwd.placeholder="";
                        
                        userPwdCheck.setAttribute("readonly",true);
                        userPwdCheck.placeholder="";
                     })
                    }


                    $(function(){ //전 비밀번호 확인
                        const pwdInput = document.getElementById("oldPwd");
                        let eventFlage;
                        pwdInput.onkeyup = function(ev){
                            clearTimeout(eventFlage);	
                            const str =ev.target.value;
                            if(str.trim().length>=3){
                                eventFlag = setTimeout(function(){
                                    $.ajax({
                                        url:"pwdCheck.me",
                                        date:{
                                            userId :document.getElementById("userId"),
                                            oldPwd : ev.target.value                                   
                                        },
                                        success:function(result){
                                            const checkResult =document.getElementById("oldPwd-area");
                                            checkResult.style.display="block";
                                            if(result==="NNNNN"){
                                                checkResult.style.color="red";
                                                checkResult.innerHTML="*틀린 비밀번호입니다."
                                            }else{
                                                checkResult.style.color="green";
                                                checkResult.innerHTML="확인되었습니다."
                                            }
                                        },
                                        error: function(){
                                            console.log("비밀번호 중복체크 실패!");
                                        }
                                    })
                                },500)
                            }else{
                                document.getElementById("oldPwd-area").style.display = "none";
                            }
                        }
                    })


                    function editUser() {//빈칸 있을시 확인


                        let oldPwd = document.getElementById("oldPwd"); //현 비밀번호
                        let userPwd = document.getElementById("userPwd");          //변경할 비밀번호
                        let userPwdCheck = document.getElementById("userPwdCheck"); //변경된 비밀번호 확인
                        let userNickName = document.getElementById("userNickName");
                        let phone = document.getElementById("phone");
                        let birth = document.getElementById("birth");
                        let email = document.getElementById("email");
                        let select_email = document.querySelector(".select-email");
                    if(userPwd.readonly){                       
                        //비밀번호 조건 부분-------------------------------------------
                        if (oldPwd.value === "") { //나중에 loginUser 조건 비교 추가 (oldPwd.value ===loginUser.getPwd())
                            alert("현재 비밀번호를 입력해주세요.");
                            oldPwd.focus();
                            return false;
                        }

                        else if (!isValidPassword(userPwd.value)) {
                            alert("비밀번호 조건이 맞지않습니다.");
                            userPwd.focus();
                            return false;
                        }

                        else if (userPwd.value === "") {
                            alert("변경할 비밀번호를 입력해주세요.");
                            userPwd.focus();
                            return false;
                        }
                        else if (userPwdCheck.value === "") {
                            alert("비밀번호 확인을 입력해주세요.");
                            userPwdCheck.focus();
                            return false;
                        }
                        else if (userPwd.value !== userPwdCheck.value) {
                            alert("비밀번호가 동일하지않습니다. 다시 입력해주세요.");
                            return false;
                        }

                    }
                        //닉네임 조건 부분-----------------------------------------------
                         if (userNickName.value === "") { //나중에 loginUser조건 비교 추가
                            alert("닉네임을 입력해주세요.");
                            userNickName.focus();
                            return false;
                        }


                        // 전화번호 조건 부분-------------------------------------------
                        else if (phone.value === "") {
                            alert("전화번호를 입력해주세요.");
                            phon.focus();
                            return false;
                        }
                        // else if (!isValidPhoneNumber(phone.value)) {
                        //     alert("전화번호는 -제외 및 11자리 숫자로만 입력해주세요.");
                        //     phone.focus();
                        //     return false;
                        // }

                        //이메일 조건 부분-------------------------------------------
                        else if (email.value === "") {
                            alert("이메일을 입력해주세요.");
                            email.focus();
                            return false;
                        }
                        else if (select_email.value === "" || !isVailidEmail(email.value)) {
                            alert("도메인 혹은 이메일을 잘못입력하였습니다. ")
                            email.focus();
                            return false;
                        }

                    }



                    function onbcrt() { //현 비번과 변경할 비번이 동일한지 확인
                        let oldPwd = document.getElementById("oldPwd");
                        let userPwd = document.getElementById("userPwd");       
                
                        let usealbePwd = document.querySelector(".usealbePwd");
                        let cantPwdCheck = document.querySelector(".cantPwdCheck");
                        let cantPwd = document.querySelector(".cantPwd");
                        cantPwd.style.color = "red";

                        if (oldPwd.value === userPwd.value) { //현재 비밀번호와 변경할 비밀번호가 같을 시
                            if ((oldPwd.value !== "" && userPwd.value !== "")) {   //각 비밀번호가 동일하면 th안에 있는 "*사용할 수 없는 비밀번호입니다." 대신             
                                cantPwd.innerHTML = "*중복된 비번입니다";             //"중복된 비번입니다"로 변경 (단, 둘다 빈칸이 아니여야함)
                                cantPwd.style.display = "block";
                                return;
                            }
                        }
                    }

                    // 비밀번호 동일 여부 확인 + 유효가능 확인
                    function onb() { //onblur함수사용
                        let oldPwd = document.getElementById("oldPwd");
                        let userPwd = document.getElementById("userPwd");    

                        let usealbePwd = document.querySelector(".usealbePwd");
                        let cantPwdCheck = document.querySelector(".cantPwdCheck");
                        let cantPwd = document.querySelector(".cantPwd");

                        //'변경할 비밀번호'가 정규식에 합당하지못하면 사용할 수 없는 비밀번호입니다.창 띄우기
                        if (!isValidPassword(userPwd.value)) {
                            cantPwd.style.display = "block";
                            cantPwd.innerHTML = "사용할 수 없는 비밀번호입니다.";
                            cantPwdCheck.style.display = "none";
                        }
                        else { //정규식에 합당한 '변경할 비번'이 '현재비밀번호'와 같으면 "중복된 비번입니다"를 보이게하기 (단, 둘다 빈칸이 아닐시에만)
                            if (oldPwd.value === userPwd.value && (oldPwd.value !== "" && userPwd.value !== "")) {
                                cantPwd.style.display = "block";
                            }
                            else { //그렇지 않으면 none
                                cantPwd.style.display = "none";
                            }
                        }


                        if ((userPwd.value !== userPwdCheck.value) && cantPwd.style.display === "none") { //'변경할 비밀번호'와 '비밀번호 확인'의 값이 다를시 
                            cantPwdCheck.style.display = "block";          //*비밀번호가 일치하지 않습니다 (보이기)
                            usealbePwd.style.display = "none";            // 비밀번호 동일합니다(가리기)
                        } else if (userPwd.value === userPwdCheck.value && (userPwd.value !== "" && userPwdCheck.value !== "" && cantPwd.style.display === "none")) {
                            usealbePwd.style.display = "block";
                            cantPwdCheck.style.display = "none";
                        }


                    }






                    //정규식 비밀번호조건 확인
                    function isValidPassword(password) {

                        if (password.length < 8 || password.length > 20) {// 비밀번호의 길이가 8자 이상 20자 이하
                            return false;
                        }

                        // 최소 한 개의 문자, 숫자, 특수문자가 포함
                        let hasLetter = /[a-zA-Z]/.test(password);
                        let hasNumber = /\d/.test(password);
                        let hasSpecialChar = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/.test(password);

                        if (!hasLetter || !hasNumber || !hasSpecialChar) {
                            return false;
                        }

                        return true;
                    }

                    //정규식 전화번호조건 확인
                    function isValidPhoneNumber(phoneNumber) {
                        // 휴대전화 번호는 숫자로만 이루어져
                        if (!/^\d{11}$/.test(phoneNumber) || phoneNumber.includes("-")) {
                            return false;
                        }

                        return true;
                    }

                    //정규식 이메일조건 확인 
                    function isVailidEmail(email) {
                        return /^[^\s!@#$%^&*()\-_=+[\]{};:'",.<>/?\\|`~]*$/i.test(email);
                    }
                </script>
            </div>

    </body>

    </html>