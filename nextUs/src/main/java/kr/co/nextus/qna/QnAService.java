package kr.co.nextus.qna;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface QnAService {
	int insert(QnAVO vo);
	int reply(QnAVO vo);
	int update(QnAVO vo);
	int delete(QnAVO vo);
	Map<String, Object> list(QnAVO vo);
	QnAVO detail(QnAVO vo, boolean isUpdate);
	Map<String, Object> answer(int no, String answer);
	int addelete(int no);
;
}
