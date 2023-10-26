package com.bskrec.member.dao;

import java.util.Map;

import com.bskrec.member.vo.MemberVO;

public interface MemberDAO {
	public String selectIdCheck(String _id) throws Exception; 
	public void insertNewMember(Map newMemberMap) throws Exception;
	public MemberVO login(Map<String, String> loginMap) throws Exception;
}
