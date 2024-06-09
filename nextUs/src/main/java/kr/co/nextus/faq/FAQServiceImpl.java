package kr.co.nextus.faq;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	private FAQMapper mapper;
	
	@Override
	public int insert(FAQVO vo, HttpServletRequest request) {

		int r = mapper.insert(vo);

		return r;
	}
	
	@Override
	public int update(FAQVO vo, HttpServletRequest request) {
		int r = mapper.update(vo);
		return r;
	}

	@Override
	public int delete(FAQVO vo, HttpServletRequest request) {

		return mapper.delete(vo.getNo());
	}

	@Override
	public Map<String, Object> list(FAQVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<FAQVO> list = mapper.list(param); // 목록
        
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
	public FAQVO detail(FAQVO vo, boolean isUpdate) {
		FAQVO data = mapper.detail(vo);
		return data;
	}

}
