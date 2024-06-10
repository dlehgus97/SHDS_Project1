<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        form {
           background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: block;
            clear: both;
            width: 100%;
            box-sizing: border-box;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="button"] {
            width: 48%;
		    background-color: #B19CD9;
		    color: white;
		    padding: 14px 20px;
		    margin: 8px 0;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
        }
        input[type="button"]:hover {
            background-color: #9f85c2;
        }
        textarea {
            resize: horizontal;
        }
        .message-box {
            display: inline-block;
            padding: 10px;
            margin-bottom : 10px;
            background-color: #f0f0f0;
            font-size: 16px;
            max-width: 100%;
            word-wrap: break-word;
        }
        .message-box.me {
            background-color: #DCF8C6;
            align-self: flex-end;
            text-align: right;
        }
        .message-box.other {
            background-color: #FFFFFF;
            align-self: flex-start;
            text-align: left;
        }
    </style>
</head>
<body>
	<textarea id="messageTextArea" rows="10" cols="50"></textarea>
	<div id="messageContainer" style="width:100%; display:flex; flex-direction:column;"></div>
	<form>
        <input id="textMessage" type="text">
        <input onclick="sendMessage()" value="전송" type="button">
        <input onclick="disconnect()" value="나가기" type="button">
    </form>

    
	<script>
		var webSocket = new WebSocket("ws://localhost:8090/websocket");
		var messageTextArea = document.getElementById("messageTextArea");
		var messageContainer = document.getElementById("messageContainer");
		// WebSocket 서버와 접속이 되면 호출되는 함수
		webSocket.onopen = function(message) {
			messageTextArea.value += "Server connect...\n";
		};
		// WebSocket 서버와 접속이 끊기면 호출되는 함수
		webSocket.onclose = function(message) {
			messageTextArea.value += "Server Disconnect...\n";
		};
		// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
		webSocket.onerror = function(message) {
			messageTextArea.value += "error...\n";
		};
		// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
		webSocket.onmessage = function(message) {
			var data = JSON.parse(message.data);
			//5-1 위에서 받은 메세지를 잘 변형 변수로 recieve 구분자 -> if(recieve면?)
			//5-2 보낸사람 받는사람 메세지 다 있어 if(내 세션이 받는사람 세션이야) 어? 나네?
			//5-3 내 세션.sendMessage(message);
			//if(recieve면?)
			//나는 지금 누구와의 대화방에 들어와있는가?
			//var op = ${session.getOpId}; //상대방 아이디 얻어서
			//(if 보내는사람 == op) 맞으면?
			messageTextArea.value += "상대방 닉네임 : " + message.data + "\n";
			addMessageToContainer("상대방", message.data);
			//message.split
		};
		<%
			String userId = (String)session.getAttribute("userId");
		%>
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
            var message = document.getElementById("textMessage").value;
            var userId = "<%= userId %>";
            var messageData = {
                userId: userId,
                message: message
            };
            messageTextArea.value += "Send to Server => " + userId + ": " + message + "\n";
            webSocket.send(JSON.stringify(messageData));
            addMessageToContainer("나", message);
            document.getElementById("textMessage").value = "";
        }
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			webSocket.close();
		}
		
		function addMessageToContainer(sender, text) {
			var messageBox = document.createElement("div");
			messageBox.classList.add("message-box");
			if (sender === "나") {
				messageBox.classList.add("me");
			} else {
				messageBox.classList.add("other");
			}
			messageBox.textContent = sender + ": " + text;
			messageContainer.appendChild(messageBox);
		}
	</script>
</body>
</html>
