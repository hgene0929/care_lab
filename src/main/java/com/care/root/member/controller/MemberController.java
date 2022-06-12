package com.care.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.SessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements SessionName {
	
	@Autowired
	MemberService ms;
	
	/*
	 * 로그인 처리 
	 */
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("user_check")
	public String user_check(HttpServletRequest request,
							 RedirectAttributes rs) {
		
		int result = ms.user_check(request);
		
		if (result == 0) {
			rs.addAttribute("id", request.getParameter("id"));
			return "redirect:successfulLogin";
		}
		
		return "redirect:login";
	}
	
	@GetMapping("successfulLogin")
	public String successLogin(@RequestParam String id,
							   HttpSession session) {
		
		session.setAttribute(LOGIN, id);
		
		return "member/successfulLogin";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	/*
	 * 회원 조회
	 */
	@GetMapping("memberInfo")
	public String memberInfo(Model model) {
		
		ms.memberInfo(model);
		
		return "member/memberInfo";
	}
	
	@GetMapping("info")
	public String info(@RequestParam String id, Model model) {
		
		ms.info(model, id);
		
		return "member/info";
	}
	
	/*
	 * 회원 가입
	 */
	@GetMapping("register_form")
	public String register_form() {
		
		return "member/register";
	}
	
	@PostMapping("register")
	public String register(MemberDTO dto) {
		
		int result = ms.register(dto);
		
		if(result == 1) {
			return "redirect:login";
		}
		
		return "redirect:register_form";
	}

}
















