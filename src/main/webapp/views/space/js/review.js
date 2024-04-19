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
                reviewUserName:r.userName
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
        replyRow.innerHTML=` <th class='nickName'>`+reply.reviewUserName+`</th>
                             <td class='mb-1'>`+reply.reviewContent+`</td>
                             <td class='mb-1>`+reply.reviewInsertDate+`</td> `

        parentTag.appendChild(replyRow);   
        replyRow.className='comment_list';
        

    }

}



function insertReview(){


}