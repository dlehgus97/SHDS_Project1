package kr.co.nextus.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.io.ContentReference;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.nextus.buylist.BuyListService;
import kr.co.nextus.buylist.BuyListVO;
import kr.co.nextus.cart.CartService;
import kr.co.nextus.cart.CartVO;
import kr.co.nextus.coupon.CouponService;
import kr.co.nextus.member.MemberVO;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService service;
	
	@Autowired
	private BuyListService bService;
	
	@Autowired
	private CouponService cService;
	
	@Autowired
	private CartService cartService;
	
	//결제방식 선택화면
	@GetMapping("/payment/paymentSelect")
	public String index() {
		return "paymentSelect";
	}
	
	@PostMapping("/payment/paymentSelect")
    public String saveSelectedProducts(@RequestParam("selectedProducts") String selectedProductsJson, Model model) {
        ObjectMapper objectMapper = new ObjectMapper();
        List<CartVO> selectedProducts = null;
        try {
            selectedProducts = objectMapper.readValue(selectedProductsJson, new TypeReference<List<CartVO>>(){});
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        model.addAttribute("selectedProducts", selectedProducts);
        System.out.println(selectedProducts);
        return "paymentSelect";
    }
	
	@PostMapping("/payment/paySuccess")
	@ResponseBody
	public void paySuccess(@RequestBody List<BuyListVO> vos) {
		//구매기록 insert
		bService.insert(vos);
		int couponNo = vos.get(0).getCouponNo();
		//쿠폰사용처리
		cService.useCoupon(couponNo);
		//장바구니에서 제거
		cartService.delList(vos);
	}
}
