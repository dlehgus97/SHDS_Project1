package kr.co.nextus.mypage.wishlist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.mypage.orderlist.OrderListVO;
import kr.co.nextus.notice.NoticeVO;


@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	private WishListMapper mapper;


	@Override
	public List<WishListVO> list(WishListVO vo) {
		List<WishListVO> list = mapper.list(vo); 
		return list; 
       
	}
	
	@Override
	public int delete(WishListVO vo) {
		return mapper.delete(vo); // 목록
       
	}
	
	@Override
	public int count(WishListVO vo) {
		return mapper.count(vo);
       
	}
	
	@Override
	public int insert(WishListVO vo) {
		return mapper.insert(vo);
       
	}

}
