package com.bskrec.member.controller;



import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bskrec.common.base.BaseController;
import com.bskrec.member.service.MemberService;
import com.bskrec.member.vo.ImageFileVO;
import com.bskrec.member.vo.MemberVO;
@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	private static final String CURR_IMAGE_REPO_PATH = "C:\\bskrec\\file_repo";
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public ResponseEntity idCheck(@RequestParam("id") String _id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		//결과값 Y N으로 리턴
		String id = memberService.idCheck(_id);
		resEntity = new ResponseEntity(id,HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/addMember.do", method = RequestMethod.POST)
	public ResponseEntity addMember(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		multipartRequest.setCharacterEncoding("utf-8");
		ResponseEntity resEntity = null;
		//결과 메시지
		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		String imageFileName = null;
		Map newMemberMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newMemberMap.put(name, value);
		}
		//자바스크립트 스프링 이미지 전송
		//파일리스트의 이름을 리턴받음
		//fileName과 originalFileName이 뭐가 다른지 확인해보기
		List<ImageFileVO> imageFileList = upload(multipartRequest);
		if(imageFileList!=null&&imageFileList.size()!=0) {
			newMemberMap.put("imageFileList", imageFileList);
		}
		
		String member_id = (String)newMemberMap.get("member_id");
		try {
			memberService.addMember(newMemberMap);
			//멤버의 아이디폴 디렉토리로 파일 이동 시킴
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+member_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message += " <script>"
					+ "alert('회원 가입을 마쳤습니다. 로그인창으로 이동합니다.');"
					+ " location.href='"+multipartRequest.getContextPath()+"/member/loginForm.do';"
					+ " </script>";
		} catch (Exception e) {
			//오류가 나면 업로드 된 파일을 삭제시켜줘야함
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			message += " <script>"
					+ " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');"
					+ " location.href='"+multipartRequest.getContextPath()+"/member/memberForm.do';"
					+ " </script>";
		}    
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@Override
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);
		if(memberVO!=null && memberVO.getMember_id()!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);
			
			mav.setViewName("redirect:/main/main.do");
		}else {
			//로그인 프레임에 삽입 할 내용
			String message = "아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.\r\n"
					+ "입력하신 내용을 다시 확인해주세요.";
			mav.addObject("message",message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	@RequestMapping(value = "/logout.do",method = RequestMethod.GET)
	@Override
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@Override
	public ModelAndView find_id_pw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
