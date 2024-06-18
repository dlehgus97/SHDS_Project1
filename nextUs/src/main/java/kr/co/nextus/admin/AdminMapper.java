package kr.co.nextus.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;




@Mapper
public interface AdminMapper {
	List<AdminVO> list(AdminVO vo);
	AdminVO detail(AdminVO vo);
	
	int count(AdminVO vo);
	void deleteNotice(int no);
	int update(AdminVO vo);
	void insertnotice(@Param("title") String title, @Param("content") String content);

}
