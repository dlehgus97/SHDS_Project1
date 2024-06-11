package kr.co.nextus.coupon;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CouponController {

	@Autowired
	private CouponService service;
	
	
	
	// 관리자에서하는겁니다요
	@RequestMapping("/giveCoupon")
	public String giveCoupon() {
		return "admin/giveCoupon";
	}
	
	
	@PostMapping("/giveCoupon.do")
	public String giveCoupon(CouponVO vo, Model model) {
		model.addAttribute("coupon", service.create(vo));
		
		model.addAttribute("msg", "쿠폰이 정상적으로 발급되었습니다.");
		model.addAttribute("url", "/giveCoupon");
		return "common/alert";
	}
	
	
}
