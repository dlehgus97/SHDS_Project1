package kr.co.nextus.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

@Mapper
public interface CartMapper {
	
	int insert(@Param("memberno") int memberno, @Param("sellno") int sellno, @Param("optionno") int optionno);
	List<CartVO> list(@Param("memberno") int memberno, @Param("sellno") int sellno, @Param("optionno") int optionno);
	int delete(@Param("memberno") int memberno, @Param("sellno") int sellno, @Param("optionno") int optionno);
	
}
