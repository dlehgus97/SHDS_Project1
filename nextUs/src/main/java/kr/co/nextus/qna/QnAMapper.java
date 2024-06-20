package kr.co.nextus.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.qna.QnAVO;

@Mapper
public interface QnAMapper {
	int insert(QnAVO vo);
	List<QnAVO> list(QnAVO vo);
	QnAVO detail(QnAVO vo);
	int update(QnAVO vo);
	int delete(int no);
	int increaseReadcnt(int no);
	int count(QnAVO vo);
	int answer(Map<String, Object> map);
	int addelete(int no);
}
