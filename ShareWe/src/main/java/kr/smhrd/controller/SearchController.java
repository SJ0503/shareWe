package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import kr.smhrd.mapper.FavoriteMapper;
import kr.smhrd.mapper.SearchMapper;

@Controller
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	private SearchMapper searchMapper;
	
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	@RequestMapping("/goSearch")
	public String goSearch(HttpServletRequest request, Model model,HttpSession session) {
		String searchText = request.getParameter("searchText");
		model.addAttribute("searchText", searchText);
		
		List<g_board> gboard_list = searchMapper.gSearch(searchText);
	    model.addAttribute("gboard_list", gboard_list);
	    List<c_board> cboard_list = searchMapper.cSearch(searchText);
	    model.addAttribute("cboard_list", cboard_list);
	    
	    member loginMember = (member)session.getAttribute("loginMember");
		
	    if(loginMember != null) {
			String email = loginMember.getEmail();
			List<g_favorite> gfavorite_list = favoriteMapper.getGEmail(email);
			List<c_favorite> cfavorite_list = favoriteMapper.getCEmail(email);
			
			
			model.addAttribute("gfavorite_list",gfavorite_list);
			model.addAttribute("cfavorite_list",cfavorite_list);
		}

	    return "Search";
	}
	
	@RequestMapping("/gSearch")
	public String gSearch(@RequestParam("searchText") String searchText, Model model) {
		List<g_board> gboard_list = searchMapper.gSearch(searchText);
	    model.addAttribute("gboard_list", gboard_list);
	    
	    

	    return "Share";
	}
	
	@RequestMapping("/cSearch")
	public String cSearch(@RequestParam("searchText") String searchText, Model model) {
		List<c_board> cboard_list = searchMapper.cSearch(searchText);
		model.addAttribute("cboard_list", cboard_list);
		
		return "Shop";
	}
	
}
