package kr.co.nextus.qna;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface QnAService {
	int insert(QnAVO vo, HttpServletRequest request);
	int reply(QnAVO vo, HttpServletRequest request);
	int update(QnAVO vo, HttpServletRequest request);
	int delete(QnAVO vo, HttpServletRequest request);
	Map<String, Object> list(QnAVO vo);
	QnAVO detail(QnAVO vo, boolean isUpdate);
}
