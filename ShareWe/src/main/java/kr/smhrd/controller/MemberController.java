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

import kr.smhrd.entity.approve;
import kr.smhrd.entity.member;
import kr.smhrd.entity.purchase;
import kr.smhrd.entity.report;
//import kr.smhrd.entity.Message;
import kr.smhrd.mapper.MemberMapper;
//import kr.smhrd.mapper.MessageMapper;
import kr.smhrd.mapper.SubscribeMapper;

// Handler Mapping이 Controller를 찾기위해 @(Annotation)으로 Controller라고 명시해야 함
// servlet-context.xml 파일에 어떤 패키지에서 Controller를 찾을건지 명시
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

//	// 인터페이스 불러오기 - Spring
	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private SubscribeMapper subscribeMapper;

	// 회원가입하는 메소드 /memberInsert
	@RequestMapping("/memberInsert")
	public String memberInsert(member member, Model model) {
		System.out.println(member.toString());
		if (member.getType() == 1) {
			memberMapper.approveInsert(member);
			model.addAttribute("joinMember", member);
		} else {
			memberMapper.memberInsert(member);
			model.addAttribute("joinMember", member);
			// 구독 테이블에도 등록
			subscribeMapper.insertSubscribe(member.getEmail());
		}

		return "JoinSuccess";
	}

	// 로그인 메소드
	@RequestMapping("/memberCheck")
	public String memberSelect(member member, HttpSession session, Model model) {

		member loginMember = memberMapper.memberCheck(member);
		if (loginMember == null) {
			model.addAttribute("fail", "fail");

			return "Login";
		} else {
			session.setAttribute("loginMember", loginMember);

			return "redirect:/goMain";
		}
	}

	// 카카오로그인 메소드
	@RequestMapping("/memberCheck2")
	public String memberSelect2(member member, HttpSession session, Model model) {

		member loginMember = memberMapper.memberCheck2(member);
		if (loginMember == null) {
			model.addAttribute("fail", "fail");

			return "Login";
		} else {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/goMain";
		}
	}

	// 로그아웃 메소드
	@RequestMapping("/memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/goMain";
	}

	// 기업회원 승인페이지 불러오는 메소드
	@RequestMapping("/goAdApprove")
	public String goAdApprove(Model model) {
		List<approve> adApprove = memberMapper.goAdApprove();
		model.addAttribute("adApprove", adApprove);
		return "AdApprove";
	}

	@RequestMapping("/approveComplete")
	public String approveComplete(@RequestParam("email") String email) {
		approve approveMem = memberMapper.getApprove(email);
		memberMapper.approveMemInsert(approveMem);
		memberMapper.delApprove(email);

		return "redirect:/goAdApprove";
	}

	// 회원 관리 페이지로 이동, 모든 회원정보를 불러오는 메소드
	@RequestMapping("/goAdMember")
	public String goAdMember(Model model) {
		List<member> adMember = memberMapper.goAdMember();
		model.addAttribute("adMember", adMember);
		return "AdMember";
	}

	// 신고회원 관리 페이지로 이동
	@RequestMapping("/goAdReport")
	public String goAdReport(Model model) {
		List<report> adReport = memberMapper.goAdReport();
		model.addAttribute("adReport", adReport);
		return "AdReport";
	}

	// 회원정보 수정 메소드 /memberUpdate
	@RequestMapping("/memberUpdate")
	public String memberUpdate(member member, HttpSession session) {
		memberMapper.memberUpdate(member);
		// 세션에 저장된 값도 업데이트
		session.setAttribute("loginMember", member);
		return "myPage";
	}

	// 닉네임 수정 메소드
	@RequestMapping("/UpdateNick")
	public String updateNick(member member, HttpSession session) {
		memberMapper.updateNick(member);
		session.setAttribute("loginMember", member);
		return "myPage";
	}

	// 회원 탈퇴(일반회원)
	@RequestMapping("/goDeleteMember")
	public String goDeleteMember() {
		return "DeleteMember";
	}

	// 회원 탈퇴(카카오 회원)
	@RequestMapping("/goDeleteKakao")
	public String goDeleteKakao(member member, HttpSession session, Model model) {

		member loginMember = memberMapper.goDeleteKakao(member);
		if (loginMember == null) {
			model.addAttribute("fail", "fail");

			return "DeleteMember";
		} else {
			session.setAttribute("loginMember", loginMember);
			return "ReallyDelete";
		}
	}

	// 회원 탈퇴 다시 물어봄
	@RequestMapping("/goReallyDelete")
	public String goReallyDelete(member member, HttpSession session, Model model) {
		member loginMember = memberMapper.goReallyDelete(member);
		if (loginMember == null) {
			model.addAttribute("fail", "fail");

			return "DeleteMember";
		} else {
			session.setAttribute("loginMember", loginMember);

			return "ReallyDelete";
		}
	}

	// 회원 탈퇴 성공
	@RequestMapping("/goDeleteSuccess")
	public String goDeleteSuccess(@RequestParam("email") String email, HttpSession session) {
		memberMapper.goDeleteSuccess(email);
		session.invalidate();
		return "DeleteSuccess";
	}

	// 회원 탈퇴(관리자)
	@RequestMapping("/deleteMember")
	public String deleteMember(@RequestParam("email") String email, Model model) {
		memberMapper.deleteMember(email);

		return "redirect:/goAdMember";
	}

	// 회원 정지(관리자)
	@RequestMapping("/susMember")
	public String susMember(@RequestParam("email") String email) {
		memberMapper.susMember(email);

		return "redirect:/goAdMember";
	}

	// 회원 정지 해제(관리자)
	@RequestMapping("/resMember")
	public String resMember(@RequestParam("email") String email) {
		memberMapper.resMember(email);

		return "redirect:/goAdMember";
	}

	// 주문상태 변경
	@RequestMapping("/updatePC_State")
	public String updatePC_State(purchase purchase) {
		
		memberMapper.updatePC_State(purchase);
		
		return "redirect:/goMyPage";
	}

//	// 로그인 메소드
//	@RequestMapping("/memberSelect")
//	public String memberSelect(Member member, HttpSession session) {
//		// System.out.println(member.toString());
//		Member loginMember = memberMapper.memberSelect(member);
//
//		// 로그인 한 사람의 메세지 가져오기
//		// 메세지를 리스트타입으로 불러옴
//		List<Message> m_list = messageMapper.messageList(member.getEmail());
//
//		session.setAttribute("loginMember", loginMember);
//		session.setAttribute("m_list", m_list);
//
//		return "Main";
//	}
//
//
//
//	// 회원정보 페이지로 이동하는 메소드 + 전체 회원정보 가져오기
//	@RequestMapping("/goShowMember")
//	public String goShowMember(Model model) {
//		List<Member> list = memberMapper.goShowMember();
//		model.addAttribute("list", list);
//		return "ShowMember";
//	}
//
//	// 회원정보 삭제하는 메소드
//	@RequestMapping("/deleteMember")
//	public String deleteMember(@RequestParam("email") String email, Model model) {
//		memberMapper.deleteMember(email);
//		// Spring에서 sendRedirect 사용하는 방법
//		// 다시 goShowMember를 실행시키고 ShowMember로 이동해서 리스트를 업데이트 해야하기 때문에!
//		return "redirect:/goShowMember";
//	}

}
