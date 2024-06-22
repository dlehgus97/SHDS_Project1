package kr.co.nextus.cart;

import java.util.List;

import kr.co.nextus.buylist.BuyListVO;

public interface CartService {
	
	int insert(int memberno, int sellno, int optionno);
//	List<CartVO> list(int memberno, int sellno, int optionno);
	
	int check(int memberno, int sellno, int optionno);
	
	int delete(int memberno, int sellno, int optionno);

	List<CartVO> list(int memberno);
	void delList(BuyListVO vo);
}
