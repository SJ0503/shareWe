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

import kr.smhrd.entity.c_board;
import kr.smhrd.entity.c_favorite;
import kr.smhrd.entity.c_subscribe;
import kr.smhrd.entity.g_favorite;
import kr.smhrd.entity.member;
import kr.smhrd.entity.review;
import kr.smhrd.entity.subscribe;
import kr.smhrd.mapper.C_BoardMapper;
import kr.smhrd.mapper.FavoriteMapper;
import kr.smhrd.mapper.MemberMapper;

@Controller
public class C_BoardController {
	
	@Autowired
	private C_BoardMapper c_boardMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	@RequestMapping("/goShop")
	public String goShop() {
		return "Shop";
	}

	
	@RequestMapping("/goCompany")
	public String goGeneral(Model model, HttpSession session) {
		List<c_board> cboard_list = c_boardMapper.getCBoard();
		model.addAttribute("cboard_list", cboard_list);
		
		member loginMember = (member)session.getAttribute("loginMember");
		
	    if(loginMember != null) {
			String email = loginMember.getEmail();
			List<c_favorite> cfavorite_list = favoriteMapper.getCEmail(email);
			
			
			model.addAttribute("cfavorite_list",cfavorite_list);
		}
		
		return "Shop";
	}
	
	@RequestMapping("/getComCategory")
	public String getComCategory(@RequestParam("category") String category, Model model) {
		List<c_board> cboard_list = c_boardMapper.getComCategory(category);
		model.addAttribute("cboard_list", cboard_list);
		
		
		return "Shop";
	}
	
	@RequestMapping("/cBoardInsert")
	public String cBoardInsert(c_board c_board, HttpSession session, HttpServletRequest request) {
		
		String path = request.getRealPath("resources/g_Image");
		System.out.println(path);
		int size = 720*720*10;
		String encoding = "UTF-8";
		
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		try {
			
			MultipartRequest multi = new MultipartRequest(request, path, size, encoding, rename);
			multi.getFilesystemName("c_img1");
			multi.getFilesystemName("c_img2");
			multi.getFilesystemName("c_img3");
			
			System.out.println("[/cBoardInsert]: "+c_board);
			
		} catch (IOException e) {
			e.printStackTrace();
		}c_boardMapper.cBoardInsert(c_board);
		
		
		
		return "redirect:/goCompany";
		
	}
		
	
	@RequestMapping("/C_BoardContent")
	public String C_BoardContent(@RequestParam("c_num") int c_num, @RequestParam("c_writer") String c_writer, Model model, HttpSession session) {
		
		c_board c_board = c_boardMapper.C_BoardContent(c_num); //num값에 해당하는 하나의 게시물 가져오기
		model.addAttribute("c_board",c_board);
		String[] option = c_board.getC_opt1().split("\n"); 
		String[] price = c_board.getPrice().split("\n");
		
		model.addAttribute("option", option);
		model.addAttribute("price", price);
		
		member m_addr = memberMapper.C_BoardMap(c_writer);
		model.addAttribute("m_addr",m_addr);
		
		List<review> review_list = c_boardMapper.getReview(c_num);
		model.addAttribute("review_list", review_list);
		
		member loginMember = (member) session.getAttribute("loginMember");
		if(loginMember != null) {
			String email = loginMember.getEmail();
			
			List<c_favorite> favorite_list = favoriteMapper.getFavList(email);
			String fav = "No";
			for(int i = 0; i < favorite_list.size(); i++) {
				if(favorite_list.get(i).getC_num() == c_num) {
					fav = "Yes";
				}
			}
			model.addAttribute("fav", fav);
			
			List<c_subscribe> sub_list = favoriteMapper.getSubList(email);
			String com = c_board.getC_writer();
			String sub = "No";
			for(int i = 0; i < sub_list.size(); i++) {
				if(sub_list.get(i).getC_name().equals(com)) {
					sub = "Yes";
				}
			}
			model.addAttribute("sub", sub);
		}
		
		if(review_list.size() > 0) {
			double sum = 0;
			
			for(int i = 0; i < review_list.size(); i++) {
				sum += review_list.get(i).getR_score();
			}
			double scoreDAvg = sum/review_list.size();
			scoreDAvg = Math.round(scoreDAvg * 100) / 100.0;
			model.addAttribute("scoreDAvg", scoreDAvg);
			
			int scoreAvg = (int) Math.round(scoreDAvg);
			model.addAttribute("scoreAvg", scoreAvg);
		}
		
		return "cBoardDetail";
	}
	
