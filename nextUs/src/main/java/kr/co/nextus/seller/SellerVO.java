package kr.co.nextus.seller;

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
}