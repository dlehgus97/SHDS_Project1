package kr.co.nextus.report;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReportVO {
	private int reviewno;
	private int sellno;
	private int memberno;
	private String content;
	private int status;
	private Timestamp date;
}