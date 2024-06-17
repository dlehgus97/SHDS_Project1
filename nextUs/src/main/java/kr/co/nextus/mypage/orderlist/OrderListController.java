package kr.co.nextus.mypage.orderlist;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.event.EventVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.notice.NoticeService;
import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.selllist.SellListVO;
import kr.co.nextus.selllist.SellListService;
import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.review.ReviewService;


@Controller
public class OrderListController {

	@Autowired
	private OrderListService orderListservice;
	
	@GetMapping("/mypage/orderlist.do")
	public String index(Model model, OrderListVO vo, HttpSession sess) {
		MemberVO login = (MemberVO) sess.getAttribute("login");
		vo.setMemberno(login.getNo());
		model.addAttribute("order", orderListservice.list(vo));
		return "mypage/orderlist";
	}
	
	@GetMapping("/mypage/confirm.do")
	public String confirm(Model model, @RequestParam("no") int buyno, OrderListVO vo) {
		
		vo.setBuyno(buyno);
		int r = orderListservice.update(vo);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "구매확정이 완료되었습니다.");
			model.addAttribute("url", "/mypage/orderlist.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
	
	
}
