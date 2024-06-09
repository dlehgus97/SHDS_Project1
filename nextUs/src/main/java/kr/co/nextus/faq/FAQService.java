package kr.co.nextus.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FAQService {
	int insert(FAQVO vo, HttpServletRequest request);
	int update(FAQVO vo, HttpServletRequest request);
	int delete(FAQVO vo, HttpServletRequest request);
	Map<String, Object> list(FAQVO vo);
	FAQVO detail(FAQVO vo, boolean isUpdate);
}
