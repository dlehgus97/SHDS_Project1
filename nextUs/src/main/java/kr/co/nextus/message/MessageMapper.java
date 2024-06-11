package kr.co.nextus.message;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {
	MessageVO regist();
	List<MessageVO> list(int no);
	List<MessageVO> detail(int chatno);
	void insert(MessageVO vo);
	void delete(MessageVO vo);
	void update(int chatno);
}
