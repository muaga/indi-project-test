/**
 * 채팅 메세지 add, snapshot으로 확인
 */

import {db} from './firebase-config.js';

const userId = document.getElementById('userId').value;

// 메세지 보내는 버튼
const sendMessageButtons = document.querySelectorAll('.l_send_message_button');
console.log("버튼 수 : " + sendMessageButtons.length);

// 해당 채팅 버튼을 클릭 시 채팅 내용 뜨기

// 채팅방 버튼
const chatButtons = document.querySelectorAll('.l_channel_card_button');
chatButtons.forEach((chatButton) => {
    chatButton.addEventListener('click', ()=> {
        console.log("해당 버튼 : " + chatButton.id);
        const number = chatButton.getAttribute('id').replace('movie', ''); // 1

        let chatMessagesContainer = document.getElementById(`chatMessages` + number);
        let movieTitle = document.getElementById(`movieTitle` + number).value;
        snapshotListener(chatMessagesContainer, movieTitle);

        // 화면 높이 가져와서 채팅방에 설정하기
        const windowHeight = window.innerHeight;
        const chatContainer = document.querySelector(".l_chat_message_box");
        chatContainer.style.height = `${windowHeight}px`;
    })
});



// 각 채팅방에 존재하는 메시지 전송 버튼을 클릭 시 메세지를 인식하여 채팅방에 메세지 넣기
sendMessageButtons.forEach((sendMessageButton) => {

    sendMessageButton.addEventListener('click', () => {

        console.log("입력한 버튼 : " + sendMessageButton.id); // send_button1
        const number = sendMessageButton.getAttribute('id').replace('send_button', ''); // 1
        console.log("입력한 버튼의 숫자 : " + number);
        let chatMessagesContainer = document.getElementById(`chatMessages` + number);
        console.log("입력한 채팅방 : " + chatMessagesContainer.id);
        const messageInput = document.getElementById(`l_message_input` + number);
        const messageText = messageInput.value;
        console.log("입력값 : " + messageText + " / 채팅칸 : " + messageInput.id);
        const chatTitle = document.getElementById(`movieTitle` + number).value;
        console.log("채팅방 영화 : " + chatTitle);

        const timestamp = new Date().toLocaleTimeString();

        // add 로 메세지 넣기
        db.collection(chatTitle).add({
            id: userId,
            message: messageText,
            timestamp: timestamp,
        })
            .then((docRef) => {
                console.log("메시지가 성공적으로 추가되었습니다. 문서 ID:", docRef.id);
            })
            .catch((error) => {
                console.error("메시지 추가 중 오류 발생:", error);
            });

        messageInput.value = '';
        });
});

// 스냅샷 리스너 (채팅이 추가되는지 듣고있음)
function snapshotListener(chatMessagesContainer, chatTitle) {
    db.collection(chatTitle)
        .orderBy("timestamp")
        .onSnapshot((snapshot) => {
            console.log("스냅샷 실행");
            snapshot.docChanges().forEach((change) => {
                console.log("스냅샷 들어와서 실행");
                if (change.type === "added") {
                    const messageData = change.doc.data();
                    const messageContainer = addMessage(messageData.id, messageData.message, messageData.timestamp);
                    console.log("메세지 컨테이너들 : " + messageData.message);
                    chatMessagesContainer.insertBefore(messageContainer, chatMessagesContainer.lastChild);
                    chatMessagesContainer.scrollTop = chatMessagesContainer.scrollHeight;
                }
            });
        });
}

// 스냅샷 리스너 (채팅이 추가되는지 듣고있음)
function addSnapshot(chatMessagesContainer, messageText) {
    const messageContainer = addMessage(messageText.id, messageText.message, messageText.timestamp);
    console.log("메세지 컨테이너들 : " + messageData.message);
    chatMessagesContainer.insertBefore(messageContainer, chatMessagesContainer.lastChild);
    chatMessagesContainer.scrollTop = chatMessagesContainer.scrollHeight;
}


function addMessage(name, message, time) {
    const messageContainer = document.createElement('div');
    messageContainer.classList.add('l_message_container');

    const textContainer = document.createElement('div');
    textContainer.classList.add('l_message_text');

    const nameElement = document.createElement('div');
    nameElement.classList.add('l_message_name');
    nameElement.textContent = name;

    const textElement = document.createElement('div');
    textElement.textContent = message;

    const timeElement = document.createElement('div');
    timeElement.classList.add('l_message_time');
    timeElement.textContent = time;

    messageContainer.appendChild(nameElement);
    messageContainer.appendChild(textElement);
    messageContainer.appendChild(timeElement);

    return messageContainer;
}


// Enter 키를 누를 때 메시지 전송 -> TODO: 수정해야 함?
function handleKeyPress() {
    console.log('');
    if (window.event.keyCode === 13) {
        sendMessage();
    }
}

// 채널 버튼 토글
let channelButton = document.querySelectorAll(".l_channel_card_button");
channelButton.forEach(function (button) {
    button.addEventListener("click", function () {

        // .l_toggle_more을 순회하면서 모든 display를 none 하기
        let allMoreContent = document.querySelectorAll(".l_toggle_more");
        allMoreContent.forEach(function (moreContent) {

            if (moreContent.style.display === "none") {
                moreContent.style.display = "none";
            } else {
                moreContent.style.display = "none";
            }
        })

        // 그 다음 button 하위 요소 중 이벤트가 발생한 버튼이 하위 요소 중 none이 있다면 inline하기
        let currentMoreContent = button.nextElementSibling;
        if (currentMoreContent.style.display === "none") {
            currentMoreContent.style.display = "inline";
        }
    })
})

//////////////////////////////////////////////////////////////////

const channelButtons = document.querySelectorAll('.l_channel_card_button');
const chatRooms = document.querySelectorAll('.l_chat_room');

// 채널 버튼을 순회
channelButtons.forEach(channel => {
    channel.addEventListener('click', () => {
        // 선택된 탭에 대한 스타일 변경
        // 특정 버튼을 클릭하면 나머지 버튼의 active를 삭제
        channelButtons.forEach(channel => channel.classList.remove('active'));
        channel.classList.add('active');

        // 선택된 탭 내용 표시
        // tab의 id에 tab -> content로 변경하면 id=content1을 찾는다.
        const channelId = channel.getAttribute('id').replace('movie', 'movie_chat');
        chatRooms.forEach(room => room.classList.remove('show'));
        document.getElementById(channelId).classList.add('show');
    });
});

