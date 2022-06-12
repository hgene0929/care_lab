package com.care.root.mybatis;

import java.util.List;

import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	
	public MemberDTO user_check(String id);
	public List<MemberDTO> memberInfo();
	public int register(MemberDTO dto);
	public void delete(String id);
	
}
