package kr.co.nextus.message;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MessageMapper {
	MessageVO regist();
	List<MessageVO> list(int no);
	List<MessageVO> detail(@Param("chatno") int chatno, @Param("myno") int myno);
	void insert(MessageVO vo);
	void delete(MessageVO vo);
	List<Map<String, Object>> getUnRead(@Param("opno")int opno);
	void update(@Param("chatno")int chatno, @Param("opno")int opno);
}
