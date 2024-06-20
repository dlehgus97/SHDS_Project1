package kr.co.nextus.report;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;


public interface ReportService {
	
	int insert(ReportVO vo, HttpServletRequest request);
	//관리자 페이지에서 동작
	Map<String, Object> list(ReportVO vo);
	Map<String, Object> list(ReportVO vo, int no);
	List<ReportVO> list(String email);
}
