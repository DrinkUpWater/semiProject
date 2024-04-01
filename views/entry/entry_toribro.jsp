<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
	.menu_list{
		list-style: none;
		display: flex;
		justify-content: space-between;
	}
	.menu_list>li{
		margin: 10px;
	}

	main{
		width:1000px;
		height:600px;
		margin:auto;
		border: solid black;
		display:flex;
		justify-content: center;

	}
	.blank{
		margin:10px;
	}
	section{
		border: solid gray;
		width:100%;
		height:100%;
		text-align: center;
	}

	.reservation{
		height:100%;
		border: solid green;
		align-items: center;
	
	
		
	}
	._img{
		 margin-top:150px; 
		height:50%;
		text-align: center;
		border :solid red;
		align-items: center;
	}

</style>

</head>
 

 

<body>
   <%@ include file="../common/menubar.jsp" %>
  

	<main class="blank">
		<section id="section_1" >
            
			<div id="private" class="reservation">
				
				<div class="_img">개인석 예약</div>
			

			</div>

		</section>

		<section id="section_2" >

			<div id="group" class="reservation">

				<div class="_img">단체석 예약</div>
			</div>

		</section>




	</main>

</body>
</html>