package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.c_favorite;
import kr.smhrd.entity.c_subscribe;
import kr.smhrd.entity.g_favorite;
import kr.smhrd.entity.member;
import kr.smhrd.entity.purchase;
import kr.smhrd.mapper.FavoriteMapper;
import kr.smhrd.mapper.G_BoardMapper;
import kr.smhrd.mapper.MemberMapper;

@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private G_BoardMapper g_boardMapper;

	@Autowired
	private FavoriteMapper favoriteMapper;

	// Email 중복체크 ->비동기방식
	@RequestMapping("/emailCheck")
	public int emailCheck(@RequestParam("inputEmail") String inputEmail) {
		member member = memberMapper.checkEmail(inputEmail);
		if (member == null) {
			return 1;
		} else {
			return 0;
		}
	}

	@RequestMapping("/insertFavorite")
	public void insertFavorite(@RequestParam("c_num") int c_num, HttpSession session) {
		member loginMember = (member) session.getAttribute("loginMember");
		String email = loginMember.getEmail();
		c_favorite favInfo = new c_favorite(email, c_num);

		favoriteMapper.insertFavorite(favInfo);
	}

	@RequestMapping("/delFavorite")
	public void delFavorite(@RequestParam("c_num") int c_num, HttpSession session) {
		member loginMember = (member) session.getAttribute("loginMember");
		String email = loginMember.getEmail();
		c_favorite favInfo = new c_favorite(email, c_num);

		favoriteMapper.delFavorite(favInfo);
	}

	@RequestMapping("/insertgFavorite")
	public void insertgFavorite(@RequestParam("g_num") int g_num, HttpSession session) {
		member loginMember = (member) session.getAttribute("loginMember");
		String email = loginMember.getEmail();
		g_favorite favInfo = new g_favorite(email, g_num);

		favoriteMapper.insertgFavorite(favInfo);
	}

	@RequestMapping("/delgFavorite")
	public void delgFavorite(@RequestParam("g_num") int g_num, HttpSession session) {
		member loginMember = (member) session.getAttribute("loginMember");
		String email = loginMember.getEmail();
		g_favorite favInfo = new g_favorite(email, g_num);

		favoriteMapper.delgFavorite(favInfo);
	}

	@RequestMapping("/checkSub")
	public void checkSub(@RequestParam("c_name") String c_name, HttpSession session) {
		member loginMember = (member) session.getAttribute("loginMember");
		String email = loginMember.getEmail();
		c_subscribe subscribeInfo = new c_subscribe(email, c_name);

		favoriteMapper.insertSub(subscribeInfo);
	}

	@RequestMapping("/delSub")
	public void delSub(@RequestParam("c_name") String c_name, HttpSession session) {
		member loginMember = (member) session.getAttribute("loginMember");
		String email = loginMember.getEmail();
		c_subscribe subscribeInfo = new c_subscribe(email, c_name);

		favoriteMapper.delSub(subscribeInfo);
	}

	// 게시글 마감
	@RequestMapping("/endGBoard")
	public void endGBoard(@RequestParam("g_num") int g_num) {

		g_boardMapper.endGBoard(g_num);

	}

	// 게시글 마감 취소
	@RequestMapping("/restartGBoard")
	public void restartGBoard(@RequestParam("g_num") int g_num) {

		g_boardMapper.restartGBoard(g_num);

	}


}

//	// 일반 게시판 카테고리
//	@RequestMapping("/goVege")
//	public int goVege(@RequestParam("") String clickVege) {
//		List<g_board> g_boardList = g_boardMapper.getVege(clickVege);
//		
//	}
