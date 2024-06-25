package kr.co.nextus.sellerrank;

import java.sql.Timestamp;

import lombok.Data;

@Data

public class SellerRankVO {
	private int no;
	private String info;
	private int category1;
	private int category2;
	private double rating_avg;
	private int review_cnt;
	private String name;
	private String nickname;
	private String profile_real;
	private int loginstate;
	private int nested1;
	private int nested2;
	private int sellerrank;
}