package kr.co.nextus.member;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int no;
	private String name;
	private String email;
	private String pwd;
	private String newpwd;
	private String nickname;
	private char gender;
	private Date birthday;
	private String hp;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Timestamp regdate;
	private int state;
	private int seller;
	private String profile_org;
	private String profile_real;

	//관리자페이지에서 씁니다요
	// 사용자로부터 전송되어지는 값(검색, 페이징, 필터링(조건))
	private String searchType;
	private String searchWord;
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
	
	//최근7일 내역볼때
	private int totalmember;
	private Timestamp totaldate;
	
	private int total_members;
	private int today_members;
	
	private int bancount; //누적 제재횟수
	private int purchaseCount;//누적구매횟수
	private int reportcount;//신고횟수
	
	
	public MemberVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}
	

}