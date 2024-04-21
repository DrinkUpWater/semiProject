//공간 정보 필요
//컨텐츠내용
//content

const urlStr = window.location.href;
const url = new URL(urlStr);

const urlParams =url.searchParams
const spaceNo= urlParams.get('spaceNo');
console.log(spaceNo);

$(function(){

    
    getReplyList(spaceNo,callbackData)
  

})
$(function(){
    insertGuestComment();
})

//콜백함수
function callbackData(result){
    const replyBody=document.querySelector("#space_qa_comment tbody")
    let list =[]
    for(let r of result){
        list.push({
            commentNo:r.commentNo,
            userId:r.userId,
            commentContent:r.commentContent,
            insertDate:r.insertDate,
            hostReply:r.hostReply,
            userNo:r.userNo
        })
    }
    drawTableList( list,replyBody)
    console.log("callback: "+list)
}



function getReplyList(spaceNo,callback){
   
     $.ajax({

        url:"select.gu",
        data:{spaceNum : spaceNo},
        success:function(result){
            console.log(result);
            callback(result);

        },
        error:function(result){
            console.log(result);

        }

    })



}

//댓글 목록 그리기
function drawTableList(commentList,parentTag){

    for(let reply of commentList){

        const replyRow=document.createElement('tr');
        replyRow.className="comment_list";

        const replyRow1=document.createElement('tr');
        replyRow1.className="comment_list";

        const replyRow2=document.createElement('tr');
        replyRow2.className="host_reply_title"

        const replyRow3=document.createElement('tr');
        replyRow3.className="host_reply"

        const replyRow4=document.createElement('tr');
         replyRow4.classList.add('comment_list','hostreply')

        const replyRow5=document.createElement('tr');
        replyRow5.className="comment_margin";





        replyRow.innerHTML=` <th class='nickName'>`+reply.userId+`</th>
                             <td class='mb-1'>`+reply.commentContent+`</td>
                           `

        replyRow1.innerHTML=`
                             <th class='clear'></th>
                             <td class='mb-1 time'>`+reply.insertDate+`</td> 
                            `
        replyRow2.innerHTML= `
                              <th class='clear'></th>
                              <td><button class='btn btn-link  p-0  host-reply-toggle' data-target='#hostReply' >`+호스트답글+`</button></td>
                             ` 
        replyRow3.innerHTML=`<th class='clear'> </th>
                             <td> <div  class='hostReplys' class='host-reply-content mt-2'>
                                    <p class='p_class'>`+reply.hostReply+`</p>
                                  </div>
                             </td> ` 
                             
        replyRow4.innerHTML=`
                             <th class='clear'></th>
                             <td>
                                <div class='hostReplyDiv' style='width:100%; display:none;  justify-content: space-between;'>
                                    <div style='width:100%;'>
                                        <textarea  class='hostReplyContents' placeholder='입력하세요' style='width:100%;' ></textarea>
                                    </div>
                                    <div>
                                        <button class='submitHostReplyBtn' type='button' >`+등록하기+`</button>
                                    </div>
                                    <div>
                                        <button class='submitHostReplyBtn' type='button' >`+삭제하기+`</button>
                                    </div>
                                </div>
                           </td>
                           `
                            

        replyRow5.innerHTML=`
                             <td colspan='2' id='comment_line'><hr></td>
                            `                           

     
       hostCheck
       let hostCheck=document.querySelector("#hostCheck").value;
      
       parentTag.appendChild(replyRow);
       parentTag.appendChild(replyRow1);
       parentTag.appendChild(replyRow2);
       parentTag.appendChild(replyRow3);

          //host답글
       //방의 주인만 QandA에 대한 답글을 달거나,삭제한다.
        if((hostCheck==='true')){

            parentTag.appendChild(replyRow4);
            const hostReply=document.querySelector(".hostreply textarea");
            const HostInsertButton=document.querySelector(".hostreply button");

            insertHostComment(HostInsertButton,hostReply,reply.commentNo);
            deleteHostComment(cancel,reply.commentNo)
        }

        //자기가 등록한 QA삭제
        let userNo=parseInt(document.querySelector("#userNo").value);
        if(userNo===reply.userNo){

            const cancelTd=document.createElement('td');
            const cancelButton=document.createElement('button')
            cancelButton.innerHTML='삭제'

           const guestButton= replyRow.append(cancelTd).appendChild(cancelButton);
            deleteGuestComment(guestButton,reply.commentNo)
        }


        parentTag.appendChild(replyRow5);
       
        
    }


}

function deleteHostComment(buttonTag,commentNo){

    buttonTag.onclick=function(){
        $.ajax({
            url:"delete.ho",
            data:{
                commentNo:commentNo,
            },
            success(result){
                alert(result);
            },
            error(result){
                alert(result);
            }
        })
        document.querySelector("#comment_body").innerHTML="";
        getReplyList(spaceNo,callbackData);
    }
   
}



function insertHostComment(hostButton,hostreply,commentNo){

  

   hostButton.onclick=function(){
        $.ajax({
            url:"insert.ho",
            method:"POST",
            data:{
                commentNo:commentNo,
                content:hostreply
            },
            success(result){
                alert(result)
            },
            error(result){
                alert(result)
            }
        })
        hostContent.value="";
        document.querySelector("#comment_body").innerHTML="";
        getReplyList(spaceNo,callbackData);
    }

}


function insertGuestComment(){
   const reviewButton= document.querySelector("#qa_enroll");
   const reviewContent=document.querySelector("#content");

   reviewButton.onclick=function(){
        $.ajax({
            url:"insert.gu",
            method:"POST",
            data:{
                spaceNum:spaceNo,
                content:reviewContent.value
            },
            success(result){
                alert(result)
            },
            error(result){
                alert(result)
            }
        })
        reviewContent.value="";
        document.querySelector("#comment_body").innerHTML="";
        getReplyList(spaceNo,callbackData);
    }
}

function deleteGuestComment( buttonTag,commentNo){

    buttonTag.onclick=function(){
        $.ajax({
            url:"delete.gu",
            data:{
                commentNo:commentNo,
            },
            success(result){
                alert(result);
            },
            error(result){
                alert(result);
            }
        })
        document.querySelector("#comment_body").innerHTML="";
        getReplyList(spaceNo,callbackData);
    }
}