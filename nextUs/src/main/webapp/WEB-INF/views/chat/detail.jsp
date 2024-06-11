<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.nextus.member.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>끼예에에에엑</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/chatDetail.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<textarea id="messageTextArea" rows="10" cols="50" style="display: none;"></textarea>
	<div id="outer_container">
		<div id="messageContainer" style="width:100%; display:flex; flex-direction:column;">
			<c:forEach var="vo" items="${list }">
				
				<div class="message-box ${login.no == vo.senderno ? 'me' : 'other'}">
					<p>${vo.content }</p>
				</div>
			</c:forEach>
		</div>
		<form>
	        <input id="textMessage" type="text">
	        <input onclick="sendMessage()" value="전송" type="button">
	        <input onclick="disconnect()" value="나가기" type="button">
	    </form>
    </div>

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
	<script>
		var webSocket = new WebSocket("ws://localhost:8090/websocket");
		var messageTextArea = document.getElementById("messageTextArea");
		var messageContainer = document.getElementById("messageContainer");
		// WebSocket 서버와 접속이 되면 호출되는 함수
		webSocket.onopen = function(message) {
			messageTextArea.value += "Server connect...\n";
			var messageData = {
            	action: "connect",
            	senderno: ${login.no}
            };
			webSocket.send(JSON.stringify(messageData));
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
			var senderno = data.senderno;
			var opno = data.opno;
			var recieve = data.content;
			//5-1 위에서 받은 메세지를 잘 변형 변수로 recieve 구분자 -> if(recieve면?)
			//5-2 보낸사람 받는사람 메세지 다 있어 if(내 세션이 받는사람 세션이야) 어? 나네?
			//5-3 내 세션.sendMessage(message);
			//if(recieve면?)
			//나는 지금 누구와의 대화방에 들어와있는가?
			//var op = ${session.getOpId}; //상대방 아이디 얻어서
			//(if 보내는사람 == op) 맞으면?
			var userNickname = data.senderNickname;
			messageTextArea.value += "상대방 닉네임 : " + message.data + "\n";
			addMessageToContainer(userNickname, recieve);
			//message.split
		};
		
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
            var message = document.getElementById("textMessage").value;
            var chatno = ${chatno };
            var sellno = ${sellno };
            var userNo = ${login.no};
            console.log(userNo);
            var userNickname = "${login.nickname }";
            var op = ${chatMember };
            console.log(op);
            var messageData = {
            	action: "sendMessage",
            	chatno: chatno,
            	sellno: sellno,
                senderno: userNo,
                senderNickname: userNickname, 
                opno: op,
                content: message
            };
            messageTextArea.value += "Send to Server => " + userNo + ": " + message + "\n";
            webSocket.send(JSON.stringify(messageData));
            addMessageToContainer(userNickname, message);
            document.getElementById("textMessage").value = "";
        }
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			var messageData = {
            	action: "disconnect",
            	senderno: ${login.no}
            };
			webSocket.send(JSON.stringify(messageData));
			webSocket.close();
		}
		
		function addMessageToContainer(sender, text) {
			var userNickname = "${login.nickname }";
			var messageBox = document.createElement("div");
			messageBox.classList.add("message-box");
			if (sender === userNickname) {
				messageBox.classList.add("me");
			} else {
				messageBox.classList.add("other");
			}
			messageBox.textContent = text;
			messageContainer.appendChild(messageBox);
		}
	</script>
</body>
</html>
