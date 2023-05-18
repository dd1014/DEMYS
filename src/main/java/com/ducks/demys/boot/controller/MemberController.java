package com.ducks.demys.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.vo.Member;

import jakarta.servlet.http.HttpSession;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
		
	}
	
	@RequestMapping("/member/login")
	public String showLogin() {
		return "member/login";
	}

	@PostMapping("/member/doLogin")
	public String doLogin(@RequestParam("MEMBER_ID") String MEMBER_ID, @RequestParam("MEMBER_PW") String MEMBER_PW, HttpSession session, Model model) {
		 
	    if (MEMBER_ID.isEmpty() || MEMBER_PW.isEmpty()) {
	        model.addAttribute("error", "Please try login again");
	        return "member/login";
	    }

	    Member member = memberService.getMemberByMEMBER_ID(MEMBER_ID);

	    if (member != null && member.getMEMBER_PW().equals(MEMBER_PW)) {
	        session.setAttribute("member", member);
	        return "redirect:/mypage/myPage";
	    } else {
	        if (member == null || !member.getMEMBER_ID().equals(MEMBER_ID)) {
	            model.addAttribute("invalidId", "Invalid login ID.");
	        } else {
	            model.addAttribute("invalidPassword", "Invalid password.");
	        }
	        return "member/login";
	    }
	}
	
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
	    session.removeAttribute("MEMBER_ID");
	    return "redirect:/member/login";
	}
	
	
	@RequestMapping("/member/doJoin")
	@ResponseBody
	public String doJoin(String MEMBER_ID, String MEMBER_PW, String MEMBER_NAME, String MEMBER_PHONE,String MEMBER_EMAIL, String MEMBER_DEP, int MEMBER_AUTHORITY, int MEMBER_STATUS, String MEMBER_PIC) {
		memberService.doJoin(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_DEP,MEMBER_AUTHORITY, MEMBER_STATUS, MEMBER_PIC);
		return MEMBER_NAME + "님 계정이 등록되었습니다.";
	}


	@RequestMapping("/member/regist")
	public String showRegist() {
		return "member/regist";
	}

	@RequestMapping("/member/findPw")
	public String showFindPw() {
		return "member/findPw";
	}
	
	
	@RequestMapping("/mypage/myPage")
	public String showMyPage(Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("member");
		String MEMBER_ID =member.getMEMBER_ID();
		if(MEMBER_ID==null) {
			return "redirect:/member/login";
		}
		memberService.getMemberByMEMBER_ID(MEMBER_ID);
		model.addAttribute("member", member);
		
		
		return "mypage/myPage";
	}
	
	@RequestMapping("/mypage/CheckPassword")
	public String CheckPassword() {
			
	return "mypage/myPage";
	}
	
	@RequestMapping("/mypage/doCheckPassword")

	public String doCheckPassword(HttpSession session, String loginPwInput, Model model, String MEMBER_ID) {
	 
	Member member = (Member) session.getAttribute("member");
	String MEMBER_PW = member.getMEMBER_PW();
	 
	 if(member != null && MEMBER_PW.equals(loginPwInput)) {
		 //비밀번호 일치
		 model.addAttribute("member", member);		
	  return "redirect:/mypage/modify";
	  } 
	 else {
		 //비밀번호 일치하지 않는 경우
	  model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
	  return "mypage/myPa";
	  }
	
	}

	@GetMapping("/mypage/modify")
	public String modify(HttpSession session, Model model) {
		
		Member member = (Member)session.getAttribute("member");
		String MEMBER_ID = member.getMEMBER_ID();
		
		memberService.getMemberByMEMBER_ID(MEMBER_ID);
		model.addAttribute("member", member);
		
		return "mypage/modify";
	}
	
	
	
	@PostMapping("/mypage/doModify")
	public String doModify(HttpSession session, Member member, int MEMBER_NUM,String MEMBER_ID,String MEMBER_PW,
			String MEMBER_PHONE,String MEMBER_EMAIL) {

	
	    memberService.modifyMember(member);

	    return "redirect:/mypage/myPage";
	}
			

	
	 
	 
	 
	 }
	 
	
	

	
	

