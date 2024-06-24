package kr.co.nextus.selllist;

import java.sql.Timestamp;

import lombok.Data;

@Data

public class SellListVO {
	private int sellno;
	private int seller;
	private int loginno;
	private String title;
	private int price;
	private String content;
	private Timestamp postdate;
	private int view_cnt;
	private double rating_avg;
	private int review_cnt;
	private int status;
	private int bronzeoptionno;
	private int silveroptionno;
	private int goldoptionno;
	private String bronzecontent;
	private String silvercontent;
	private String goldcontent;
	private int bronzeprice;
	private int silverprice;
	private int goldprice;
	private String info;
	private String thumbnail_real;
	private int like_count;
	private int isreview;
	private int sellerrating_avg;
	private int sellerreview_cnt;
	private int categoryno;
	private String categoryname;
	private int nested;
	private String order;
	private int depth;
	
	// 관리자페이지에서 씁니다요
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
	private String sellerName;
	
	public SellListVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}
}