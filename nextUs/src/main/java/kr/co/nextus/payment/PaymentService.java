package kr.co.nextus.payment;

import org.springframework.stereotype.Service;

@Service
public interface PaymentService {
	void insert(PaymentVO vo);
	void couponUse(PaymentVO vo);
}
