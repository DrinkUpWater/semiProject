<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

    
    #title{
        text-align: center;
    }

      @media (max-width: 619px){
        .pickedMain{grid-template-columns: 1fr;}
      }

      @media (min-width: 620px) and (max-width: 949px){
        .pickedMain{grid-template-columns: 1fr 1fr;}
      }

      @media (min-width: 950px){
        .pickedMain{grid-template-columns: 1fr 1fr 1fr;}
      }


    *{
        box-sizing: border-box;
     }


    #wrapper{
         width: 1200px;
         margin: 10px auto;    
         text-align: center;
    }

    .pickedMain{
        place-items: center;
        display: grid;
        column-gap: 16px;
        row-gap: 40px;
    }
   .info-preview {
            border: 1px solid black;
            width: 360px;
            height: 340px;
     }

</style>


<body>

    <%@ include file="../common/menubar.jsp" %>

     

     <div id="wrapper">
        <div id="title"><h1>찜한 공간</h1></div>

        <section class="pickedMain">
            <div class="info-preview" onclick="detailView()">
                <div class="space-picture" style="border:  1px solid black;"> 
                    <img src="" alt="썸네일" width="100%" height="100%">
                </div>
                <div class="space-info">
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
    </div>


    <script>
        function detailView() {
            location.href="detailview.sp?";
        }

    </script>
</body>
</html>