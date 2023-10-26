package com.bskrec.member.service;

import java.util.Map;

import com.bskrec.member.vo.MemberVO;

public interface MemberService {
	public String idCheck(String _id) throws Exception;
	public void addMember(Map newMemberMap) throws Exception;
	public MemberVO login(Map<String, String> loginMap) throws Exception;
}
