package kr.co.nextus.mypage.pinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.member.MemberVO;
import kr.co.nextus.mypage.orderlist.OrderListVO;
import kr.co.nextus.notice.NoticeVO;


@Service
public class PinfoServiceImpl implements PinfoService {
	
	@Autowired
	private PinfoMapper mapper;


	@Override
	public MemberVO list(MemberVO vo) {

		return mapper.list(vo); 
	}
	
	@Override
	public int check(MemberVO vo) {

		return mapper.check(vo); 
	}
	
	 @Override
	 public int update(MemberVO vo) {
	     return mapper.update(vo);
	 }

}
