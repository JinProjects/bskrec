package com.bskrec.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bskrec.member.vo.MemberVO;

public interface MemberController {
	public ResponseEntity addMember(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity idCheck(@RequestParam("id") String id,
									HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@RequestParam Map<String,String> loginMap,
									HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView find_id_pw(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
