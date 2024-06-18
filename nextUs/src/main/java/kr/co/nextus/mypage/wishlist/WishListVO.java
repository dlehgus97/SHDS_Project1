package kr.co.nextus.mypage.wishlist;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WishListVO {
	
	private int memberno;
	private int sellno;
	private String title;
	private int price;
	private String thumbnail_real;
}