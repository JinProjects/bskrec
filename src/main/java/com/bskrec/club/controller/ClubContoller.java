package com.bskrec.club.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ClubContoller {
	public ResponseEntity teamNameDup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity playerReg(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity teamReg(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception;
	
}
