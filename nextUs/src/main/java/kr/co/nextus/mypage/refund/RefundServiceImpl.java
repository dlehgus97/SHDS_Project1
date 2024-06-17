package kr.co.nextus.mypage.refund;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class RefundServiceImpl implements RefundService {
	
	@Autowired
	private RefundMapper mapper;


	
	@Override
	public int insert(RefundVO vo, HttpServletRequest request) {

		int r = mapper.insert(vo);

		return r;
	}
	
	@Override
	public int update(RefundVO vo) {

		int n = mapper.update(vo);

		return n;
	}
}
