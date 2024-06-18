package kr.co.nextus.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminMapper {
	List<AdminVO> Listview();

	void deleteNotice(int no);

	void insertnotice(@Param("title") String title, @Param("content") String content);

}
