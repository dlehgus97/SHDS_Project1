package kr.co.nextus.event;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface EventService {
	int insert(EventVO vo, MultipartFile file, HttpServletRequest request);
	int update(EventVO vo, MultipartFile file, HttpServletRequest request);
	int delete(EventVO vo, HttpServletRequest request);
	Map<String, Object> list(EventVO vo);
	EventVO detail(EventVO vo, boolean isUpdate);
	EventVO mainBanner();
}
