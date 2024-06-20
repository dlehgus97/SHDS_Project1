package kr.co.nextus.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.sellerrequest.SellerRequestVO;


@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportMapper mapper;


	
	@Override
	public int insert(ReportVO vo, HttpServletRequest request) {

		int r = mapper.insert(vo);

		return r;
	}
	
	//관리자
	@Override
	public Map list(ReportVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<ReportVO> list = mapper.list(param); // 목록
        
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);
        
        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(param.getPage()/10.0)*10);
        int startPage = endPage - 9;
        if (endPage > totalPage) endPage = totalPage;
        boolean isPrev = startPage > 1;
        boolean isNext = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("isPrev", isPrev);
		map.put("isNext", isNext);
		return map;
	}

	@Override
	public Map<String, Object> list(ReportVO vo, int no) {
        List<ReportVO> list = mapper.detail(no); 
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
		return map;
	}

	@Override
	public List<ReportVO> list(String email) {
		List<ReportVO> list = mapper.detailList(email); 

		return list;
	}
	

}
