package kr.co.nextus.review;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewno;
	private String writer;
	private int writeno;
	private Timestamp writedate;
	private int score;
	private String title;
	private String text;
	

	
	
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private int no;//글번호에 해당하는 리뷰 가져오기 위해
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값

	
	public ReviewVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}
}