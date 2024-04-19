     
                                    document.addEventListener('DOMContentLoaded', function () {
                                      

                                        document.querySelector("#reservation_btn").addEventListener('click',function(e){
                                         
                                        
                                        //let modal=document.querySelector(".modal");
                                        let choiced_date=document.querySelector("#choiced_date").value;
                                        let choiced_time=document.querySelector("#choiced_time").value;
                                        let choiced_price=document.querySelector("#choiced_price").value;
                                        let choiced_count=document.querySelector("#count_person").value;

                                        let pay_button=document.querySelector("#edit-pwd-btn");

                                        if(choiced_date===""){
                                            alert("날짜를 선택하세요")
                                           
                                            $("#pay-modal").modal({show: false});
                                             pay_button.disabled=true; 
                                         
                                            e.preventDefault();
                                       
                                            //return false;
                                        }
                                        if(choiced_time===""){
                                            alert("시간을 선택하세요")
                                            document.querySelector("#reservationTime").value=""
                                            pay_button.disabled=true;
                                            
                                            e.preventDefault();
                                         
                                            //return false;
                                        }
                                        
                                        if(document.querySelector("#userNo").value==="-1"){
											alert("로그인하세요");
											e.preventDefault();
                                            pay_button.disabled=true;
                                            //return false;
										}
            
                                       
            
                                      document.querySelector("#reservationDate").value=choiced_date
                                      document.querySelector("#reservationTime").value=choiced_time
                                      document.querySelector("#payment").value=choiced_price
                                      document.querySelector("#personalCount").value=choiced_count
                                      pay_button.disabled=false;
                                     // $('#pay-modal').modal('show');
                                    })
                                })