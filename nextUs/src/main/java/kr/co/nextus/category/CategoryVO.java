package kr.co.nextus.category;


import lombok.Data;

@Data
public class CategoryVO {
	private int categoryno;
	private String categoryname;
	private int nested;
}
