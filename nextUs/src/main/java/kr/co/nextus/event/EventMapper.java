package kr.co.nextus.event;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.nextus.event.EventVO;

@Mapper
public interface EventMapper {
	int insert(EventVO vo);
	List<EventVO> list(EventVO vo);
	EventVO detail(EventVO vo);
	int count(EventVO vo);
	int update(EventVO vo);
	int delete(int no);
	int fileDelete(int no);
	EventVO mainBanner();
}
