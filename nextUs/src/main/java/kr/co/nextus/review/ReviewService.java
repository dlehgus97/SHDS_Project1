package kr.co.nextus.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.review.ReviewVO;



public interface ReviewService {
	Map<String, Object> list(ReviewVO vo);
	int insert(ReviewVO vo, HttpServletRequest request);
	int update(ReviewVO vo, HttpServletRequest request);
	int updateisreview(ReviewVO vo);
	int delete(int reviewno);
	
}
