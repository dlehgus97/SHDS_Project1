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
}
