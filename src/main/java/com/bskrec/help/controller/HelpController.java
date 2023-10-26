package com.bskrec.help.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface HelpController {
	public ResponseEntity find_id(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity find_pw(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
