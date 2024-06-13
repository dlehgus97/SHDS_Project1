package kr.co.nextus.ban;


import java.util.List;
import java.util.Map;



public interface BanService {
	
	//관리자 페이지에서 동작
	Map<String,Object> list(BanVO vo,int isSeller);
	boolean add(BanVO vo, List<Integer> membernos);

}
