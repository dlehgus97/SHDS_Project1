package kr.co.nextus.ban;


import java.util.Map;


public interface BanService {
	
	//관리자 페이지에서 동작
	Map<String,Object> list(BanVO vo);

	boolean add(BanVO vo);

}
