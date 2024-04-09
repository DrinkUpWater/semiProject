

document.addEventListener('DOMContentLoaded', function () {

    function selectCommentList(){


        $.ajax({
            // url:'test.sp',
            url:'comment.bo',
             type:'GET',
           
             data:{
                coNum:1
             },

             success:function(response){

                    let str=null;
                             for(let reply of res){
                                    str+=("<tr>"+
                                        
                                    "<td>"+reply['replyWriter']+"</td>"+
                                    "<td>"+reply['replyContent']+"</td>"+
                                    "<td>"+reply['createDate']+"</td>"+
                                      
                                    "</tr>");

                                    }

                
             },
             error:function(error){
                 
             }


         })

    }



});