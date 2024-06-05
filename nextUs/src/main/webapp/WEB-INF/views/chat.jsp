<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Web Socket Example</title>
</head>
<body>
	<form>
		<input id="textMessage" type="text">
		<input onclick="sendMessage()" value="전송" type="button">
		<input onclick="disconnect()" value="종료" type="button">
	</form>
	<br />
	<textarea id="messageTextArea" rows="10" cols="50"></textarea>
	<script>
		var webSocket = new WebSocket("ws://localhost:8090/nextus/websocket");
		var messageTextArea = document.getElementById("messageTextArea");
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
			console.log(message);
			//5-1 위에서 받은 메세지를 잘 변형 변수로 recieve 구분자 -> if(recieve면?)
			//5-2 보낸사람 받는사람 메세지 다 있어 if(내 세션이 받는사람 세션이야) 어? 나네?
			//5-3 내 세션.sendMessage(message);
			//if(recieve면?)
			//나는 지금 누구와의 대화방에 들어와있는가?
			//var op = ${session.getOpId}; //상대방 아이디 얻어서
			//(if 보내는사람 == op) 맞으면?
			messageTextArea.value += "상대방 닉네임 : " + message.data + "\n";
			//message.split
		};
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
			var message = document.getElementById("textMessage");
			//var op = ${session.getOpId}; //상대방 아이디 얻어서
			messageTextArea.value += "Send to Server => " + message.value + "\n"; //여기서 상대방의 아이디를 붙여서 보내줘야한다.
			console.log(message.value);
			webSocket.send(message.value);
			message.value = "";
		}
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			webSocket.close();
		}
	</script>
</body>
</html>