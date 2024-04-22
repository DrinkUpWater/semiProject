$(function(){
    const url = new URL(window.location.href);
    const spaceNo = url.searchParams.get('spaceNo');

    getCommentList(spaceNo, callbackData);
    insertGuestComment(spaceNo);

    function callbackData(result){
        const replyBody = document.querySelector("#space_qa_comment tbody");
        let list = [];
        for (let r of result) {
            list.push({
                commentNo: r.commentNo,
                userId: r.userId,
                commentContent: r.commentContent,
                insertDate: r.insertDate,
                hostReply: r.hostReply,
                userNo: r.userNo
            });
        }
        drawTableList(list, replyBody);
    }

    function drawTableList(commentList, parentTag){
        for (let reply of commentList) {
            const replyRow = document.createElement('tr');
            replyRow.className = "table-light";
            replyRow.innerHTML = `<td class='font-weight-bold'>${reply.userId}</td>
                                  <td>${reply.commentContent}</td>`;

            const replyRow1 = document.createElement('tr');
            replyRow1.className = "table-secondary";
            replyRow1.innerHTML = `<td class='text-right'>${reply.insertDate}</td>`;

            const replyRow2 = document.createElement('tr');
            const hostReplyToggle = document.createElement('button');
            hostReplyToggle.className = "btn btn-info btn-sm";
            hostReplyToggle.innerText = "Show Host Reply";
            replyRow2.appendChild(document.createElement('td')).appendChild(hostReplyToggle);

            const replyRow3 = document.createElement('tr');
            replyRow3.className = "table-primary d-none";
            replyRow3.innerHTML = `<td colspan="2"><div class='p-2'>${reply.hostReply}</div></td>`;

            const replyRow4 = document.createElement('tr');
            replyRow4.className = "table-warning";

            hostReplyToggle.addEventListener('click', function() {
                replyRow3.classList.toggle('d-none');
            });

            parentTag.append(replyRow, replyRow1, replyRow2, replyRow3, replyRow4);

            if (document.querySelector("#hostCheck").value === "true") {
                const enrollBtn = document.createElement('button');
                enrollBtn.className = 'btn btn-success';
                enrollBtn.innerText = 'Submit Host Reply';
                enrollBtn.addEventListener('click', function() {
                    insertHostComment(enrollBtn, textarea, reply.commentNo);
                });

                const deleteBtn = document.createElement('button');
                deleteBtn.className = 'btn btn-danger';
                deleteBtn.innerText = 'Delete Host Reply';
                deleteBtn.addEventListener('click', function() {
                    deleteHostComment(deleteBtn, reply.commentNo);
                });

                replyRow4.append(enrollBtn, deleteBtn);
            }

            if (parseInt(document.querySelector("#userNo").value) === reply.userNo) {
                const deleteButton = document.createElement('button');
                deleteButton.className = 'btn btn-danger btn-sm';
                deleteButton.innerText = 'Delete';
                deleteButton.addEventListener('click', function() {
                    deleteGuestComment(deleteButton, reply.commentNo);
                });

                replyRow.appendChild(deleteButton);
            }
        }
    }
});
