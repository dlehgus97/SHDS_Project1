package kr.co.nextus.coupon;

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

import kr.co.nextus.member.MemberService;
import kr.co.nextus.member.MemberVO;

@Controller
public class CouponController {

	@Autowired
	private CouponService service;

	@Autowired
	private MemberService Memberservice;

	@GetMapping("/couponManagement")
	@RequestMapping("/couponManagement")
	public String couponManagement(CouponVO vo, Model model) {
		model.addAttribute("map", service.list(vo));
		return "admin/memberManagement/couponManagement";
	}

	// 관리자에서하는겁니다요
	@GetMapping("/giveCoupon")
	@RequestMapping("/giveCoupon")
	public String giveCoupon(MemberVO vo, Model model) {
		model.addAttribute("memberlist", Memberservice.listAtOnce(vo));
		return "admin/memberManagement/giveCoupon";
	}

	@PostMapping("/giveCoupon.do")
	public String giveCoupon(CouponVO vo, Model model, @RequestParam List<String> memberEmails) {
		model.addAttribute("coupon", service.createCoupon(vo, memberEmails));

		model.addAttribute("msg", "쿠폰이 정상적으로 발급되었습니다.");
		model.addAttribute("url", "/memberManagement/giveCoupon");
		return "common/alert";
	}

	@RequestMapping("/couponMemberPopup")
	public String couponMemberPopup(CouponVO vo, Model model, @RequestParam("data") String name) {
		model.addAttribute("map", service.listAsName(vo, name));
		return "admin/memberManagement/couponMemberPopup";
	}

}
