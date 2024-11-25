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
import kr.smhrd.mapper.C_BoardMapper;
import kr.smhrd.mapper.FavoriteMapper;
import kr.smhrd.mapper.G_BoardMapper;
import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.mapper.SearchMapper;

@Controller
public class HoodController {

	private static final Logger logger = LoggerFactory.getLogger(HoodController.class);

	@Autowired
	private G_BoardMapper g_boardMapper;

	@Autowired
	private C_BoardMapper c_boardMapper;

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private FavoriteMapper favoriteMapper;

	@RequestMapping("/goHood")
	public String goHood(Model model, HttpSession session) {

		member loginMember = (member) session.getAttribute("loginMember");
		String l_address = loginMember.getAddress();
		String[] addr = l_address.split(" ");
		String[] m_addr = new String[2];
		for (int i = 0; i < 2; i++) {
			m_addr[i] = addr[i];
		}
		// **시 **구 문자열
		String address = String.join(" ", m_addr);
		model.addAttribute("m_address", address);

		List<member> mem_addr = memberMapper.addrEQemail(address);
		model.addAttribute("add_email", mem_addr);

		List<g_board> gboard_list = g_boardMapper.getGBoard();
		model.addAttribute("gboard_list", gboard_list);

		List<c_board> cboard_list = c_boardMapper.getCBoard();
		model.addAttribute("cboard_list", cboard_list);

		if (loginMember != null) {
			String email = loginMember.getEmail();
			List<g_favorite> gfavorite_list = favoriteMapper.getGEmail(email);
			List<c_favorite> cfavorite_list = favoriteMapper.getCEmail(email);

			model.addAttribute("gfavorite_list", gfavorite_list);
			model.addAttribute("cfavorite_list", cfavorite_list);
		}

		return "Hood";
	}

	@RequestMapping("/gHood")
	public String gHood(Model model, HttpSession session) {
		// **시 **구 문자열
		member loginMember = (member) session.getAttribute("loginMember");
		String l_address = loginMember.getAddress();
		String[] addr = l_address.split(" ");
		String[] m_addr = new String[2];
		for (int i = 0; i < 2; i++) {
			m_addr[i] = addr[i];
		}

		String address = String.join(" ", m_addr);
		model.addAttribute("m_address", address);

		List<member> mem_addr = memberMapper.addrEQemail(address);
		model.addAttribute("add_email", mem_addr);
		// 전체게시글리스트
		List<g_board> gboard_list = g_boardMapper.getGBoard();
		model.addAttribute("gboard_list", gboard_list);

		if (loginMember != null) {
			String email = loginMember.getEmail();
			List<g_favorite> gfavorite_list = favoriteMapper.getGEmail(email);

			model.addAttribute("gfavorite_list", gfavorite_list);

		}

		return "gHood";
	}

	@RequestMapping("/cHood")
	public String cHood(Model model, HttpSession session) {

		// **시 **구 문자열
		member loginMember = (member) session.getAttribute("loginMember");
		String l_address = loginMember.getAddress();
		String[] addr = l_address.split(" ");
		String[] m_addr = new String[2];
		for (int i = 0; i < 2; i++) {
			m_addr[i] = addr[i];
		}

		String address = String.join(" ", m_addr);
		model.addAttribute("m_address", address);

		List<member> mem_addr = memberMapper.addrEQemail(address);
		model.addAttribute("add_email", mem_addr);

		// 전체게시글리스트
		List<c_board> cboard_list = c_boardMapper.getCBoard();
		model.addAttribute("cboard_list", cboard_list);

		if (loginMember != null) {
			String email = loginMember.getEmail();
			List<c_favorite> cfavorite_list = favoriteMapper.getCEmail(email);

			model.addAttribute("cfavorite_list", cfavorite_list);
		}

		return "cHood";
	}

}
