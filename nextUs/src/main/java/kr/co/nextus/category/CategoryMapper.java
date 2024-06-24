package kr.co.nextus.category;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;



@Mapper
public interface CategoryMapper {
	List<CategoryVO> list(CategoryVO vo);
}