package kr.co.nextus.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nextus.member.MemberVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@GetMapping("/cart/cart.do")
	public String cart(Model model, HttpServletRequest request, @RequestParam("sellno") int sellno, @RequestParam("optionno") int optionno) {
		HttpSession sess = request.getSession();
		MemberVO login = (MemberVO)sess.getAttribute("login");
		int memberno = login.getNo();
		int r = service.insert(memberno, sellno, optionno);
		List<CartVO> list = service.list(memberno, sellno, optionno);
		model.addAttribute("list",list);
		return "/cart/cart";
	}
	
	@PostMapping("/cart/delete.do")
    @ResponseBody
    public String delete(HttpServletRequest request, @RequestParam("sellno") int sellno, @RequestParam("optionno") int optionno) {
        HttpSession sess = request.getSession();
        MemberVO login = (MemberVO) sess.getAttribute("login");
        
        int memberno = login.getNo();
        
        int r = service.delete(memberno, sellno, optionno);
        return r > 0 ? "success" : "fail"; // 실험용
    }
}

