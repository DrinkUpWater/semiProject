

document.addEventListener('DOMContentLoaded', function () {
    let num= document.querySelector("#count_person");
    let max=12;
    let min=3;
    num.value=3;

    document.querySelector("#plus").onclick=function(){
   
    
     
     
       if( num.value>=max){
           alert("최대 12명까지입니다.");
          return false;
       }

      
       num.value++;
     
   }
   document.querySelector("#minus").onclick=function(){
		
    
   
       if( num.value<= min){
          
           alert("최소인원은 3명입니다.");
           return false;
       }
     
       num.value--;
    
   }
 })