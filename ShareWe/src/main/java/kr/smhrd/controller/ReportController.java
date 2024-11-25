package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.report;
import kr.smhrd.mapper.C_BoardMapper;
import kr.smhrd.mapper.G_BoardMapper;
import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.mapper.ReportMapper;

@Controller
public class ReportController {

	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	private ReportMapper reportMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private G_BoardMapper g_boardMapper;

	@Autowired
	private C_BoardMapper c_boardMapper;
	
	// 신고사유 선택 페이지로 이동
	@RequestMapping("/sendReportInfo")
	public String sendReportInfo(report report, Model model) {
		
		model.addAttribute("reportMember", report);
		
		return "report";
	}

	
	// 신고한 정보를 넘기고 신고 완료 페이지로 이동
	@RequestMapping("/reportInsert")
	public String reportInsert(report report, HttpSession session) {
		
		reportMapper.reportInsert(report);
		
		// 신고 누적횟수 증가
		memberMapper.goupdateCnt(report.getEmail());

		
		return "reportSuccess";
	}
	
	
	// 신고 통과
	@RequestMapping("/passRep")
	public String passRep(@RequestParam("email") String param1, @RequestParam("b_num") int param2) {
		reportMapper.passRep(param1, param2);
		
		return "redirect:/goAdReport";
	}
	
	// 신고 게시글 삭제
	@RequestMapping("/deleteRep")
	public String deleteRep(@RequestParam("email") String param1, @RequestParam("b_num") int param2) {
		g_boardMapper.deleteRep(param1, param2);
		c_boardMapper.deleteRep(param1, param2);
		reportMapper.passRep(param1, param2);
		
		return "redirect:/goAdReport";
	}
	

}
