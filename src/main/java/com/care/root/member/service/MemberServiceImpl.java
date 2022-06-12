package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	/*
	 * 비밀번호 암호화를 위한 객체
	 */
	BCryptPasswordEncoder enc = new BCryptPasswordEncoder();
	
	@Autowired
	MemberMapper mapper;
	
	/*
	 * 로그인 처리 로직
	 */
	@Override
	public int user_check(HttpServletRequest request) {
		
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
		
		if (dto != null) { //비밀번호 복호화(Spring-Security 사용)
			if (enc.matches(request.getParameter("pw"), dto.getPw()) || dto.getPw().equals(request.getParameter("pw"))) {
				return 0;
			}
		}
		
		return 1;
	}

	/*
	 * 회원 조회 로직
	 */
	@Override
	public void memberInfo(Model model) {
		model.addAttribute("list", mapper.memberInfo());
	}

	@Override
	public void info(Model model, String id) {
		model.addAttribute("data", mapper.user_check(id));
	}

	/*
	 * 회원 가입 로직
	 */
	@Override
	public int register(MemberDTO dto) {
		
		String s = enc.encode(dto.getPw()); //비밀번호 암호화(Spring-Security 사용)
		
		dto.setPw(s);
		
		return mapper.register(dto);
	}

}







