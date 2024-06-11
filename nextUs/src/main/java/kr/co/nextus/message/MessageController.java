package kr.co.nextus.message;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nextus.member.MemberVO;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService service;
	
	@GetMapping("/chat/chats.do")
	public String chatRooms(Model model, HttpSession sess) {
		//채팅 방 목록
		//memberno가 필요하다 -> 내 채팅만 가져와야 하니까
		MemberVO vo = (MemberVO)sess.getAttribute("login");
		int memberNo = vo.getNo();
		List<MessageVO> list = service.list(memberNo);
		System.out.println("list컨트롤러");
		System.out.println(list);
		model.addAttribute("list", list);
		return "/chat/chats";
	}

	@GetMapping("/chat/detail.do")
	public String chatDetail(Model model, @RequestParam(name = "chatno") int chatno, @RequestParam(name="chatMember") int chatMember) {
		//채팅 방 내의 채팅내역
		model.addAttribute("chatno", chatno);
		model.addAttribute("chatMember", chatMember);
		//채팅내역 가져와야하고
		List<MessageVO> list = service.detail(chatno);
		model.addAttribute("list", list);
		//프사 가져와야하고
		//닉네임
		//읽음처리
		model.addAttribute("sellno", list.get(0).getSellno());
		service.update(chatno);
		System.out.println(chatno+"상대방");
		return "/chat/detail";
	}
}
