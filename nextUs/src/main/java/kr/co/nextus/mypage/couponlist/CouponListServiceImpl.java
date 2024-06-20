package kr.co.nextus.mypage.couponlist;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CouponListServiceImpl implements CouponListService {
	
	@Autowired
	private CouponListMapper mapper;

	@Override
	public List<CouponListVO> list(CouponListVO vo) {
		return mapper.list(vo); // 목록

	}
}
