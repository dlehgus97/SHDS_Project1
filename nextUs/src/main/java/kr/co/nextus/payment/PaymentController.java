package kr.co.nextus.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {

//	@Autowired
//	private PaymentService service;
	
	//결제방식 선택화면
	@GetMapping("/payment/paymentSelect")
	public String index() {
		return "paymentSelect";
	}
}
