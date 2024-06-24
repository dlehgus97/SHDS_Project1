package kr.co.nextus.sellerrequest;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class SellerRequestVO {
	private int no;
	private int memberno;
	private String details;
	private String bank;
	private String account;
	private Timestamp regdate;
	private int state;//1승인전 0승인후 -1승인거부
	
	// 셀러등록을 위한
	private String file_real;
	private String file_org;
	
	// 관리자페이지에서 씁니다요
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
	
	private String email;
	private String nickname;
	public SellerRequestVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}

}