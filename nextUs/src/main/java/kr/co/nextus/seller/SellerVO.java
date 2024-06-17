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
}