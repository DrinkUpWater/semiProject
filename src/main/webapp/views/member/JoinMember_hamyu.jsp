<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

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
                height: 1100px;
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

            .userName {
                /* width: 100px; */
            }

            .user-id {
                font-weight: bold;
                font-size: 15px;
            }

            .user-id td {
                /* display: none; */
                font-size: 13px;
            }

            .cantid {
                color: red;
                display: none;
            }

            .useableid {
                color: #34B407;
                display: none;

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

            .input-id>input {
                width: 135%
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

            .userhost-area{
                margin-top: 20px;
                display: flex;         
                
            }

            .user-header {
                font-size: 20px;
                font-weight: bold;
                margin-top: 20px;
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
                border-radius: 8px;
                background: #704DE4;
                color: white;
                border: 0;
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

            .idCheck {
                float: right;
                margin-bottom: 20px;
                border: 0.5px solid;
                height: 35px;
            }
            .bb{

                padding-left: 5px;
                padding-top: 17px;

            }
            .host-label{

                display: flex;
                
            }
       
            .userhost-header{
                font-size: 20px;
                font-weight: bold;
                margin-top: 20px;
                height: 100%;
                width: 280px;
            }
        </style>
    </head>

    <body>
        <%@ include file="../common/menubar.jsp" %>
            <div id="wrapper">
                <div class="join-user">
                    <!-- insert.me -->
                    <form action="insert.me" id="login-form" method="post"> 
                        <h4 class="text-header">회원가입</h4>
                        <h7 class="text-header2">회원이 되어 다양한 혜택을 받으세요! </h7>

                        <table width="100%" class="tb" >
                            <!-- 이름 -->
                            <tr>
                                <th colspan="3">이름</th>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <input type="text" id="userName" name ="userName" placeholder=" 이름" style="width: 64%; ">
                                </td>
                            </tr>

                            
                            <!-- 아이디 -->
                            <tr class="user-id">
                                <th>아이디</th>
                                <td class="cantid" align="center">*사용할 수 없는 아이디입니다</td>
                                <td class="useableid" align="right">사용가능한 아이디입니다</td>
                            </tr>

                            <tr>
                                <td colspan="2" class="input-id">
                                    <!--  onblur="obrid()" -->
                                    <input type="text" name="userId" id="userId" minlength="6" maxlength="20"
                                        placeholder=" 아이디입력 6~20자" required>
                                </td>
                                <td>
                                    <button type="button" class="idCheck" onclick="idCheck()">중복 확인</button>
                                </td>
                            </tr>
                            <script>


                            </script>
                            <!-- 비밀번호 -->
                            <tr>
                                <th>비밀번호</th>
                                <td class="cantPwd" colspan="2">*사용할 수 없는 비밀번호입니다.</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="input-pwd">
                                    <input type="password" name="userPwd" id="userPwd" maxlength="20" onblur="onb()"
                                        placeholder=" 비밀번호 입력(문자,숫자,특수문자 포함 8~20자)" required>

                                </td>
                            </tr>


                            <!-- 비밀번호 확인 -->
                            <tr class="user-pwd-check">
                                <th>비밀번호 확인</th>
                                <td class="cantPwdCheck">*비밀번호가 일치하지 않습니다</td>
                                <td class="usealbePwd" align="right">사용가능한 비밀번호입니다</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="input-pwd-check">
                                    <input type="password" id="userPwdCheck" placeholder=" 비밀번호 입력(문자,숫자,특수문자 포함 8~20자)"
                                        onblur="onb()">
                                </td>
                            </tr>


                            <!-- 닉네임 -->
                            <tr class="user-nickname">
                                <th colspan="3">닉네임</th>
                            </tr>
                            <tr>
                                <td colspan="3" class="input-nickname">
                                    <input type="text" id="nickName" name="nickName"
                                        placeholder=" 특수문자 제외(',~,!,@,#,$,%,^...)최대 8글자">
                                </td>
                            </tr>

                            <!-- 성별 -->
                            <tr class="user-gender">
                                <th colspan="2">성별</th>
                                <td align="center" class="ck-gender">
                                    <label><input type="radio" name="gender" value="M"><b>남</b></label>
                                    <label><input type="radio" name="gender" value="F"><b>여</b></label>
                                </td>
                            </tr>

                            

                            <!-- 전화번호 -->
                            <tr>
                                <th colspan="3">전화번호</th>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <input type="text" id="phone" name="phone" placeholder=" 휴대폰 번호 입력(‘-’제외 11자리 입력)">
                                </td>
                            </tr>

                            <!-- 생년월일 -->
                            <tr>
                                <th colspan="3">생년월일</th>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <input type="text" id="birth" name="birth" placeholder=" 주민번호 앞자리(8글자)">
                                </td>
                            </tr>
                        </table>

                        <h4 class="email-header">이메일</h4>
                        <input type="text" id="email" name="email" class="u-email" placeholder="">
                        <b>@</b>
                        <select class="select-email" name="select-email">
                            <option value="">-선택-</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option alue="hotmail.com">hotmail.com</option>
                            <option value="korea.com">korea.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="yahoo.com">yahoo.com</option>
                        </select>
                        
                        <div class="userhost-area">
                            <h4 class="userhost-header">사용자 선택</h4>
                            <label class="host-label"><input type="radio" name="userHost" value="H"><b class="bb">호스트</b></label>
                            <label class="host-label"><input type="radio" name="userHost" value="G"><b class="bb">게스트</b></label>
                        </div>
                        <div class="btn-area">
                            <input type="submit" class="join-btn" value="가입하기" onclick="return joinUser();"></input>
                            <a href="#" onclick="history.back();" type="button" class="cancle">가입취소</a>
                        </div>

                    </form>

                </div>

                <script>

                    
            

                    function idCheck(){ //아이디 중복 확인 함수
                        let userId = document.getElementById("userId");
                        let cantid =document.querySelector(".cantid"); 
                        let useableid=document.querySelector(".useableid");
                       $.ajax({
                        type:"POST",
                        url : "idCheck.me",
                        data : {
                            checkId :userId.value
                        },
                        success :function(res){
                            
                            if(!isVailId(userId.value)){ //정규식조건에 부적절할 시
                                cantid.style.display="block";
                                useableid.style.display="none";
                                return;
                            }

                            if(res ==="NNNNY"){ //db확인 후 사용 가능할시
                              
                                    cantid.style.display="none";
                                    if(confirm("이 아이디를 사용하시겠습니까?")){ 
                                        useableid.style.display ="block";
                                    }else{ 
                                        useableid.style.display ="none";
                                        userId.focus(); //false클릭시 다시 아이디입력 창으로 이동
                                    }
            

                            }else{
                                cantid.style.display="block";
                                useableid.style.display="none";
                                userId.focus();
                            }
                        },
                        error:function(err){
                            alert("실패 에러 :" + err1);
                        }
                       })
                    }


                    function joinUser() { //빈칸 있을시 확인

      
                        let maleRadio = document.querySelector('input[name="gender"][value="남"]');
                        let femaleRadio = document.querySelector('input[name="gender"][value="여"]');
                        let cantid =document.querySelector(".cantid"); 
                        let userName = document.getElementById("userName");
                        let userId = document.getElementById("userId");
                        let userPwd = document.getElementById("userPwd");
                        let userPwdCheck = document.getElementById("userPwdCheck");
                        let nickName = document.getElementById("nickName");
                        let phone = document.getElementById("phone");
                        let birth = document.getElementById("birth");
                        let email = document.getElementById("email");
                        let select_email = document.querySelector(".select-email");


                        if (userName.value === "") {
                            alert("이름을 입력해주세요.");
                            userName.focus();
                            return false;
                        }

                        //아이디 조건 부분----------------------------------------------
                        else if (userId.value === "") {
                            alert("아이디를 입력해주세요.");
                            userId.focus();
                            return false;
                        }
                        else if(cantid.style.display !== "none"){
                            alert("사용할 수 없는 아이디입니다. 다시 입력해주세요.")
                            userId.focus();
                            return false;
                        }


                        //비밀번호 조건 부분-------------------------------------------
                        else if (userPwd.value === "") {
                            alert("비밀번호를 입력해주세요.");
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
                            userPwd.focus();
                            return false;
                        }
                        else if (!isValidPassword(userPwd.value)) {
                            alert("비밀번호 조건이 맞지않습니다.");
                            userPwd.focus();
                            return false;
                        }


                        else if (nickName.value === "") {
                            alert("닉네임을 입력해주세요.");
                            nickName.focus();
                            return false;
                        }
                        else if (!maleRadio.checked && !femaleRadio.checked) {
                            alert("성별을 선택해주세요");
                            return false;
                        }


                        // 전화번호 조건 부분-------------------------------------------
                        else if (phone.value === "") {
                            alert("전화번호를 입력해주세요.");
                            phone.focus();
                            return false;
                        }
                        else if (!isValidPhoneNumber(phone.value)) {
                            alert("전화번호는 -제외 및 11자리 숫자로만 입력해주세요.");
                            phone.focus();
                            return false;
                        }



                        // 생년월일 조건 부분-------------------------------------------
                        else if (birth.value === "") {
                            alert("생년월일을 입력해주세요.");
                            birth.focus();
                            return false;
                        }
                        else if (!isValidBirth(birth.value)) {
                            alert("숫자 및 8자 이내로 입력해주세요.");
                            birth.focus();
                            return false;
                        }


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
						
                        // else{ //모든 조건을 충족할 시
                        //     document.getElementById("login-form").submit();
                        //     return true;
                        // }

                    }



                    // 비밀번호 동일 여부 확인 + 유효가능 확인
                    function onb() {
                        let userPwd = document.getElementById("userPwd");
                        let userPwdCheck = document.getElementById("userPwdCheck");
                        let usealbePwd = document.querySelector(".usealbePwd");
                        let cantPwdCheck = document.querySelector(".cantPwdCheck");
                        let cantPwd = document.querySelector(".cantPwd");

                        // cantPwd.style.display = "block";

                        if (!isValidPassword(userPwd.value)) {
                            cantPwd.style.display = "block";
                            cantPwdCheck.style.display = "none";
                        }
                        else {
                            cantPwd.style.display = "none";
                        }


                        if ((userPwd.value !== userPwdCheck.value)) {
                            cantPwdCheck.style.display = "block";
                            usealbePwd.style.display = "none";
                        } else if (userPwd.value === userPwdCheck.value && (userPwd.value !== "" && userPwdCheck.value !== "" && cantPwd.style.display === "none")) {
                            usealbePwd.style.display = "block";
                            cantPwdCheck.style.display = "none";
                        }


                    }

                    //정규식 아이디조건 확인
                    function isVailId(userId){
                        if(!/^(?=.{6,20}$)[a-zA-Z0-9]+$/.test(userId)){
                            return false;
                        }
                        return true;
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

                    //정규식 생년월일조건 확인
                    function isValidBirth(birth) {
                        if (!/^\d{6}$/.test(birth)) {
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