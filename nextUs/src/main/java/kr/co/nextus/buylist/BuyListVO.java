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

	
	
	
	// 관리자페이지에서 씁니다요
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값

	private String sellerEmail;

	public BuyListVO() {
			this.page = 1;
		}

	public int getStartIdx() {
			return (page-1) * 10;
	}
}
