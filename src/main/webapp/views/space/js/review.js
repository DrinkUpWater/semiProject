
//지역변수로 설정 ..
//공간 정보 필요
//컨텐츠내용
//content

const urlStrReview = window.location.href;

$(function(){

    const url = new URL(urlStrReview);

    const urlParams =url.searchParams
    const spaceNo= urlParams.get('spaceNo');
    console.log(spaceNo);

    getReviewList(spaceNo,callbackReview)
    insertReview(spaceNo);
  


// $(function(){
//     insertReview();
// })

//콜백함수
function callbackReview(result){
    const replyBody=document.querySelector("#space_review tbody")
    let list =[]
    for(let r of result){
        list.push({
            reviewNo:r.reviewNo,
            reviewContent:r.content,
            reviewInsertDate:r.insertDate,
            reviewUserName:r.userName,
            reviewUserNo:r.userNo
        })
    }
    drawTableList( list,replyBody)
    console.log("callback: "+list)
}



function getReviewList(spaceNo,callback){
   
     $.ajax({

        url:"review.sp",
        cache: false,
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
        replyRow.className="review_list";
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

        replyRow.className='review_body';
        replyRow1.className='review_body';
        replyRow2.className='review_body';
      //  submitHostReplyBtn
      
       //리뷰를 쓴 등록되어있는 유저

       let userNo=parseInt(document.querySelector("#userNo").value);
       //let userId=parseInt(document.querySelector("#userId").value);

        if((reply.reviewUserNo===userNo)){
            const cancelTd=document.createElement('td');
            const buttonTag=document.createElement('button');
           // buttonTag.className='submitHostReplyBtn';
            buttonTag.type='button'

            const cancelTdButton=cancelTd.appendChild(buttonTag);
            cancelTdButton.innerText="삭제";
            replyRow.append(cancelTdButton);

            deleteButton(buttonTag,reply.reviewNo)
        }
        
    }


}

function deleteButton(buttonTag,reviewNo){

    buttonTag.onclick=function(){
        $.ajax({
            url:"delete.re",
            cache: false,
            data:{
                reviewNo:reviewNo,
            },
            success(result){
                alert(result);
                document.querySelector("#review_body").innerHTML="";
                getReviewList(spaceNo,callbackReview);
            },
            error(result){
                alert(result);
            }
        })
      
    }
   
}



function insertReview(spaceNo){

   const reviewButton= document.querySelector("#reivew_enroll");
   const reviewContent=document.querySelector("#reivew_content");

   reviewButton.onclick=function(){
        $.ajax({
            url:"insert.re",
            cache: false,
            method:"POST",
            data:{
                spaceNum:spaceNo,
                content:reviewContent.value
            },
            success(result){
                alert(result)
                reviewContent.value="";
                document.querySelector("#review_body").innerHTML="";
                getReviewList(spaceNo,callbackReview);
            },
            error(result){
                alert(result)
            }
        })
      
    }

}

})