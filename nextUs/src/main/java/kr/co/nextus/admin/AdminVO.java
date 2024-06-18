package kr.co.nextus.admin;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminVO {
	private int no;
	private String title;
	private String content;
	private Timestamp writedate;
}
