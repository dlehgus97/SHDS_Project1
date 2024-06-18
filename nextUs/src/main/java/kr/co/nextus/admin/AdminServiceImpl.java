package kr.co.nextus.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper Mapper;
	
	
	@Override
	public Map<String, Object> list(AdminVO param) {
		int count = Mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<AdminVO> list = Mapper.list(param); // 목록
        
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
	public AdminVO detail(AdminVO vo, boolean isUpdate) {
		AdminVO data = Mapper.detail(vo);
		return data;
	}
	
	@Override
    public void deleteNotice(int no) {
       Mapper.deleteNotice(no);
    }
	
	@Override
    public void insertnotice(String title, String content) {
       Mapper.insertnotice(title, content);
    }
	
	@Override
	public int update(AdminVO vo) {
		int r = Mapper.update(vo);
		return r;
	}

}
