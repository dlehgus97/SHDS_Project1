package kr.co.nextus.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface NoticeService {
	int insert(NoticeVO vo, HttpServletRequest request);
	int update(NoticeVO vo, HttpServletRequest request);
	int delete(NoticeVO vo, HttpServletRequest request);
	Map<String, Object> list(NoticeVO vo);
	NoticeVO detail(NoticeVO vo, boolean isUpdate);
}
