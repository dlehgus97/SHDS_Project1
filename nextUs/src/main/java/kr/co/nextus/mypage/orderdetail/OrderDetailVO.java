package kr.co.nextus.mypage.orderdetail;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int buyno;
	private int memberno;
	private int price;
	private int status;
	private Timestamp buydate;
	private Timestamp decidedate;
	private int sellerno;
	private String selltitle;
	private String sellthumbnail;
	private String optionrank;
	private String optioncontent;

}