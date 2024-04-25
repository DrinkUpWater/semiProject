<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
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
        
        .login-top {
            border: 1px solid;
            background: #704DE4;
            width: 400px;
            height: 65px;
            border-radius: 20px;
            margin: auto;
            margin-top: 100px;
          
            margin-bottom: 100px;    /*삭제 할수있음 */
        }
        .mypage-header{
            line-height: 65px;
            font-weight: bold;
            color: white;
            margin-bottom: 100px;
        }

        .user-profile{
            width: 300px;
            height: 350px;
            margin: 50px auto;
            background: #F2F6FF;
            border-radius: 50px;
            background: linear-gradient(rgb(54, 231, 54), rgb(106, 106, 231));
            padding: 30px;
        }
        .user-image-area{
            margin:  auto;
            width: 200px;
            height: 200px;
            border-radius: 100%;
            background-color: rgb(247, 229, 229);
        }
        
        h5{
            font-weight: bold;
            margin-top: -15px;
        }
        .user-image_edit-area{
           height: 40px;
           width: 150px;
           margin:auto;
           margin-top: -10px;  
        }
        .btn-upload{
            height: 40px;
            width: 150px;
            font-size: 16px;
            font-weight: 500;
            border: 0px;
            border-radius: 10px;
            background: #2d2058;
            color: white;
            cursor: pointer;
            line-height: 40px;
        }
        .btn-upload:hover{
            background: #9a94ad;
        }
        .btn-image{
            display: none;
        }
        .user-info-area{
            margin: auto;
            border: 1px solid;
            width: 700px;
            height: 500px;
            padding: 20px;
            background: #F2F6FF;
            border-radius: 20px;
        }

        table{
            width: 100%;
        }
        .tb-header > th{
            padding-bottom:20px;
        }
 
        th{
            text-align: center;
            font-size: 22px;
            width: 50%;
        }
       td{
            text-align: center;
            font-size: 20px;
            line-height: 60px;
            font-weight: 700
        }
        #edit-user{
            text-decoration: none;
            color: rgb(77, 100, 228);
        }
        #edit-user:hover{
            opacity: 0.7;
        }
        #bottom-area{
            height: 100px;
            width: 600px;
            display: flex;
            margin: auto;
            padding: 40px 100px;
            justify-content: space-between;
        }
        #Reservation_details{
            height: 42px;
            width: 150px;
            border: 1px solid;
            background: #704DE4;
            border-radius: 10px;
            text-align: center;
            line-height: 35px;
            color: white;
            text-decoration: none;
        }
        #Reservation_details:hover{
            opacity: 0.8;
        }
        #secession{
            border: 0;
            height: 40px;
            width: 150px;
            background: #f84242;
            border-radius: 10px;
            color: white;
            margin-bottom: 100px;
        }
        #secession:hover{
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <%
    	String userName =loginUser.getUserName();
    	String nickName = loginUser.getNickName();
    	String gender = loginUser.getGender();
    	
    	String phone = loginUser.getPhone();
    	StringBuffer ph = new StringBuffer(phone);
    	ph.insert(3,'-');
    	ph.insert(8,'-');
    	
    	String email = loginUser.getEmail();
    	
    	String birth = loginUser.getBirth();
    	Date date =new SimpleDateFormat("yyMMdd").parse(birth); //String타입인 991024를 날짜타입으로변경
    	String birthDate = new SimpleDateFormat("yyyy년 MM월 dd일").format(date); //변경된 날짜타입을 원하는 날짜로 출력하게 변경 ex)xxxx년xx월xx일
    	
    %>
    <div id="wrapper">
        <div class="login-top" align="center">
            <h2 class="mypage-header">마이페이지</h2>
        </div>
        
  <!-- 프로필 보여주는 영역 (임시로 잠깐 주석처리했음) -->
        <!-- <div class="user-profile">
            <div class="user-image-area">
                <img src="" alt="" id="user_profile">
            </div>
            <br>
            <div class="user-id-area">
                <h5 align="center">${loginUser.userId}</h5>
            </div>
            <br>
            <div class="user-image_edit-area" align="center">
                <label for="image-change">
                    <div class="btn-upload" onclick="changeImg()">프로필 사진 변경</div>
                </label>
                <input type="file" name="file" id="image-change" class="btn-image"  onchange="loadImg(this)">
            </div>
        </div> -->
        <!-- <script>
            $.ajax({
                url : "profile.me",
                data :
            })
        </script> -->
        <!-- 유저 프로필사진 등록-->
        <!-- <script>
            function changeImg(){
                const imgInput = document.querySelector("#image-change");
                imgInput.click();
            }
            function loadImg(ev){
                document.getElementById("user_profile").src=ev.target.result;
            }
        </script> -->

        <div class="user-info-area">
            <table>
                <tr class="tb-header" align="center">
                    <th>회원정보<hr></th>
                    <th>
                        <a href="editInfo.me" id="edit-user">회원정보수정<hr></a>
                    </th>
                </tr>
                <tr>
                    <td>이름</td>
                    <td class="vl"><%=userName %></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td class="vl"><%=nickName %></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td class="vl"><%=gender %></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td class="vl"><%=ph %></td>
                </tr>
                <tr>
                    <td>이메일주소</td>
                    <td class="vl"><%=email %></td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td class="vl"><%=birthDate %></td>
                </tr>
            </table>
        </div>

        <div id="bottom-area">
        	<form action ="reservation.me?cpage=1">
        		<input type="hidden" name="userId" value="${loginUser.userId }">
        		 <input type="hidden" name="cpage" value="1">
        		<input type="submit" value="예약내역" id="Reservation_details">
        	</form>
            <form action="secession.me" method="post">
                <input type="submit" value="탈퇴하기" id="secession"> 
            </form>
        </div>
    </div>
</body>
</html>