package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.entity.g_board;
import kr.smhrd.entity.g_favorite;
import kr.smhrd.entity.member;
import kr.smhrd.entity.subscribe;
import kr.smhrd.mapper.FavoriteMapper;
import kr.smhrd.mapper.G_BoardMapper;
import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.mapper.SubscribeMapper;

@Controller
public class G_BoardController {
	
	@Autowired
	private G_BoardMapper g_boardMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private SubscribeMapper subscribeMapper;
	
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	@RequestMapping("/goShare")
	public String goShare() {
		return "Share";
	}
	
	//shop.jsp로 이동
	@RequestMapping("/goGeneral")
	public String goGeneral(Model model,HttpSession session) {
		List<g_board> gboard_list = g_boardMapper.getGBoard();
		model.addAttribute("gboard_list", gboard_list);
		
		 member loginMember = (member)session.getAttribute("loginMember");
			
		    if(loginMember != null) {
				String email = loginMember.getEmail();
				List<g_favorite> gfavorite_list = favoriteMapper.getGEmail(email);
				
				
				model.addAttribute("gfavorite_list",gfavorite_list);
			}
		
		
		return "Share";
	}
	
	@RequestMapping("/getgCategory")
	public String getgCategory(@RequestParam("category") String category, Model model, HttpSession session) {
		List<g_board> gboard_list = g_boardMapper.getgCategory(category);
		model.addAttribute("gboard_list", gboard_list);
		
		 member loginMember = (member)session.getAttribute("loginMember");
			
		    if(loginMember != null) {
				String email = loginMember.getEmail();
				List<g_favorite> gfavorite_list = favoriteMapper.getGEmail(email);
				
				
				model.addAttribute("gfavorite_list",gfavorite_list);
			}
		return "Share";
	}
	
	
	//게시글작성
	@RequestMapping("/gBoardInsert")
		public String gBoardInsert( g_board g_board, HttpSession session, HttpServletRequest request) {
		
		
		String path = request.getRealPath("resources/g_Image");
		System.out.println(path);
		int size = 720*720*10;
		String encoding = "UTF-8";
		
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		member loginMember = (member)session.getAttribute("loginMember");
		String email = loginMember.getEmail();
		String g_writer = loginMember.getNick();
	
		
		
		try {
			MultipartRequest multi= new MultipartRequest(request,path,size, encoding, rename);
			String g_title = multi.getParameter("g_title");
			String g_content = multi.getParameter("g_content");
			String g_img1 = multi.getFilesystemName("g_img1");
			String g_img2 = multi.getFilesystemName("g_img2");
			String g_img3 = multi.getFilesystemName("g_img3");
			String category = multi.getParameter("category");
//			
			
			
			g_board = new g_board(g_title,g_writer, email, g_img1,g_img2,g_img3, g_content, category);
			g_boardMapper.insertBoard(g_board);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
			return "redirect:/goGeneral";
		
	}
	
	
	//gBoardDetail 로
	
	@RequestMapping("/G_BoardContent")
	public String G_BoardContent(@RequestParam("g_num") int g_num, Model model, HttpSession session) {
		
		g_board g_board = g_boardMapper.G_BoardContent(g_num); //num값에 해당하는 하나의 게시물 가져오기
		model.addAttribute("g_board",g_board);
		
		member loginMember = (member)session.getAttribute("loginMember");
		if(loginMember != null) {
			String email = loginMember.getEmail();
			String fav = "No";
			List<g_favorite> gfavorite_list = favoriteMapper.getgFavList(email);
			for(int i = 0; i < gfavorite_list.size(); i++) {
				if(gfavorite_list.get(i).getG_num() == g_num) {
					fav = "Yes";
				}
			}
			model.addAttribute("fav", fav);
			
		}
		 
		return "gBoardDetail";
	}
	
	@RequestMapping("/chatBoardContent")
	public String chatBoardContent(@RequestParam("g_num") int g_num, Model model, HttpSession session) {
		
		g_board g_board = g_boardMapper.G_BoardContent(g_num); //num값에 해당하는 하나의 게시물 가져오기
		model.addAttribute("g_board",g_board);
		
		return "ChatBoard";
	}
	
	
	@RequestMapping("/gParticipate")
	public String gParticipate(@RequestParam("g_num") int g_num, Model model) {
		g_boardMapper.gParticipate(g_num);
		model.addAttribute("g_num", g_num);
		
		return "Chat";
	}	
	
	@RequestMapping("/goBoardUp")
	public String goBoardUp(@RequestParam("g_num") int g_num, @RequestParam("g_img1") String g_img1, @RequestParam("g_content") String g_content, Model model, HttpSession session) {
		
		member loginMember = (member)session.getAttribute("loginMember");
		subscribe subscribeInfo = subscribeMapper.getSubscribe(loginMember.getEmail());
		
		model.addAttribute("subscribeInfo", subscribeInfo);
		model.addAttribute("g_num", g_num);
		model.addAttribute("g_content", g_content);
		model.addAttribute("g_img1", g_img1);
		
		return "BoardUp";
	}
	
	@RequestMapping("/gBoardUp")
	public String gBoardUp(@RequestParam("g_num") int g_num, @RequestParam("free_cnt") int free_cnt, @RequestParam("paid_cnt") int paid_cnt, Model model, HttpSession session) {
		member loginMember = (member)session.getAttribute("loginMember");
		
		g_boardMapper.gBoardUp(g_num);
		if(free_cnt > 0) {
			subscribeMapper.useFreeCnt(loginMember.getEmail());
		}else {
			subscribeMapper.usePaidCnt(loginMember.getEmail());
		}
		
		
		return "redirect:/goGeneral";
	}	
	
	// 게시글 수정 페이지로
	@RequestMapping("/goUpdate")
	public String goUpdate(int g_num, Model model) {
		g_board g_board = g_boardMapper.G_BoardContent(g_num);
		model.addAttribute("g_board", g_board);
		
		return "UpdateGBoard";
	}
	
	// 게시글 수정
	@RequestMapping("/gBoardUpdate")
	public String gBoardUpdate(g_board g_board, Model model) {
		g_boardMapper.gBoardUpdate(g_board);
		
		return "redirect:/goGeneral";
	}
	
	// 게시글 삭제
	@RequestMapping("/deleteGBoard")
	public String deleteGBoard(@RequestParam("g_num") int g_num) {
		g_boardMapper.deleteGBoard(g_num);
		
		return "redirect:/goGeneral";
	}
	
		
}