	@RequestMapping("/cParticipate")
	public String cParticipate(@RequestParam("c_num") int c_num) {
		c_boardMapper.cParticipate(c_num);
		
		return "redirect:/goMain";
	}
	
	// 게시글 삭제
	@RequestMapping("/deleteCBoard")
	public String deleteCBoard(@RequestParam("c_num") int c_num) {
		c_boardMapper.deleteCBoard(c_num);
		
		return "redirect:/goCompany";
	}
	
	// 게시글 수정 페이지로
	@RequestMapping("/goCUpdate")
	public String goCUpdate(int c_num, Model model) {
		c_board c_board = c_boardMapper.C_BoardContent(c_num);
		model.addAttribute("c_board", c_board);
		
		return "UpdateCBoard";
	}
	
	// 게시글 수정
	@RequestMapping("/cBoardUpdate")
	public String cBoardUpdate(c_board c_board, Model model, HttpServletRequest request) {
		
		System.out.println("[/cBoardUpdate]: "+c_board);
		
		String path = request.getRealPath("resources/g_Image");
		System.out.println(path);
		int size = 720*720*10;
		String encoding = "UTF-8";
		
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		try {
			
			MultipartRequest multi = new MultipartRequest(request, path, size, encoding, rename);
			String c_img1 = multi.getFilesystemName("c_img1");
			String c_img2 = multi.getFilesystemName("c_img2");
			String c_img3 = multi.getFilesystemName("c_img3");
			
			
			System.out.println("[/cBoardUpdate]: "+c_img1+" | "+c_img2+ " | "+ c_img3);
			
			
		} catch (IOException e) {
			e.printStackTrace();
			
			
		}
		if(c_board.getC_img1().equals("") || c_board.getC_img2().equals("") || c_board.getC_img3().equals("") ) {
			c_boardMapper.cBoardUpdate2(c_board);
		}else {
			c_boardMapper.cBoardUpdate(c_board);
		}
		
		
		
		return "redirect:/goCompany";
	}
	
	// 리뷰 작성 페이지 이동
	@RequestMapping("/writeReview")
	public String writeReview(int c_num, Model model) {
		c_board c_board = c_boardMapper.C_BoardContent(c_num);
		List<review> review_list = c_boardMapper.getReview(c_num);
		
		model.addAttribute("review_list", review_list);
		model.addAttribute("c_board", c_board);
		
		if(review_list.size() > 0) {
			double sum = 0;
			
			for(int i = 0; i < review_list.size(); i++) {
				sum += review_list.get(i).getR_score();
			}
			double scoreDAvg = sum/review_list.size();
			scoreDAvg = Math.round(scoreDAvg * 100) / 100.0;
			model.addAttribute("scoreDAvg", scoreDAvg);
			
			int scoreAvg = (int) Math.round(scoreDAvg);
			model.addAttribute("scoreAvg", scoreAvg);
		}
		
		return "Review";
	}
	
	// 리뷰 작성
	@RequestMapping("/insertReview")
	public String insertReview(review review, Model model) {
		c_boardMapper.insertReview(review);
		
		int c_num = review.getC_num();
		c_board c_board = c_boardMapper.C_BoardContent(c_num);
		List<review> review_list = c_boardMapper.getReview(c_num);
		
		model.addAttribute("review_list", review_list);
		model.addAttribute("c_board", c_board);
		
		if(review_list.size() > 0) {
			double sum = 0;
			
			for(int i = 0; i < review_list.size(); i++) {
				sum += review_list.get(i).getR_score();
			}
			double scoreDAvg = sum/review_list.size();
			scoreDAvg = Math.round(scoreDAvg * 100) / 100.0;
			model.addAttribute("scoreDAvg", scoreDAvg);
			
			int scoreAvg = (int) Math.round(scoreDAvg);
			model.addAttribute("scoreAvg", scoreAvg);
		}
		
		return "Review";
	}
	
	// 리뷰 작성
	@RequestMapping("/buyProduct")
	public String buyProduct(HttpServletRequest request, Model model) {
		int index = (int) request.getAttribute("opIndex");
		int c_num = (int) request.getAttribute("c_num");
		
		c_board c_board = c_boardMapper.C_BoardContent(c_num);
		String[] optList = c_board.getC_opt1().split("\n");
		String[] priceList = c_board.getPrice().split("\n");
		
		
		return "Review";
	}
	
	
	}
	
	
	
	
	
	

		
	


