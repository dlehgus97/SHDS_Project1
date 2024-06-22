package kr.co.nextus.mypage.refund;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class RefundServiceImpl implements RefundService {
	
	@Autowired
	private RefundMapper mapper;


	
	@Override
	public int insert(RefundVO vo, HttpServletRequest request) {

		int r = mapper.insert(vo);

		return r;
	}
	
	@Override
	public int update(RefundVO vo) {

		int n = mapper.update(vo);

		return n;
	}
	
	
	//관리자페이지에서 동작
	@Override
	public Map<String, Object> list(RefundVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<RefundVO> list = mapper.list(param); // 목록
        
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
	
	//환불 상세정보
	@Override
	public Map<String, Object> list(RefundVO vo, int no) {
		 	List<RefundVO> list = mapper.detail(no); // 목록
	        Map<String, Object> map = new HashMap<>();
	        map.put("list", list);
			return map;
	}
	//환불해주기
	@Override
	public boolean refund(RefundVO vo) {
		boolean result1 = mapper.refund(vo.getBuyno());
		boolean result2 = mapper.refund2(vo);
		boolean result = result1 && result2;
		return result;
	}
}
