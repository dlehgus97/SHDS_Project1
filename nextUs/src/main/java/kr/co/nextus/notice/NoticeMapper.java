package kr.co.nextus.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.qna.QnAVO;

@Mapper
public interface NoticeMapper {
	int insert(NoticeVO vo);
	List<NoticeVO> list(NoticeVO vo);
	NoticeVO detail(NoticeVO vo);
	int update(NoticeVO vo);
	int delete(int no);
	int count(NoticeVO vo);
}
