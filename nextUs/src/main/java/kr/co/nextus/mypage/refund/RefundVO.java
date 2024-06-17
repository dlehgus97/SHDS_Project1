package kr.co.nextus.mypage.refund;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RefundVO {
	
	private int buyno;
	private String content;
	private int refund_amount;
	private Timestamp date;
}