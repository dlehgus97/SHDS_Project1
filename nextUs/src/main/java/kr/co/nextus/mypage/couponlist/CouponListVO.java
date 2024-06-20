package kr.co.nextus.mypage.couponlist;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CouponListVO {
	private int no;
	private int memberno;
	private int discount;
	private int status;
	private String name;
	private int type;

}
