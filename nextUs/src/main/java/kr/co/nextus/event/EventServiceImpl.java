package kr.co.nextus.event;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventMapper mapper;
	
	@Override
	public int insert(EventVO vo, MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			// 파일명
			String org = file.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = System.currentTimeMillis()+ext;
			// 파일저장
			String path = request.getRealPath("/upload/board/")+real;
			try {
				file.transferTo(new File(path));
			} catch (Exception e) {}
			vo.setThumbnail_org(org);
			vo.setThumbnail_real(real);
		}
		int r = mapper.insert(vo);
		return r;
	}
	
	@Override
	public int update(EventVO vo, MultipartFile file, HttpServletRequest request) {
		if ("ok".equals(request.getParameter("fileDelete"))) {
			EventVO data = mapper.detail(vo);
			mapper.fileDelete(vo.getNo());
			File f = new File(request.getRealPath("/upload/board/")+data.getThumbnail_real());
			f.delete();
		}
		if (!file.isEmpty()) {
			// 파일명
			String org = file.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = System.currentTimeMillis()+ext;
			// 파일저장
			String path = request.getRealPath("/upload/board/")+real;
			try {
				file.transferTo(new File(path));
			} catch (Exception e) {}
			vo.setThumbnail_org(org);
			vo.setThumbnail_real(real);
		}
		int r = mapper.update(vo);
		return r;
	}

	@Override
	public int delete(EventVO vo, HttpServletRequest request) {
		EventVO data = mapper.detail(vo);
		if (data.getThumbnail_real() != null && !"".equals(data.getThumbnail_real())) {
			File f = new File(request.getRealPath("/upload/board/")+data.getThumbnail_real());
			f.delete();
		}
		return mapper.delete(vo.getNo());
	}

	@Override
	public Map<String, Object> list(EventVO param) {
		int count = mapper.count(param); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<EventVO> list = mapper.list(param); // 목록
        
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
	public EventVO detail(EventVO vo, boolean isUpdate) {
		EventVO data = mapper.detail(vo);
		return data;
	}
	
	@Override
	public EventVO mainBanner() {
		EventVO data = mapper.mainBanner();
		return data;
	}
}
