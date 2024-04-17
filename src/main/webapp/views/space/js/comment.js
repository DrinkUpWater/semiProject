document.addEventListener('DOMContentLoaded', function () {

  

    selectCommentList();//QandA 가져오고

    document.querySelector("#comment_enroll").onclick=function(){
        insertCommentList();//QandA작성
    }

   // HostCommentInsert();

//    HostCommentInsert();
 
    
//    $(".host-reply-toggle").click(function(){
//        let targetId = $(this).data("target");
//        console.log(this)
//        console.log(targetId)
//        $(targetId).toggle();
//    });

  
});








function insertCommentList(){

    let sNo=document.querySelector("#spaceNum");  //게시판번호 리퀘스트에서 받아온다.
    let con=document.querySelector("#content");
     $.ajax({

            url:'coinsert.sp',
            type:'POST',
        
            data:{
                spaceNum:sNo.value,
                content:con.value
            },

            success:function(response){
            console.log(response);
            con.value=""
            document.querySelector("#comment_table").innerHTML=""//한번 밀어줘야된다.
            selectCommentList();
            
                
                
            },
            error:function(error){
                console.log("error"+error);

            }


        })
   
}





function selectCommentList(){
   let sNo=document.querySelector("#spaceNum");

    $.ajax({

        url:'colist.sp',
        type:'GET',
    
        data:{
            spaceNum:sNo.value
        },

        success:function(response){
        console.log(response);

        let commentTable=document.querySelector("#comment_table")
        commentList (commentTable,response) 
            
            
        },
        error:function(error){
            console.log("error"+error);

        }


    })

}


function commentList (commentTable,response){
    let htmlContent=''
    
    for(let reply of response){

        htmlContent+=
        "<tbody class='comment_body'>"

        +"<tr class='comment_list'>"
            +"<th class='nickName'>"+reply['userId']+"</th>"
            + "<td class='mb-1' >"+reply['commentContent']+"</td>"
            + "<td class='mb-1 cancel-td' style='width:100px;' ><button  class='cancel-button' style='width:100%;'>삭제</button></td>"
        +"</tr>"
    
        +"<tr class='comment_list'>"
                +"<th class='clear'></th>"
                +"<td class='time'>"+reply['insertDate']+"</td>"
              
        +"</tr>"
    
        +"<tr class='host_reply_title'>"
            +"<th class='clear'> </th>"
            +"<td><button class='btn btn-link  p-0  host-reply-toggle' data-target='#hostReply' >호스트답글</button></td>"
           
        +"</tr>"
    
        +"<tr class='host_reply'>"
            +"<th class='clear'> </th>"
            +"<td> <div  class='hostReplys'  class='host-reply-content mt-2' style='display:block;'>"
                +"<p class='p_class'>"+reply['hostReply']+"</p>"
            +"</div></td>"
         
        +"</tr>"
    
    
        +"<tr  class='comment_list'>"
            +"<th class='clear'></th>"
            +"<td>"
                +"<div>답글</div>"
                +"<div class='hostReplyDiv' style='width:100%; display:none;  justify-content: space-between;'>"
                    +"<div style='width:100%;'>"
                         + "<textarea  class='hostReplyContents' placeholder='입력하세요' style='width:100%;' ></textarea>"
                         + "<input  class='commentNo' type='text' value='"+reply['commentNo'] +"' hidden/>"
                    +"</div>"
                    +"<div><button class='submitHostReplyBtn' type='button' >등록하기</button></div>"
                +"</div>"
            +"</td>"
    
        +"</tr>"

    
        +"<tr id='comment_margin'>"
            +"<td colspan='2' id='comment_line'><hr></td>"
        +"</tr>"
     
       +"</tbody>"
    

    }

    commentTable.innerHTML=htmlContent


    //삭제 버튼 숨기기 로그인한 유저와,공간 호스트한테만 보이기
    GusetCommentCancelButton();

 
    
    
    
    //호스트 댓글창 숨기기
    $(".host-reply-toggle").click(function(){
        let targetId = $(this).data("target");
        console.log(this)
        console.log(targetId)
        $(targetId).toggle();
    });



    //호스트 답글내용 답글창 클릭하면 가져오기
    let textareas = document.querySelectorAll(".hostReplyContents");
    textareas.forEach(function(textarea) {
        textarea.onclick = function() {
            let replyText = this.closest("tr").previousElementSibling.querySelector(".hostReplys .p_class").innerText;
            console.log(replyText);
            this.value = replyText; // textarea의 값으로 설정
        };
    });
     
     //이 방의 주인만 답글달게 하기
    let checkHost=document.querySelectorAll(".hostReplyDiv");
    let hostCheck=document.querySelector("#hostCheck");
    console.log(hostCheck);
   // let hostCheckValue=null;
    
    if(hostCheck.value==='true'){
		checkHost.forEach(function(check){
			//check.style.display='block';
			 check.style.display='flex';
		});
	}
    
    
 
   
	
	
   
     //호스트 리플라이 작성
    HostCommentInsert();
    


}

function HostCommentInsert() {
    
    document.querySelectorAll(".comment_body .submitHostReplyBtn").forEach(
        button =>{
            button.addEventListener('click',sendDataToServer);
        }
    );

    function sendDataToServer(event){
      //  let sN=document.querySelector("#spaceNum").value;


        let tbody=event.target.parentNode.parentNode;
        console.log(tbody);
        let hR=tbody.querySelector('.hostReplyContents')
        console.log(hR);
        let coN=tbody.querySelector('.commentNo').value


        $.ajax({

            url:'hcoinsert.sp',
            type:'POST',
        
            data:{
               // spaceNum:sN,
                commentNo:coN,
                hostReply:hR.value
            },

            success:function(response){
            console.log(response);
            hR.value=""
            document.querySelector("#comment_table").innerHTML=""//한번 밀어줘야된다.
            selectCommentList();
            
                
                
            },
            error:function(error){
                console.log("error"+error);

            }


        })
   
    }
}


function GusetCommentCancelButton(){

    


}

