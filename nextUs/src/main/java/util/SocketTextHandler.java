package util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketTextHandler extends TextWebSocketHandler {
	private final Map<String, WebSocketSession> sessions = new HashMap<>();
	private int n = 1;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		sessions.put(n+"", session);
		n++;

		System.out.println("새 클라이언트와 연결되었습니다.");
		System.out.println(session.getId());
		System.out.println(n);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		System.out.println(message.getPayload());// getPayload => 메시지불러오는 역할
		TextMessage send;
		if (sessions.containsKey("2")) {
			WebSocketSession sessionOp = sessions.get("2");
			sessionOp.sendMessage(message);
		} else {
			System.out.println("안들어옴");
		}
		System.out.println("나옴");
		
		//sessionId + message 합치서 구분자변수
		//session 구할 수 있다 -> 위에서로 부터
		//sessions.value() 찾으면 좀 구려
		//1. jsp 의 id parameter를 map의 string에 넣어준다.
		//2. A가 B에게 메세지를 보낸다.
		//3-1 웹소켓에 message와 상대의 id 와 있어야해 -> 여기서의 id는 위랑은 다르다.
		//3-2 sessionId opId 나눠줘야해 if (send면?)
		//String id, String message
		//4-1 map에서 찾아 상대id를
		//4-2 찾았는데? 없네? -> query 만 쏴주면 된다.
		//4-3 찾았는데? 있네? -> send도 해주고 query도 쏴주고
		//sessions.containsKey(id);
		//-> String send = "recieve : " + 내id + " " + 상대방id + " " + message;
		//4-4 recieve 구분자를 붙여서 recieve : 보낸사람아이디 받는사람아이디 메세지
		//5-1 위에서 받은 메세지를 잘 변형 변수로 recieve 구분자 -> if(recieve면?)
		//5-2 보낸사람 받는사람 메세지 다 있어 if(내 세션이 받는사람 세션이야) 어? 나네?
		//5-3 내 세션.sendMessage(message);
		

//		for (WebSocketSession connectedSession : sessions.values()) {
//            if (connectedSession.isOpen()) {
//            	connectedSession.sendMessage(message);
//            }
//        }
    }

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		sessions.remove(session.getId());

		System.out.println("특정 클라이언트와의 연결이 해제되었습니다.");
	}
}

