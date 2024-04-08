<!DOCTYPE html>
<html lang="ko">

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
     
        body {
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
            height: 850px;
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
            /* display: none; */
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
            /* display: none; */
        }

        .cantPwdCheck {
            font-size: 13px;
            color: red;
            font-weight: 600;
            /* display: none; */
        }

        .usealbePwd {
            font-size: 13px;
            color: #34B407;
            font-weight: 600;
            /* display: none; */
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

        .u-email{
            width: 47.75%;
            height: 45px;
            background: #EEEEEE;
            border-radius: 5px;
            border: 0;
        }
        .email-header{
            font-size: 20px;
            font-weight: bold;
        }
        .select-email{
            width: 47.75%;
            height: 45px;
            background: #EEEEEE;
            border-radius: 5px;
            border: 0;
        }
        .btn-area{
         
            display: flex;
            margin-top: 30px;
            height: 60px;
            justify-content: space-between;
            padding: 0px 50px;
            
        }
        .join-btn{
            width: 200px;
            font-size: 25px;
            border: 0;
            border-radius: 8px;
            background: #704DE4;
            color: white;
        }
        .cancle{
            color: white;
            background: #f84242;
            border-radius: 8px;
            width: 200px;
            text-align: center;
            line-height: 57px;
            font-size: 25px;
            
        }
        .cancle:hover{
            background-color: #a50000;
            text-decoration: none;
            color: white;
        }
        .join-btn:hover{
            background: #432c8d;
        }
        
        .input-pwd-check {
            padding-bottom: 50px;
        }
    </style>
</head>

<body>
    <%@ include file="..common/menubar.jsp" %>
        <div class="join-user">
            <form action="" id="login-form" method="post" >
              

                <table width="100%"  class="tb">
                    <tr class="user-id">
                        <th>현재 비밀번호</th>
        
                    </tr>
                    <tr>
                        <td colspan="3" class="input-id">
                            <input type="text" name="userId" minlength="6" maxlength="15" placeholder=" 비밀번호 입력(문자,숫자,특수문자 포함 8~20자)"
                                required>
                        </td>
                    </tr>

                    <!--변경할 비밀번호 -->
                    <tr>
                        <th>변경할 비밀번호</th>
                        <td class="cantPwd" colspan="2">*20자 이내의 비밀번호를 입력해주세요</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="input-pwd">
                            <input type="text" name="userPwd" maxlength="20" placeholder=" 비밀번호 입력(문자,숫자,특수문자 포함 8~20자)"
                                required>
            
                        </td>
                    </tr>


                    <!-- 비밀번호 확인 -->
                    <tr class="user-pwd-check">
                        <th>비밀번호 확인</th>
                        <td class="cantPwdCheck">*비밀번호가 일치하지 않습니다</td>
                        <td class="usealbePwd" align="right">비밀번호 동일합니다</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="input-pwd-check">
                            <input type="text" placeholder=" 비밀번호 재입력">
                        </td>
                    </tr>


                    <!-- 닉네임 -->
                    <tr class="user-nickname">
                        <th colspan="3">닉네임</th>
                    </tr>
                
                    <tr>
                        <td colspan="3" class="input-nickname">
                            <input type="text" placeholder=" 특수문자 제외(',~,!,@,#,$,%,^...)최대 8글자" value="대도">
                        </td>
                    </tr>


                      <!-- 전화번호 -->
                      <tr>
                        <th colspan="3">전화번호</th>
                    </tr>

                    <tr>
                        <td colspan="3">
                            <input type="text" placeholder=" 휴대폰 번호 입력(‘-’제외 11자리 입력)" value="010-1111-2222">
                        </td>
                    </tr>

                    <!-- 생년월일 -->
                    <tr>
                        <th colspan="3">생년월일</th>
                    </tr>

                    <tr>
                        <td colspan="3">
                            <input type="text" placeholder=" 주민번호 앞자리(8글자)" value="홍길동">
                            
                        </td>
                    </tr>
                </table>

                <h4 class="email-header">이메일</h4>
                    <input type="text" class="u-email" placeholder="" value="DAEDO"> 
                    <b>@</b> 
                    <select class="select-email">
                        <option value="">-선택-</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option alue="hotmail.com">hotmail.com</option>
                        <option value="korea.com">korea.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="yahoo.com">yahoo.com</option>
                        </select>
                <div class="btn-area">
                    <button type="submit" class="join-btn">정보 수정</button>
                    <a href="" type="button" class="cancle">돌아가기</a>
                </div>
            </form>

        </div>
</body>

</html>