package kr.co.nextus.report;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.review.ReviewVO;



public interface ReportService {
	//관리자 페이지에서 동작
	Map<String, Object> list(ReportVO vo);
	int insert(ReportVO vo, HttpServletRequest request);
}
