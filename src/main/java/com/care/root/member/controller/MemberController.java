package com.care.root.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
			rs.addAttribute("autoLogin", request.getParameter("autoLogin"));
			return "redirect:successfulLogin";
		}
		
		return "redirect:login";
	}
	
	@GetMapping("successfulLogin")
	public String successLogin(@RequestParam String id,
							   @RequestParam(required = false) String autoLogin,
							   HttpSession session, HttpServletResponse response) {
		
		session.setAttribute(LOGIN, id);
		
		if (autoLogin != null) { //자동로그인 처리
			int t = 60*60*24*90; //쿠키 존속기간을 90일동안으로 잡은 변수 (초*분*시간*일)
			Cookie cook = new Cookie("loginCookie", session.getId());
			cook.setMaxAge(t);
			cook.setPath("/");
			
			response.addCookie(cook);
			
			ms.keepLogin(session.getId(), id);
		}
		
		return "member/successfulLogin";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, 
					     @CookieValue(required = false)Cookie loginCookie,
					     HttpServletResponse response) {
		if(loginCookie != null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			
			ms.keepLogin("nan", (String)session.getAttribute(LOGIN));
		}
		
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
		
		//String[] str = dto.getAddr().split(",");
		
		int result = ms.register(dto);
		
		if(result == 1) {
			return "redirect:login";
		}
		
		return "redirect:register_form";
	}
	
	/*
	 * 회원 정보 수정
	 */
	@GetMapping("update_form")
	public String update_form(@RequestParam String id, Model model) {
		
		ms.info(model, id);
		
		return "member/update";
	}
	
	@PostMapping("update")
	public String update(MemberDTO dto) {
		
		ms.update(dto);
		
		return "redirect:info?id="+dto.getId();
	}
	
	/*
	 * 회원 정보 삭제
	 */
	@GetMapping("delete")
	public String delete(@RequestParam String id, HttpSession session) {
		
		ms.delete(id);
		session.invalidate();
		
		return "redirect:/";
	}
	

}
















