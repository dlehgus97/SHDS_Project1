package kr.co.nextus.payment;

import java.io.IOException;
import java.util.List;

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

import kr.co.nextus.cart.CartVO;

@Controller
public class PaymentController {

//	@Autowired
//	private PaymentService service;
	
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
	public String paySuccess(@RequestBody PaymentVO vo) {
//		System.out.println(vo.getFullName());
		System.out.println(vo.getPaymentId());
		return "index.do";
	}
}
