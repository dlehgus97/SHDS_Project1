package kr.co.nextus.mypage.wishlist;

import java.util.List;
import java.util.Map;


public interface WishListService {
	List<WishListVO> list(WishListVO vo);
	int delete(WishListVO vo);
	int count(WishListVO vo);
	int insert(WishListVO vo);
}
