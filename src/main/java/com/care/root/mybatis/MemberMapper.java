package com.care.root.mybatis;

import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	
	public MemberDTO user_check(String id);
	
}
