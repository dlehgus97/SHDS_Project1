package kr.co.nextus.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

@Mapper
public interface CartMapper {
	
	int insert(@Param("memberno") int memberno, @Param("sellno") int sellno, @Param("optionno") int optionno);
//	List<CartVO> list(@Param("memberno") int memberno, @Param("sellno") int sellno, @Param("optionno") int optionno);
	int delete(@Param("memberno") int memberno, @Param("sellno") int sellno, @Param("optionno") int optionno);
	
	int check(@Param("memberno") int memberno, @Param("sellno") int sellno, @Param("optionno") int optionno); // 이미 db에 저장된 아이와 같은 아이가 잇는지 중복확인을 위한 메서드
	
	List<CartVO> list(@Param("memberno") int memberno);
	
}
