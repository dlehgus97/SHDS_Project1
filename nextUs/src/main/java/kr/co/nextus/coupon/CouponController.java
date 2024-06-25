package kr.co.nextus.coupon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.member.MemberService;
import kr.co.nextus.member.MemberVO;
import kr.co.nextus.sellerrequest.SellerRequestService;
import kr.co.nextus.sellerrequest.SellerRequestVO;

@Controller
public class CouponController {

	@Autowired
	private CouponService service;

	@Autowired
	private MemberService Memberservice;

	@Autowired
	private SellerRequestService SRservice;
	@Autowired
	private BuyListService BLservice;

	// 관리자에서하는겁니다요
	@GetMapping("/couponManagement")
	@RequestMapping("/couponManagement")
	public String couponManagement(CouponVO vo, SellerRequestVO vo2, BuyListVO vo3, Model model,
			HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if (adminLoggedIn != null && adminLoggedIn) {
			model.addAttribute("map", service.list(vo));
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
			return "admin/memberManagement/couponManagement";
		} else {
			return "common/403";
		}

	}

	@GetMapping("/giveCoupon")
	@RequestMapping("/giveCoupon")
	public String giveCoupon(MemberVO vo, SellerRequestVO vo2, BuyListVO vo3, Model model, HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if (adminLoggedIn != null && adminLoggedIn) {
			model.addAttribute("memberlist", Memberservice.listAtOnce(vo));
			model.addAttribute("SRnew", SRservice.NEW(vo2));
			model.addAttribute("STnew", BLservice.settleNEW(vo3));
			model.addAttribute("RFnew", BLservice.refundNEW(vo3));
			return "admin/memberManagement/giveCoupon";
		} else {
			return "common/403";
		}

	}

	@PostMapping("/giveCoupon.do")
	public String giveCoupon(CouponVO vo, Model model, @RequestParam List<String> memberEmails,HttpServletRequest request) {
		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if (adminLoggedIn != null && adminLoggedIn) {
			model.addAttribute("coupon", service.createCoupon(vo, memberEmails));
			model.addAttribute("msg", "쿠폰이 정상적으로 발급되었습니다.");
			model.addAttribute("url", "/giveCoupon");
			return "common/alert";
		} else {
			return "common/403";
		}
	}

	@RequestMapping("/couponMemberPopup")
	public String couponMemberPopup(CouponVO vo, Model model, @RequestParam("data") String name,
			HttpServletRequest request) {

		Boolean adminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
		if (adminLoggedIn != null && adminLoggedIn) {
			try {
				String encodedValue = URLEncoder.encode(name, "UTF-8");
				model.addAttribute("map", service.listAsName(vo, encodedValue));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "admin/memberManagement/couponMemberPopup";
		} else {
			return "common/403";
		}

	}

	// 쿠폰 리스트
	@GetMapping("/couponListToMember")
	@ResponseBody
	public List<CouponVO> couponList(HttpSession sess) {
		List<CouponVO> couponList = service.listToMember(((MemberVO) sess.getAttribute("login")).getNo());
		System.out.println(couponList);
		System.out.println("리스트불러오기");
		return couponList;
	}

}
