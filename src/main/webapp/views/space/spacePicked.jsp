<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList" %>
<%@ page import="com.kh.space.model.vo.Space" %>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


 <% 
 		
     ArrayList<Space> pickeds= (ArrayList<Space>)request.getAttribute("pickeds");
     
 
 %>


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
        /* text-align: center;*/
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
            border-top: 1px solid black;
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

<%    
    

%>

<body>

    <%@ include file="../common/menubar.jsp" %>

     

     <div id="wrapper">
        <div id="title" ><h1>찜한 공간</h1></div>

        <section class="pickedMain">
            <% for(Space picked :pickeds){ %>
            <div class="info-preview" onclick="detailView(<%=picked.getSpaceNo()%>)" >
                <div class="space-picture" style="border:  1px solid black;"> 
                    <img src="<%=request.getContextPath()%>/<%=picked.getSpaceMimg()%>" alt="썸네일" width="100%" height="100%">
                </div>
                <div class="space-info">
                    <b>
                        <%=picked.getSpaceName() %>
                    </b>
                    <p>
                        <span><%=picked.getSpaceAddress() %><span><br>
                        
                       	<%  
                       		String []tags=picked.getSpaceTag().split(" ");
                       	
                        %>
                        
                         <% for(String tag:tags){ %>
                         		
                         	     <span><a href="#"><%=tag%></a><span> &nbsp;
                         		
                         <%} %>
                       
                       
                    </p>
                    <div class="price-info">
                        <div><b><%=picked.getSpacePrice()%></b><span>원/시간</span></div> <span>최대 <%=picked.getSpaceCapacity()%>인 </span>
                    </div>
                </div>
            </div>
            
             <script>
		        function detailView(spaceNo) {
		            location.href="detailview.sp?spaceNo="+spaceNo;
       		    }

             </script>
            <% } %>
          
        </section>
    </div>


   
</body>
</html>