package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.c_board;
import kr.smhrd.entity.c_favorite;
import kr.smhrd.entity.g_board;
import kr.smhrd.entity.g_favorite;
import kr.smhrd.entity.member;
import kr.smhrd.entity.payment;
import kr.smhrd.entity.purchase;
import kr.smhrd.entity.review;
import kr.smhrd.entity.subscribe;
import kr.smhrd.mapper.C_BoardMapper;
import kr.smhrd.mapper.FavoriteMapper;
import kr.smhrd.mapper.G_BoardMapper;
import kr.smhrd.mapper.MemberMapper;

@Controller
public class WebController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private G_BoardMapper g_boardMapper;
	
	@Autowired
	private C_BoardMapper c_boardMapper;
	
	@Autowired
	private FavoriteMapper favoriteMapper;

	
	private static final Logger logger = LoggerFactory.getLogger(WebController.class);
	
	// Main.jsp로 이동하는 메소드
		@RequestMapping("/")
		public String main(Model model,HttpSession session) {
			
			List<g_board> gboard_list = g_boardMapper.getGBoard();
		    model.addAttribute("gboard_list", gboard_list);
		    List<c_board> cboard_list = c_boardMapper.getCBoard();
		    model.addAttribute("cboard_list", cboard_list);
		    
		
		    
			return "Main";
		}

		@RequestMapping("/goMain")
		public String goMain(Model model,HttpSession session) {
			
			List<g_board> gboard_list = g_boardMapper.getGBoard();
		    model.addAttribute("gboard_list", gboard_list);
		    List<c_board> cboard_list = c_boardMapper.getCBoard();
		    model.addAttribute("cboard_list", cboard_list);
		   
		    member loginMember = (member)session.getAttribute("loginMember");
			
		    if(loginMember != null) {
				String email = loginMember.getEmail();
				List<g_favorite> gfavorite_list = favoriteMapper.getGEmail(email);
				List<c_favorite> cfavorite_list = favoriteMapper.getCEmail(email);
				
				
				model.addAttribute("gfavorite_list",gfavorite_list);
				model.addAttribute("cfavorite_list",cfavorite_list);
			}
		
			
			
			return "Main";
		}

	@RequestMapping("/goLogin")
	public String goLogin() {
		return "Login";
	}

	@RequestMapping("/goMemberType")
	public String goMemberType() {
		return "MemberType";
	}

	@RequestMapping("/goJoin")
	public String goJoin(@RequestParam("type") String type, Model model) {
		model.addAttribute("type", type);
		return "Join";
	}
	
	
	@RequestMapping("/gogBoard")
	public String gogBoard( HttpSession session) {
		member loginMember = (member)session.getAttribute("loginMember");
		
		if(loginMember !=null) {
			return "gBoard";
		}else {
			
		}return "Login";
	
	}
	

	@RequestMapping("/gocBoard")
	public String gocBoard() {
		return "cBoard";
	}
	
	@RequestMapping("/goAdmin")
	public String goAdmin() {
		return "AdminPage";
	}	

	
	@RequestMapping("/goUpdateMember")
	public String goUpdateMember(HttpSession session) {
		member loginMember = (member)session.getAttribute("loginMember");
		if(loginMember !=null) {
			return "UpdateMember";
		}else {
			
		}return "Login";
	}
	
	
	@RequestMapping("/goGDetail")
	public String goGDetail() {
		return "gBoardDetail";
	}
	
	@RequestMapping("/goMyPage")
	public String goMyPage(Model model, HttpSession session) {
		
		if(session.getAttribute("loginMember") != null) {
			member loginMember = (member)session.getAttribute("loginMember");
			
			if(loginMember.getType() == 2 || loginMember.getType() == 3 ) {
				
				List<g_board> gboard_list = g_boardMapper.getGEmail(loginMember.getEmail());
				model.addAttribute("gboard_list", gboard_list);
				
//				자신이한 g찜과 모든g리스트비교
				List<g_board> allG_list = g_boardMapper.getGBoard();
				model.addAttribute("allG_list", allG_list);
				List<g_favorite> Gfv_list = favoriteMapper.getGEmail(loginMember.getEmail());
				model.addAttribute("Gfv_list", Gfv_list);
				
				List<c_board> allC_list = c_boardMapper.getCBoard();
				model.addAttribute("allC_list", allC_list);
				List<c_favorite> Cfv_list = favoriteMapper.getCEmail(loginMember.getEmail());
				model.addAttribute("Cfv_list", Cfv_list);
				List<review> review_list = c_boardMapper.getMyReview(loginMember.getEmail());
				model.addAttribute("review_list", review_list);
				
				List<purchase> purchase_list = memberMapper.getPurchase(loginMember.getEmail());
				model.addAttribute("purchase_list", purchase_list);
				
				subscribe sub_list = memberMapper.getSub(loginMember.getEmail());
				model.addAttribute("sub_list", sub_list);
			
			}else if (loginMember.getType() == 1){
				
				List<c_board> cboard_list = c_boardMapper.getCEmail(loginMember.getEmail());
				model.addAttribute("cboard_list", cboard_list);
//				자신이한 c찜과 모든c리스트비교

				List<c_board> allC_list = c_boardMapper.getCBoard();
				model.addAttribute("allC_list", allC_list);
				List<c_favorite> Cfv_list = favoriteMapper.getCEmail(loginMember.getEmail());
				model.addAttribute("Cfv_list", Cfv_list);
				
//				자신이한 g찜과 모든g리스트비교
				List<g_board> allG_list = g_boardMapper.getGBoard();
				model.addAttribute("allG_list", allG_list);
				List<g_favorite> Gfv_list = favoriteMapper.getGEmail(loginMember.getEmail());
				model.addAttribute("Gfv_list", Gfv_list);
				
				List<purchase> sell_list = memberMapper.getSel(loginMember.getEmail());
				model.addAttribute("purchase_list", sell_list);
				
			}
			return "myPage";
		}else {
			return "Login";
		}
		
	}
	
	@RequestMapping("/goSubscribe")
	public String goSubscribe() {
		return "Subscribe";
	}
	
	@RequestMapping("/getCategory")
	public String getCategory(@RequestParam("category") String category, Model model,HttpSession session) {
		List<g_board> gboard_list = g_boardMapper.getgCategory(category);
		List<c_board> cboard_list = c_boardMapper.getComCategory(category);
		
		model.addAttribute("category", category);
		model.addAttribute("gboard_list", gboard_list);
		model.addAttribute("cboard_list", cboard_list);
		
		 member loginMember = (member)session.getAttribute("loginMember");
			
		    if(loginMember != null) {
				String email = loginMember.getEmail();
				List<g_favorite> gfavorite_list = favoriteMapper.getGEmail(email);
				List<c_favorite> cfavorite_list = favoriteMapper.getCEmail(email);
				
				
				model.addAttribute("gfavorite_list",gfavorite_list);
				model.addAttribute("cfavorite_list",cfavorite_list);
			}
		
		return "AllCategory";
	}
	
	@RequestMapping("/goChat")
	public String goChat() {
		return "chat-ws";
	}

}
