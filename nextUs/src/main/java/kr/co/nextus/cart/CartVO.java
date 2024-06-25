package kr.co.nextus.cart;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {
	private int memberno;
	private int sellno;  
	private int optionno;
	private Timestamp date;
	private int price;
	
	private String title;
	private String thumbnail_real;
	private String optionrank;
	private String content;
	
	//후 memberno가 변환되는 것을 편하게 사용하기 위함
	private int sellerno;
}
