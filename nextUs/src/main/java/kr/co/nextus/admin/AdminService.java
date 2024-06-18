package kr.co.nextus.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;




public interface AdminService {
	Map<String, Object> list(AdminVO vo);
	AdminVO detail(AdminVO vo, boolean isUpdate);
	void deleteNotice(int no);
	int update(AdminVO vo);
	void insertnotice(String title, String content);

}
