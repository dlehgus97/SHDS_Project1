package kr.co.nextus.ban;

import java.sql.Date;
import java.sql.Timestamp;
import lombok.Data;

@Data
public class BanVO {
	private int no;
	private int memberno;
	private String content;
	private Date date;
	

	//관리자 페이지에서 동작
	private int page; // 사용자가 요청한 페이지 번호
	private int startIdx; // limit 앞에 들어갈 시작인덱스값
	private String email;
	public BanVO() {
		this.page = 1;
	}
	
	public int getStartIdx() {
		return (page-1) * 10;
	}
}
