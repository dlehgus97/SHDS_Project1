package kr.co.nextus.mypage.couponlist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface CouponListService {

	List<CouponListVO> list(CouponListVO vo);

}
