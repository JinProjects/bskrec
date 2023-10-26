package com.bskrec.club.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bskrec.club.service.ClubService;
import com.bskrec.club.vo.PlayerImageVO;
import com.bskrec.club.vo.TeamImageVO;
import com.bskrec.common.base.BaseController;
import com.bskrec.member.vo.ImageFileVO;
import com.bskrec.member.vo.MemberVO;
@Controller("clubController")
@RequestMapping("/club")
public class ClubControllerImpl extends BaseController implements ClubContoller {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\bskrec\\file_repo";
	@Autowired
	public ClubService clubService;
	
	@RequestMapping(value = "/teamNameDup.do",method = RequestMethod.POST)
	public ResponseEntity teamNameDup(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String message = null;
		String team_name = (String)request.getParameter("team_name");
		message = clubService.teamNameDup(team_name);
		resEntity = new ResponseEntity(message, HttpStatus.OK);
		return resEntity;
	};
	//팀, 선수 등록할 때 이미지도 업로드
	@Override
	@RequestMapping(value="/playerReg.do",method = RequestMethod.POST)
	public ResponseEntity playerReg(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName = null;
		Map newPlayerMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames(); 
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newPlayerMap.put(name, value);
		}
		//clubService.addNewPlayer(dataMap);//선수등록
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		newPlayerMap.put("member_id", member_id);
		List<PlayerImageVO> imageFileList = playerUpload(multipartRequest);
		if(imageFileList!=null&&imageFileList.size()!=0) {
			for(PlayerImageVO playerImageVO : imageFileList) {
				playerImageVO.setMember_id(member_id);//아이디가 추가 안됨 해결하기
			}
			newPlayerMap.put("imageFileList", imageFileList);//imageFileList null값 없애야함
		}
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			//newPlayerMap에 일반 데이터와 이미지 데이터가 들어가있다
			//player_id는 이미지번호이기도 하고 데이터가 저장 될 폴더명이다.
			//player_id를 받기 위해 image테이블에 저장할 때 시퀀스 번호를 리턴한다.
			
			clubService.addNewPlayer(newPlayerMap);
			if(imageFileList!=null&&imageFileList.size()!=0) {
				for(PlayerImageVO playerImageVO : imageFileList) {
					imageFileName = playerImageVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+member_id+"\\"+"playerImg");
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += " alert('선수등록이 완료되었습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/main/main.do'";
			message += " </script>";
		} catch (Exception e) {
			e.printStackTrace();
			if(imageFileList!=null&&imageFileList.size()!=0) {
				for(PlayerImageVO playerImageVO : imageFileList) {
					imageFileName = playerImageVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club/playerRegForm.do'";
			message += " </script>";
		}
		resEntity = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/teamReg.do",method = RequestMethod.POST)
	public ResponseEntity teamReg(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName = null;
		Map newTeamMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = (String)multipartRequest.getParameter(name);
			newTeamMap.put(name, value);
		}
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		newTeamMap.put("member_id", member_id);
		
		List<TeamImageVO> imageFileList = teamUpload(multipartRequest,member_id);
		if(imageFileList!=null&&imageFileList.size()!=0) {
			for(TeamImageVO teamImageVO : imageFileList) {
				teamImageVO.setMember_id(member_id);
			}
			newTeamMap.put("imageFileList", imageFileList);
		}
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			clubService.addNewTeam(newTeamMap);
			if(imageFileList!=null&&imageFileList.size()!=0) {
				for(TeamImageVO teamImageVO : imageFileList) {
					imageFileName = teamImageVO.getFileName(); 
							//teamImageVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+member_id+"\\"+"teamImg");
					//파일명이 같아서 오류가 나옴
					//파일명을 시간으로 저장시키면 될 듯
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = " <script>";
			message += " alert('팀 등록이 되었습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
			message += " </script>";
		} catch (Exception e) {
			e.printStackTrace();
			if(imageFileList!=null&imageFileList.size()!=0) {
				for(TeamImageVO teamImageVO : imageFileList) {
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/club/teamRegForm.do';";
			message += " </script>";
		}
		resEntity = new ResponseEntity(message, responseHeaders,HttpStatus.OK);
		return resEntity;
	}
}