package com.bskrec.help.service;

import java.util.Map;

public interface HelpService {
	public String findId(Map<String, String> findMap) throws Exception;
	public String findPw(Map<String, String> findMap) throws Exception;
}
