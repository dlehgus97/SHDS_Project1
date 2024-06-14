package kr.co.nextus.cart;

import java.util.List;

public interface CartService {
	
	int insert(int memberno, int sellno, int optionno);
//	List<CartVO> list(int memberno, int sellno, int optionno);
	
	boolean exists(int memberno, int sellno, int optionno);
	
	int delete(int memberno, int sellno, int optionno);

	List<CartVO> list(int memberno);
}
