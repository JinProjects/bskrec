package com.bskrec.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bskrec.member.dao.MemberDAO;
import com.bskrec.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberVO memberVO;
	@Override
	public String idCheck(String _id) throws Exception {
		String flag =memberDAO.selectIdCheck(_id);
		return flag;
	}
	
	@Override
	public void addMember(Map newMemberMap) throws Exception {
		memberDAO.insertNewMember(newMemberMap);
	}
	@Override
	public MemberVO login(Map<String, String> loginMap) throws Exception {
		memberVO = memberDAO.login(loginMap);
		return memberVO;
	}
}
