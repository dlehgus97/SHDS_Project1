package kr.co.nextus.mypage.asklist;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AskListVO {
	private int no;
	private int writer;
	private String category;
	private String title;
	private String text;
	private Timestamp write_date;
	private String answer;
	private Timestamp answer_date;
	private int readcnt;

	
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
	
	private int comment_count; // 댓글 수
	
	public AskListVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}
}
