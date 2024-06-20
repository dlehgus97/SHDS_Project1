package kr.co.nextus.mypage.asklist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.qna.QnAVO;

@Mapper
public interface AskListMapper {
//	int insert(AskListVO vo);
	List<AskListVO> list(AskListVO vo);
//	AskListVO detail(AskListVO vo);
//	int update(AskListVO vo);
//	int delete(int no);
//	int increaseReadcnt(int no);
	int count(AskListVO vo);
}
