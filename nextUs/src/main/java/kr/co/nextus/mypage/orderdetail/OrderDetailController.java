package kr.co.nextus.mypage.orderdetail;

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
public class OrderDetailController {

	@Autowired
	private OrderDetailService orderDetailservice;
	
	@GetMapping("/mypage/orderdetail.do")
	public String index(Model model, OrderDetailVO vo, @RequestParam("no") int buyno, HttpSession sess) {
		MemberVO login = (MemberVO) sess.getAttribute("login");
		vo.setMemberno(login.getNo());
		vo.setBuyno(buyno);
		model.addAttribute("order", orderDetailservice.list(vo));
		return "mypage/orderdetail";
	}
	
	
}
