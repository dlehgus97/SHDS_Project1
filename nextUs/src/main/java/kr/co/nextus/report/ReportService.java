package kr.co.nextus.report;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.review.ReviewVO;



public interface ReportService {
	
	int insert(ReportVO vo, HttpServletRequest request);
	
}
