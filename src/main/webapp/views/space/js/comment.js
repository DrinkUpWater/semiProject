document.addEventListener('DOMContentLoaded', function () {

  

    selectCommentList();//QandA 가져오고

    document.querySelector("#comment_enroll").onclick=function(){
        insertCommentList();//QandA작성
      
    }

   // HostCommentInsert();

    $(".host-reply-toggle").click(function(){
        let targetId = $(this).data("target");
        console.log(this)
        console.log(targetId)
        $(targetId).toggle();
    });

  
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
            +"<td> <div  class='hostReplys' id='hostReply' class='host-reply-content mt-2' style='display:block;'>"
                +"<p>"+reply['hostReply']+"</p>"
            +"</div></td>"
        +"</tr>"
    
    
        +"<tr id='reply_info' class='comment_list'>"
            +"<th class='clear'></th>"
            +"<td>"
                +"<div>답글</div>"
                +"<div id='reply div' style='width:100%; display:flex; justify-content: space-between;'>"
                    +"<div style='width:100%;'>"
                         + "<textarea id='hostReplyContent' class='hostReplyContents' placeholder='입력하세요' style='width:100%;'   ></textarea>"
                         + "<input  class='commentNo' type='text' value='"+reply['commentNo'] +"' hidden/>"
                    +"</div>"
                    +"<div><button class='submitHostReplyBtn' type='button' '>등록하기</button></div>"
                    
                +"</div>"
            +"</td>"
    
        +"</tr>"

    
        +"<tr id='comment_margin'>"
            +"<td colspan='2' id='comment_line'><hr></td>"
        +"</tr>"
     
       +"</tbody>"
    

    }
    commentTable.innerHTML=htmlContent
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

