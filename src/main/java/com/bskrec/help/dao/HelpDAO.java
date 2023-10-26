package com.bskrec.help.dao;

import java.util.Map;

public interface HelpDAO {
	public String findId(Map<String, String> findMap) throws Exception;
	public String findPw(Map<String, String> findMap) throws Exception;
}
