package kr.co.nextus.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.review.ReviewVO;


@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper mapper;

	@Override
	public Map<String, Object> list(ReviewVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<ReviewVO> list = mapper.list(param); // 목록
        
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
	public int insert(ReviewVO vo, HttpServletRequest request) {

		int r = mapper.insert(vo);

		return r;
	}
	
	@Override
	public int update(ReviewVO vo, HttpServletRequest request) {
		return mapper.update(vo);

	}
	
	@Override
	public void updateSeller(ReviewVO vo) {
		mapper.updateSeller(vo);
	}
	
	@Override
	public int updateisreview(ReviewVO vo) {
		return mapper.updateisreview(vo);

	}
	
	@Override
	public int delete(int reviewno) {
		 
		return mapper.delete(reviewno);
	}

}
