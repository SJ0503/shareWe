package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.payment;
import kr.smhrd.entity.purchase;
import kr.smhrd.entity.subscribe;

@Mapper
public interface SubscribeMapper {

	public void insertSubscribe(String email);
	
	public subscribe getSubscribe(String email);

	public void useFreeCnt(String email);

	public void usePaidCnt(String email);

	public void paySuccess(payment payment);
	
	public void purchaseSuccess(purchase purchase);

	public void plusPaidCnt(payment payment);

	public void plusCnt();

}
