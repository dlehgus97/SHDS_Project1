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

	// 관리자페이지에서 씁니다요
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
	private String sellerName;
}