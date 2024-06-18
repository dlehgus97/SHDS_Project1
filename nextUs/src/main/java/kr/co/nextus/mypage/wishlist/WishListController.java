package kr.co.nextus.mypage.wishlist;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
public class WishListController {

	@Autowired
	private WishListService wishListService;
	
	@GetMapping("/mypage/wishlist.do")
	public String index(Model model, WishListVO vo, HttpSession sess) {
		MemberVO login = (MemberVO) sess.getAttribute("login");
		vo.setMemberno(login.getNo());
		model.addAttribute("wishlist", wishListService.list(vo));
		System.out.println(wishListService.list(vo));
		return "mypage/wishlist";
	}
	
	//찜 목록 페이지에서 삭제하는거
	@GetMapping("/mypage/deletewishlist.do")
	public String delete(Model model, HttpSession sess, @RequestParam("no") int sellno, WishListVO vo) {
		MemberVO login = (MemberVO)sess.getAttribute("login");
		vo.setMemberno(login.getNo());
		vo.setSellno(sellno);
		int r = wishListService.delete(vo);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "찜 목록에서 삭제되었습니다.");
			model.addAttribute("url", "/mypage/wishlist.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		return "common/alert";
	}
	
	//판매글 상세페이지에서 삭제하는거
	@PostMapping("/wishlist/delete.do")
    @ResponseBody
	public String delete(@RequestParam("memberno") int memberno, @RequestParam("sellno") int sellno, WishListVO vo) {
		vo.setMemberno(memberno);
		vo.setSellno(sellno);
		int r = wishListService.delete(vo);
		return r > 0 ? "success" : "fail";
	}
	
	//판매글 상세페이지에서 찜 추가
	@PostMapping("/wishlist/insert.do")
	@ResponseBody
	public String insert(@RequestParam("memberno") int memberno, @RequestParam("sellno") int sellno, WishListVO vo) {
		vo.setMemberno(memberno);
		vo.setSellno(sellno);
		int r = wishListService.insert(vo);
		return r > 0 ? "success" : "fail";
	}
	
}
