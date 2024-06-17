package kr.co.nextus.mypage.refund;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.review.ReviewVO;



public interface RefundService {
	
	int insert(RefundVO vo, HttpServletRequest request);
	int update(RefundVO vo);
	
}
