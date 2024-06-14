package kr.co.nextus.mypage.orderdetail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.notice.NoticeVO;


@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	
	@Autowired
	private OrderDetailMapper mapper;


	@Override
	public OrderDetailVO list(OrderDetailVO param) {

        return mapper.list(param); // 목록
	}

}
