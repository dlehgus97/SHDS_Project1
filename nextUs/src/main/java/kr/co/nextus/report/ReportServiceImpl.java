package kr.co.nextus.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.review.ReviewVO;


@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportMapper mapper;


	
	@Override
	public int insert(ReportVO vo, HttpServletRequest request) {

		int r = mapper.insert(vo);

		return r;
	}

}
