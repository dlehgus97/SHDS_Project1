package kr.co.nextus.sellerrequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class SellerRequestServiceImpl implements SellerRequestService {

	@Autowired
	private SellerRequestMapper mapper;

	
	//관리자페이지에서 동작
	// 리스트 출력
	@Override
	public Map list(SellerRequestVO param) {

		int count = mapper.count(param); // 총개수

        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<SellerRequestVO> list = mapper.list(param); // 목록
        
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




}
