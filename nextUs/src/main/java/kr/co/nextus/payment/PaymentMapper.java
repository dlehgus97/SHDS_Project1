package kr.co.nextus.payment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
	void insert(PaymentVO vo);
}
