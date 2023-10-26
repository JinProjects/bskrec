package com.bskrec.member.dao;

import java.lang.reflect.Member;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bskrec.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public String selectIdCheck(String _id) throws Exception {
		return session.selectOne("mapper.member.selectIdCheck",_id);
	}
	@Override
	public void insertNewMember(Map newMemberMap) throws Exception {
		session.insert("mapper.member.insertNewMember",newMemberMap);
	}
	@Override
	public MemberVO login(Map<String, String> loginMap) throws Exception {
		return session.selectOne("mapper.member.login",loginMap);
	}
}
