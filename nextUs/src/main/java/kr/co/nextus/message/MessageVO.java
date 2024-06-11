package kr.co.nextus.message;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MessageVO {
	private String action;
	private int chatno;
	private int sellno;
	private int senderno;
	private int opno;
	private String content;
	private Timestamp time;
	private int read_flag;
	
	private String profile_real;
	private String senderNickname;
	private int chatMember; //채팅 상대방을 편하게 설정하기 위함
}
