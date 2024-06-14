package kr.co.nextus.sellerrequest;


import java.util.List;
import java.util.Map;


public interface SellerRequestService {

	
	//관리자 페이지에서 동작
	//그냥 리스트
	Map<String, Object> list(SellerRequestVO vo);
	Map<String, Object> list(SellerRequestVO vo, int no);
	
	int approve(SellerRequestVO vo, int memberno);
	boolean deny(SellerRequestVO vo, int no);

}
