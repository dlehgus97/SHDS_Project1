package kr.co.nextus.buylist;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BuyListVO {
	private int buyno;
	private int memberno;
	private int price;
	// 결제 상태
	private int status;
	private Timestamp buydate;
	private Timestamp decidedate;
	private int sellerno;
	private int sellno;
	// 판매글 번호
	private int no;
	private int discount;
	private int optionno;
	// 상품명
	private String title;
	// 구매자 닉네임
	private String nickname;
	// 옵션 등급 (브,실,골)
	private String optionrank;
	// 옵션 내용
	private String content;
}
