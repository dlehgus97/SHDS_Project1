package kr.co.nextus.selllist;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SellListVO {
	private int sellno;
	private int seller;
	private String title;
	private int price;
	private String content;
	private Timestamp postdate;
	private int view_cnt;
	private double rating_avg;
	private int review_cnt;
	private int status;
}