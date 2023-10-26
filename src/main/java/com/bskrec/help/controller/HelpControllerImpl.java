package com.bskrec.help.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bskrec.common.base.BaseController;
import com.bskrec.help.service.HelpService;
@Controller
@RequestMapping("/help")
public class HelpControllerImpl extends BaseController implements HelpController{
	@Autowired
	private HelpService helpService;
	
	@Override
	@RequestMapping(value = "/find_id.do",method = RequestMethod.GET)
	public ResponseEntity find_id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String name = request.getParameter("member_name");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		Map<String, String> findMap = new HashMap<String,String>();
		findMap.put("_name", name);
		findMap.put("_email1", email1);
		findMap.put("_email2", email2);
		String flag = helpService.findId(findMap);
//		Map<String,String> map = new HashMap<String, String>();
//		map.put("flag", flag);
		resEntity = new ResponseEntity(flag, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	@Override
	@RequestMapping(value = "/find_pw.do",method = RequestMethod.GET)
	public ResponseEntity find_pw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		String _id = request.getParameter("id");
		String _email1 = request.getParameter("email1");
		String _email2 = request.getParameter("email2");
		
		Map<String, String> findMap = new HashMap<String, String>();
		findMap.put("_id", _id);
		findMap.put("_email1", _email1);
		findMap.put("_email2", _email2);
		String flag = helpService.findPw(findMap);
		
		resEntity = new ResponseEntity(flag, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
}
