package kr.co.nextus.selllist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.event.EventVO;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.mypage.wishlist.WishListService;
import kr.co.nextus.mypage.wishlist.WishListVO;
import kr.co.nextus.notice.NoticeVO;
import kr.co.nextus.selllist.SellListVO;
import kr.co.nextus.selllist.SellListService;
import kr.co.nextus.review.ReviewVO;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;
import kr.co.nextus.review.ReviewService;


@Controller
public class SellListController {

	@Autowired
	private SellListService sellListService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private WishListService wishListService;
	@Autowired
	private SellerRequestService SRservice;
	@Autowired
	private BuyListService BLservice;
	
	@GetMapping("/selllist/index.do")
	public String list(Model model, HttpSession sess, @RequestParam("categoryno")int categoryno, SellListVO vo) {
		vo.setCategoryno(categoryno);
		vo.setDepth(2);
		vo.setValue(1);
		Map<String, Object> list = sellListService.list(vo);
		String categoryname = sellListService.categoryname(categoryno);
		model.addAttribute("vo", list);
		model.addAttribute("categoryname", categoryname);
		return "/selllist/index";
	}

	@GetMapping("/selllist/view.do")
	public String detail(Model model, HttpSession sess, @RequestParam("sellno") int sellno, SellListVO vo, ReviewVO rvo, WishListVO wvo) {
		MemberVO login = (MemberVO) sess.getAttribute("login");
		rvo.setSellno(sellno);
		vo.setSellno(sellno);
		wvo.setSellno(sellno);
		
		if(login == null) {
			vo.setLoginno(0);
			wvo.setMemberno(0);
		} else {
			vo.setLoginno(login.getNo());
			wvo.setMemberno(login.getNo());
		}

		SellListVO detail = sellListService.detail(vo);
		
		model.addAttribute("vo", detail);
		model.addAttribute("relation", sellListService.relation(vo));
		model.addAttribute("review", reviewService.list(rvo));
		model.addAttribute("iswishlist", wishListService.count(wvo));
		return "/selllist/view";
	}
	
    @GetMapping("/selllistRegister")
    public String selllistRegisterForm(HttpSession session, Model model) {
        MemberVO login = (MemberVO) session.getAttribute("login");
        if (login == null || login.getSeller() != 1) {
            // 로그인되지 않았거나 판매자가 아닌 경우 접근 불가
            model.addAttribute("msg", "접근 권한이 없습니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        }
        // 판매글 등록 폼으로 이동
        model.addAttribute("sellListVO", new SellListVO());
        return "seller/selllistRegister";
    }
	
    @PostMapping("/selllistRegister")
    public String registSellList(@ModelAttribute SellListVO sellListVO,
                                 @RequestParam("file") MultipartFile file,
                                 HttpSession sess, Model model, HttpServletRequest request) {
        MemberVO login = (MemberVO) sess.getAttribute("login");
        if (login == null || login.getSeller() != 1) {
            // 로그인되지 않았거나 판매자가 아닌 경우 접근 불가
            model.addAttribute("msg", "접근 권한이 없습니다.");
            model.addAttribute("url", "/member/login.do");
            return "common/alert";
        }

        int sellerNo = login.getNo(); // 로그인된 판매자의 번호
        sellListVO.setSeller(sellerNo);

        // SellListService를 통해 판매글 등록 로직 수행
        sellListService.insertSellList(sellListVO, file, request);

        return "redirect:/seller/selllistManagement";
    }
	
	
	
	//관리자
//	@GetMapping("/productManagement.do")
//	public String List(SellListVO vo, Model model) {
//		model.addAttribute("selllist", sellListService.index(vo));
//		return "admin/productManagement/productManagement";
//	}
	
	// 관리자						
	@RequestMapping("/productManagement")						
	public String productManagement(SellListVO vo, SellerRequestVO vo2,BuyListVO vo3, Model model,HttpServletRequest request) {	
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if(adminLoggedIn!= null && adminLoggedIn) {
			model.addAttribute("selllist", sellListService.index(vo));					
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));					
			return "admin/productManagement/productManagement";	
		}else {
			return "common/403";
		}

						
	}						
							
	// 판매글삭제						
	@RequestMapping(value = "/deleteSelllist/{sellno}", method = RequestMethod.POST)						
	@ResponseBody						
	public String deleteSelllist(@PathVariable("sellno") int sellno) {
		try {					
			sellListService.deleteSelllist(sellno);				
			return "success"; // 성공 시 success 문자열 반환				
		} catch (Exception e) {					
			return "error"; // 실패 시 error 문자열 반환				
		}					
							
	}						

	
	
}
