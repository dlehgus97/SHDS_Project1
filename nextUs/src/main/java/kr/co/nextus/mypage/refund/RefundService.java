package kr.co.nextus.mypage.refund;


import java.util.Map;
import javax.servlet.http.HttpServletRequest;



public interface RefundService {
	
	int insert(RefundVO vo, HttpServletRequest request);
	int update(RefundVO vo);
	Map<String, Object> list(RefundVO vo);
	Map<String, Object> list(RefundVO vo, int no);
	
	//환불하기
	boolean refund(RefundVO vo);
}
