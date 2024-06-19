package kr.co.nextus.payment;

import org.springframework.beans.factory.annotation.Autowired;

public class PaymentServiceImp implements PaymentService {
	
	@Autowired
	private PaymentMapper mapper;
	
	@Override
	public void insert(PaymentVO vo) {
		// TODO Auto-generated method stub
		mapper.insert(vo);
	}

	@Override
	public void couponUse(PaymentVO vo) {
		// TODO Auto-generated method stub

	}

}
