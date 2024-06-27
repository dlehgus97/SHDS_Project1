package kr.co.nextus.seller;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SellerVO {
	private int no;
	private String info;
	private int category1;
	private int category2;
	private String bank;
	private String account;
	private double rating_avg;
	private int review_cnt;
	private String profile_real;
	private String nickname;
	
//	// 최근 일주일 동안 받은 주문 수
//	private int daily_order_count;
//	// 최근 일주일 동안 받은 주문 일자
//	private Timestamp order_date;
//	// 최근 일주일 동안 일일 매출액
//	private int daily_sales;
//	// 최근 일주일 동안 받은 주문 일자
//	private Timestamp sales_date;
//	// 최근 일주일 동안 환불 수
//	private int daily_refund_count;
//	// 최근 일주일 동안 환불 일자
//	private Timestamp refund_date;
//	// 최근 일주일 동안 일일 리뷰 수
//	private int daily_review_count;
//	// 최근 일주일 동안 리뷰 받은 일자
//	private Timestamp review_date;
	
	private Timestamp date;
	private int daily_order_count;
	private int daily_sales;
	private int daily_refund_count;
	private int daily_review_count;
	
	private int today_orders_count;
	private int today_refund_count;
	private int new_chat;
	private int settlement_eligible;
	
	// 셀러등록을 위한
	private String details;
	private String file_real;
	private String file_org;
	
	// 관리자페이지에서 씁니다요
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값

	public SellerVO() {
		this.page = 1;
	}

	public int getStartIdx() {
		return (page - 1) * 8;
	}
}