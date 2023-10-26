package com.bskrec.help.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelpDAOImpl implements HelpDAO{
	@Autowired
	private SqlSession session;
	@Override
	public String findId(Map<String, String> findMap) throws Exception {
		return session.selectOne("mapper.help.findId",findMap);
	}
	@Override
	public String findPw(Map<String, String> findMap) throws Exception {
		return session.selectOne("mapper.help.findPw",findMap);
	}
}
