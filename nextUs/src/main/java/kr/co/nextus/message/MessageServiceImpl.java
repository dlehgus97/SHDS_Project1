package kr.co.nextus.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
	public List<MessageVO> detail(int chatno, int myno) {
		List<MessageVO> list = mapper.detail(chatno, myno);
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
	public void update(int chatno, int opno) {
		mapper.update(chatno, opno);
	}
	
	@Override
	public Map<Integer, Integer> getUnRead(int opno) {
		List<Map<String, Object>> list = mapper.getUnRead(opno);
		System.out.println(list);
		return list.stream()
	            .collect(Collectors.toMap(
	                    map -> (Integer) map.get("chatno"),
	                    map -> ((Long) map.get("unread_cnt")).intValue()
	            ));
	}
}
