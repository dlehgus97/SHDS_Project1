package kr.co.nextus.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageMapper mapper;
	
	@Override
	public MessageVO regist() {
		return null;
	}
	
	@Override
	public List<MessageVO> list(int no) {
		List<MessageVO> list = mapper.list(no);
		System.out.println("list서비스");
		System.out.println(list);
		return list;
	}
	
	@Override
	public List<MessageVO> detail(int chatno) {
		List<MessageVO> list = mapper.detail(chatno);
		return list;
	}

	@Override
	public void insert(MessageVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void delete(MessageVO vo) {
		// TODO Auto-generated method stub
	}
	
	@Override
	public void update(int chatno) {
		mapper.update(chatno);
	}

}
