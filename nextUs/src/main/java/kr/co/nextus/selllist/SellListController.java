package kr.co.nextus.selllist;

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
import kr.co.nextus.mypage.wishlist.WishListService;
import kr.co.nextus.mypage.wishlist.WishListVO;
import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.selllist.SellListVO;
import kr.co.nextus.selllist.SellListService;
import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.review.ReviewService;


@Controller
public class SellListController {

	@Autowired
	private SellListService sellListService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private WishListService wishListService;
	
	
	@GetMapping("/selllist/view.do")
	public String detail(Model model, HttpSession sess, @RequestParam("no") int no, ReviewVO vo, WishListVO wvo) {
		MemberVO login = (MemberVO) sess.getAttribute("login");
		vo.setNo(no);
		wvo.setSellno(no);
		wvo.setMemberno(login.getNo());
		SellListVO detail = sellListService.detail(no);
		
		
		model.addAttribute("vo", detail);
		model.addAttribute("review", reviewService.list(vo));
		model.addAttribute("iswishlist", wishListService.count(wvo));
		return "/selllist/view";
	}
	
	
	//관리자
//	@GetMapping("/productManagement.do")
//	public String List(SellListVO vo, Model model) {
//		model.addAttribute("selllist", sellListService.index(vo));
//		return "admin/productManagement/productManagement";
//	}
	@RequestMapping("/productManagement")
	public String productManagement(SellListVO vo, Model model) {
		model.addAttribute("selllist", sellListService.index(vo));
		return "admin/productManagement/productManagement";
	}
	
}
