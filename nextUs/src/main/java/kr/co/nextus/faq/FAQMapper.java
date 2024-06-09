package kr.co.nextus.faq;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.qna.QnAVO;

@Mapper
public interface FAQMapper {
	int insert(FAQVO vo);
	List<FAQVO> list(FAQVO vo);
	FAQVO detail(FAQVO vo);
	int update(FAQVO vo);
	int delete(int no);
	int count(FAQVO vo);
}
