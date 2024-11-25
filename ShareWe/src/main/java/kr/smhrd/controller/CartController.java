package kr.smhrd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

//	// 인터페이스 불러오기 - Spring
//	@Autowired
//	private MemberMapper memberMapper;

	// Main.jsp로 이동하는 메소드
	@RequestMapping("/goCart")
	public String goCart() {
		return "Cart";
	}
	
}
