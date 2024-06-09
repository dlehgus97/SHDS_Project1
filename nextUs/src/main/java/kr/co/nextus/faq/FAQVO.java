package kr.co.nextus.faq;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FAQVO {
	private int no;
	private String question;
	private String answer;

	
	
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값

	
	public FAQVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}
}
