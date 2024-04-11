
function test(){
    let commentTable=document.querySelector("#comment_table")
    for(let i=0; i<2; i++){
        commentTable.innerHTML+=
        "<tr class='comment_list'>"
            +"<th class='nickName'>hihi</th>"
            + "<td class='mb-1' >user1</td>"
         +"</tr>"
    
         +"<tr class='comment_list'>"
                +"<th class='clear'></th>"
                +"<td class='time'>시간데이터</td>"
         +"</tr>"
    
         +"<tr class='host_replay_title'>"
            +"<th class='clear'> </th>"
            +"<td><button class='btn btn-link p-0 host-reply-toggle' data-target='#hostReply'>호스트답글</button></td>"
         +"</tr>"
    
         +"<tr class='host_replay'>"
             +"<th class='clear'> </th>"
             +"<td> <div id='#hostReply' class='host-reply-content mt-2' style='display:none;'>"
                +"<p>호스트 답글내용1</p>"
             +"</div></td>"
         +"</tr>"
    
    
         +"<tr id='reply_info' class='comment_list'>"
            +"<th class='clear'></th>"
            +"<td>"
                +"<div>답글</div>"
                  +"<div id='reply div' style='width:100%; display:flex; justify-content: space-between;'>"
                        +"<div 'style=width:100%;'>"
                            + "<textarea placeholder='입력하세요' style='width:100%'></textarea>"
                        +"</div>"
    
                        +"<div><button type='button'>등록하기</button></div>"
    
                    +"</div>"
            +"</td>"
    
          +"</tr>"
    
          +"<tr id='comment_margin'>"
             +"<td colspan='2' id='comment_line'><hr></td>"
          +"</tr>"
    
    
       
        }
    
}
//생명주기..
document.addEventListener('DOMContentLoaded', function () {

 //  selectCommentList();
 
 //test();
  console.log(1)
  // selectCommentList();
  

    selectCommentList();

    
    $(".host-reply-toggle").click(function(){
        let targetId = $(this).data("target");
        console.log(this)
        console.log(targetId)
        $(targetId).toggle();
    });





function insertCommentList(){





}





 function selectCommentList(){


        $.ajax({
    
            url:'comment.bo',
            type:'GET',
        
            data:{
                spaceNum:1
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


function commentList(commentTable,response){
   
    for(let reply of response){
        commentTable.innerHTML+=
        "<tr class='comment_list'>"
            +"<th class='nickName'>"+reply['userId']+"</th>"
            + "<td class='mb-1' >"+reply['content']+"</td>"
        +"</tr>"
    
        +"<tr class='comment_list'>"
                +"<th class='clear'></th>"
                +"<td class='time'>"+reply['time']+"</td>"
        +"</tr>"
    
        +"<tr class='host_reply_title'>"
            +"<th class='clear'> </th>"
            +"<td><button class='btn btn-link p-0  host-reply-toggle' data-target='#hostReply"+reply['replyNo']+"' >호스트답글</button></td>"
        +"</tr>"
    
        +"<tr class='host_reply'>"
            +"<th class='clear'> </th>"
            +"<td> <div  class='hostReplys' id='hostReply" + reply['replyNo'] + "' class='host-reply-content mt-2' style='display:block;'>"
                +"<p>"+reply['hostReply']+"</p>"
            +"</div></td>"
        +"</tr>"
    
    
        +"<tr id='reply_info' class='comment_list'>"
            +"<th class='clear'></th>"
            +"<td>"
                +"<div>답글</div>"
                +"<div id='reply div' style='width:100%; display:flex; justify-content: space-between;'>"
                    +"<div style='width:100%;'>"
                         + "<textarea id='hostReplyContent' placeholder='입력하세요' style='width:100%'></textarea>"
                    +"</div>"
                    +"<div><button type='button' onclick='submitHostReply()'>등록하기</button></div>"
                    
                +"</div>"
            +"</td>"
    
        +"</tr>"

    
        +"<tr id='comment_margin'>"
            +"<td colspan='2' id='comment_line'><hr></td>"
        +"</tr>"
    

    

    }


   // 등록하기 버튼에 이벤트 리스너 추가
    let submitHostReplyButtons = document.querySelectorAll('.submitHostReplyBtn');
    submitHostReplyButtons.forEach(button => {
        button.addEventListener('click', submitHostReply);
    });

    // submitHostReply 함수 정의
    function submitHostReply() {
        let replyNo = this.closest('tr').previousElementSibling.querySelector('.host-reply-toggle').dataset.target.split('hostReply')[1];
        let replyContent = this.closest('tr').querySelector('.hostReplyContent').value;
        let url = '/hostreply.re?replyNo=' + replyNo + '&replyContent=' + encodeURIComponent(replyContent);
        location.href = url;
    }

}

});

