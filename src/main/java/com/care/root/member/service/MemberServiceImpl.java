package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	/*
	 * 로그인 처리 로직
	 */
	@Override
	public int user_check(HttpServletRequest request) {
		
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
		
		if (dto != null) {
			if (dto.getPw().equals(request.getParameter("pw"))) {
				return 0;
			}
		}
		
		return 1;
	}

}
