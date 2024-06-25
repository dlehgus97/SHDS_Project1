package kr.co.nextus.admin;

import java.util.Map;




public interface AdminService {
	Map<String, Object> list(AdminVO vo);
	AdminVO detail(AdminVO vo, boolean isUpdate);
	void deleteNotice(int no);
	int update(AdminVO vo);
	void insertnotice(String title, String content);
	
	//관리자 로그인
	AdminVO adminLogin(AdminVO vo);

}
