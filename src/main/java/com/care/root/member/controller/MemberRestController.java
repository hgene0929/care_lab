package com.care.root.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;
import com.care.root.mybatis.MemberMapper;

@RestController
@RequestMapping("member")
public class MemberRestController {

	@Autowired MemberMapper mapper;
	
	@GetMapping(value = "idCheck/{id}", produces = "application/json; charset=utf-8")
	public int idCheck(@PathVariable String id) {
		
		int result = 0;

		if(id.length() > 6) {
			result = mapper.idCheck(id); //db에 해당 id가 존재하면 1, 존재하지 않으면 0
		} else {
			result = -1; //아이디의 길이가 6보다 작으면 회원가입 불가
		}
		
		return result;
	}
}
