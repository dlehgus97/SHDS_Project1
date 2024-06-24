package kr.co.nextus.mypage.orderlist;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderListVO {
	private int buyno;
	private int memberno;
	private int price;
	private int status;
	private Timestamp buydate;
	private Timestamp decidedate;
	private int sellerno;
	private int sellno;
	private String selltitle;
	
	public OrderListVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}



	// 관리자페이지에서 씁니다요
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값

}