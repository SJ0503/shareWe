package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.member;
import kr.smhrd.entity.payment;
import kr.smhrd.entity.purchase;
import kr.smhrd.mapper.SubscribeMapper;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribeMapper subscribeMapper;

	// 결제완료 메소드
	@RequestMapping("/paySuccess")
	public String paySuccess(payment payment, Model model) {
		subscribeMapper.plusPaidCnt(payment);
		subscribeMapper.paySuccess(payment);
		model.addAttribute("successPay", payment);
		
		return "Payment";
	}
	
	// 기업 상품 결제완료 메소드
	@RequestMapping("/payObjectSuccess")
	public String payObjectSuccess(purchase purchase, Model model) {
		subscribeMapper.purchaseSuccess(purchase);
		model.addAttribute("successPay", purchase);
		
		return "CPayment";
	}
	
	@RequestMapping("/gopaySuccess")
	public String gopaySuccess() {
		
		return "Payment";
	}
	
	@RequestMapping("/plus")
	public String plus() {
		subscribeMapper.plusCnt();
		return "redirect:/goMain";
	}
	
	

}
