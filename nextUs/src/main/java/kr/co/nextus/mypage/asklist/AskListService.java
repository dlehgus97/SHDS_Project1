package kr.co.nextus.mypage.asklist;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface AskListService {
//	int insert(AskListVO vo, HttpServletRequest request);
//	int reply(AskListVO vo, HttpServletRequest request);
//	int update(AskListVO vo, HttpServletRequest request);
//	int delete(AskListVO vo, HttpServletRequest request);
	Map<String, Object> list(AskListVO vo);
//	AskListVO detail(AskListVO vo, boolean isUpdate);
}
