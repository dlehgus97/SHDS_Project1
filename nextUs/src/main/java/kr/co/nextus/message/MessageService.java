package kr.co.nextus.message;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface MessageService {
	MessageVO regist();
	List<MessageVO> list(int no); //채팅방목록 no->memberno
	List<MessageVO> detail(int no, int myno); //채팅 내역 no -> chatno
	void insert(MessageVO vo);
	void delete(MessageVO vo);
	void update(int chatno, int opno);
	Map<Integer, Integer> getUnRead(int opno);
}
