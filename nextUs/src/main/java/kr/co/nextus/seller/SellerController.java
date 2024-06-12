package kr.co.nextus.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

// HTTP 요청 처리하여 판매자 관련 작업을 수행하는 컨트롤러

@Controller
@RequestMapping("/seller")
public class SellerController {
    
    @Autowired
    private SellerService sellerService;

 // 판매자 상세 정보를 보여주는 메서드
    @GetMapping("/profile/{no}")
    public String showProfilePage(@PathVariable int no, Model model) {
        // 판매자 번호로 판매자 정보 조회
        SellerVO seller = sellerService.getSellerDetails(no);
        
        // 모델에 판매자 정보 추가
        model.addAttribute("seller", seller);
        
        // profile.jsp로 반환 (뷰의 경로)
        return "seller/profile";
    }
    
    @GetMapping("/register")
    public String showRegisterForm() {
    	// 판매자 등록 폼으로 이동
        return "seller/register";
    }

    // 판매자 등록을 처리하는 메서드
    @PostMapping("/register")
    public String registerSeller(SellerVO seller, Model model) {
        // 판매자 등록
    	boolean success = sellerService.registerSeller(seller);
        if (success) {
        	// 성공 시 성공 페이지로 리다이렉트
            return "redirect:/seller/success";
        } else {
        	// 실패 시 에러 메시지를 모델에 추가하고 등록 폼으로 이동
            model.addAttribute("error", "Seller registration failed.");
            return "seller/register";
        }
    }

    // 판매자 상세 정보를 보여주는 메서드
    @GetMapping("/detail/{no}")
    public String getSellerDetails(@PathVariable int no, Model model) {
        // 판매자 번호로 판매자 정보 조회
    	SellerVO seller = sellerService.getSellerDetails(no);
        // 모델에 판매자 정보 추가
    	model.addAttribute("seller", seller);
    	// 판매자 상세 정보 페이지로 이동
        return "seller/detail";
    }

    // 판매자 정보를 업데이트하는 메서드
    @PostMapping("/update")
    public String updateSeller(SellerVO seller, Model model) {
        // 판매자 정보 업데이트
    	boolean success = sellerService.updateSeller(seller);
        if (success) {
        	// 성공 시 성공 페이지로 리다이렉트
            return "redirect:/seller/success";
        } else {
        	// 실패 시 에러 메시지를 모델에 추가하고 상세 정보 페이지로 이동
            model.addAttribute("error", "Seller update failed.");
            return "seller/detail";
        }
    }
}