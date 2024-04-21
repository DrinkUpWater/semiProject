//공간 정보 필요
//컨텐츠내용
//content

const urlStr = window.location.href;
const url = new URL(urlStr);

const urlParams =url.searchParams
const spaceNo= urlParams.get('spaceNo');
console.log(spaceNo);

$(function(){

    
    getReplyList(spaceNo,function(result){

        const replyBody=document.querySelector("#space_review tbody")
        let list =[]
        for(let r of result){
            list.push({
                review_no:r.reviewNo,
                reviewContent:r.content,
                reviewInsertDate:r.insertDate,
                reviewUserName:r.userName,
                reviewUserNo:r.userNo
            })
        }
        drawTableList( list,replyBody)
        console.log(list)
   })

})

function getReplyList(spaceNo,callback){
   
     $.ajax({

        url:"review.sp",
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
function drawTableList(reviewList,parentTag){

    for(let reply of reviewList){
        const replyRow=document.createElement('tr');
        const replyRow1=document.createElement('tr');
        const replyRow2=document.createElement('tr');

        replyRow.innerHTML=` <th class='nickName'>`+reply.reviewUserName+`</th>
                             <td class='mb-1'>`+reply.reviewContent+`</td>
                          
                             `
        replyRow1.innerHTML=`
                             <th class='clear'></th>
                             <td class='mb-1 time'>`+reply.reviewInsertDate+`</td> 
                             ` 
        replyRow2.innerHTML=`
                             <td colspan='2' id='comment_line'><hr></td>
                            `                           

        parentTag.appendChild(replyRow);
        parentTag.appendChild(replyRow1);
        parentTag.appendChild(replyRow2);

        replyRow.className='comment_list';
        replyRow1.className='comment_list';
        replyRow2.className='comment_list';
      //  submitHostReplyBtn
      
       //리뷰를 쓴 등록되어있는 유저

       let userNo=parseInt(document.querySelector("#userNo").value);
       //let userId=parseInt(document.querySelector("#userId").value);

        if((reply.reviewUserNo===userNo)){
            const cancelTd=document.createElement('td');
            const buttonTag=document.createElement('button');
            buttonTag.className='submitHostReplyBtn';
            buttonTag.type='button'

            const cancelTdButton=cancelTd.appendChild(buttonTag);
            cancelTdButton.innerText="삭제";
            replyRow.append(cancelTdButton);
        }
        
    }


}



function insertReview(){


}