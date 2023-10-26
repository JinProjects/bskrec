package com.bskrec.help.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bskrec.help.dao.HelpDAO;
@Service
public class HelpServiceImpl implements HelpService{
	@Autowired
	public HelpDAO helpDAO; 
	@Override
	public String findId(Map<String, String> findMap) throws Exception {
		String flag = helpDAO.findId(findMap);
		return flag;
	}
	
	@Override
	public String findPw(Map<String, String> findMap) throws Exception {
		String flag = helpDAO.findPw(findMap);
		return flag;
	}
}
