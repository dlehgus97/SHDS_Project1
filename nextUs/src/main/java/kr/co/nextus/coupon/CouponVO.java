package kr.co.nextus.coupon;


import lombok.Data;

@Data
public class CouponVO {
	private int no;
	private int memberno;
	private int discount;
	private int status; // 0:사용불가 1:사용가능
	private String name;
	private int type; // 1:고정할인 2:%할인

	
	
	// 관리자페이지에서 씁니다요
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값

}