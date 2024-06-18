package kr.co.nextus.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper Mapper;
	
	
	@Override
	public List<AdminVO> Listview() {
		
		return Mapper.Listview();
	}
	
	@Override
    public void deleteNotice(int no) {
       Mapper.deleteNotice(no);
    }
	
	@Override
    public void insertnotice(String title, String content) {
       Mapper.insertnotice(title, content);
    }

}
