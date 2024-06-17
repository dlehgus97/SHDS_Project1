package kr.co.nextus.mypage.orderlist;

import java.util.List;
import java.util.Map;


public interface OrderListService {
	Map<String, Object> list(OrderListVO vo);
	int update(OrderListVO vo);

}
