package kr.co.nextus.websoket;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MessageVO {
	private String action;
	private int chatno;
	private int sellno;
	private int senderno;
	private String senderNickname;
	private int opno;
	private String content;
	private Timestamp time;
	private int read;
}
