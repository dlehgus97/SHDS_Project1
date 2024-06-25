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
	private int sellno;
	private String selltitle;
	private String sellthumbnail;
	private String optionrank;
	private String optioncontent;
	private int discount;
	private String name;
	private String hp;
	private String email;
	private String addr1;
	private String addr2;

}