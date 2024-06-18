package kr.co.nextus.admin;

import java.util.List;

public interface AdminService {
	List<AdminVO> Listview();

	void deleteNotice(int no);

	void insertnotice(String title, String content);

}
