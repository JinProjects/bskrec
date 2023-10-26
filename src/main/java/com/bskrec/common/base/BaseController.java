package com.bskrec.common.base;

import java.io.File;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.mail.search.DateTerm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bskrec.club.vo.PlayerImageVO;
import com.bskrec.club.vo.TeamImageVO;
import com.bskrec.club.vo.TeamVO;
import com.bskrec.member.vo.ImageFileVO;

public abstract class BaseController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\bskrec\\file_repo";
	//이미지 확장자를 jpg, png만 받을 수 있게
	protected List<TeamImageVO> teamUpload(MultipartHttpServletRequest multipartRequest,String member_id) throws Exception{
		List<TeamImageVO> fileList = new ArrayList<TeamImageVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			TeamImageVO teamImageVO = new TeamImageVO();
			String fileName = fileNames.next();
			teamImageVO.setFileType(fileName);
			
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = modifyFileName(mFile.getOriginalFilename());
			teamImageVO.setFileName(originalFileName);
			fileList.add(teamImageVO);
			
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+"team"+"\\"+fileName);
			//File file = new File(CURR_IMAGE_REPO_PATH+"\\"+member_id+"\\"+"teamImg");
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+originalFileName));
				//mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+member_id+"\\"+"teamImg"+"\\"+originalFileName));
			}
		}
		
		return fileList; 
	}
	
	protected List<PlayerImageVO> playerUpload(MultipartRequest multipartRequest) throws Exception{
		List<PlayerImageVO> fileList = new ArrayList<PlayerImageVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			PlayerImageVO playerImageVO = new PlayerImageVO();
			String fileName = fileNames.next();
			playerImageVO.setFileType(fileName);
			
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = modifyFileName(mFile.getOriginalFilename());
			playerImageVO.setFileName(originalFileName);
			fileList.add(playerImageVO);
			
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+"player"+"\\"+fileName);
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+originalFileName));
			}
		}
		return fileList;
	}
	
	protected List<ImageFileVO> upload(MultipartRequest multipartRequest) throws Exception{
		//각 파일들을 저장하고 리턴함
		List<ImageFileVO> fileList = new ArrayList<ImageFileVO>();
		//프론트에서 보낸 파일의 이름을 꺼내서 경로로 사용하고 
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			ImageFileVO imageFileVO = new ImageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setFileType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = modifyFileName(mFile.getOriginalFilename());
			imageFileVO.setFileName(originalFileName);
			fileList.add(imageFileVO);
			//---------------------
			//파일 생성
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
			if(mFile.getSize()!=0){
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				//https://cafe.naver.com/spring4shoppingmall/1319 
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+originalFileName));
			}
		}
		return fileList;
	}
	protected String getGameCode(String homeTeamName, String gameStartTime) {
		LocalDateTime currentDateTime = LocalDateTime.now();
		String seconds = String.valueOf(currentDateTime.getSecond()); 
		String gameCode = gameStartTime+homeTeamName;
		
		return gameCode;
	}
	protected String modifyFileName(String fileName) {
		String date = null;
		String year = null;
		String month = null;
		String day = null;
		
		String hour = null;
		String minute = null;
		String second = null;
 		LocalDateTime currentDateTime = LocalDateTime.now();
		
 		
 		int idx = fileName.lastIndexOf(".");
 		String fileExtension = fileName.substring(idx);
 		
		year = String.valueOf(currentDateTime.getYear());
		month = String.valueOf(currentDateTime.getMonthValue());
		day = String.valueOf(currentDateTime.getDayOfMonth());
		
		hour = String.valueOf(currentDateTime.getHour());
		minute = String.valueOf(currentDateTime.getMinute());
		second = String.valueOf(currentDateTime.getNano());
		
		date = year+month+day+"_"+hour+minute+second+fileExtension;
		
		return date;
	}
	
	protected String getCurrentDateTime() throws Exception{
		LocalDateTime currentDateTime = LocalDateTime.now();
		String date = null;
		String year = null;
		String month = null;
		String day = null;
		
		String hour = null;
		String minute= null;
		String second = null;
		
		year = String.valueOf(currentDateTime.getYear());
		month = String.valueOf(currentDateTime.getMonthValue());
		day = String.valueOf(currentDateTime.getDayOfMonth());
		
		hour = String.valueOf(currentDateTime.getHour());
		minute = String.valueOf(currentDateTime.getMinute());
		second = String.valueOf(currentDateTime.getSecond());
		date = year+month+day+"_"+hour+minute+second;
		return date;
	}
	protected String getGameTime(String gameTime) {
		LocalDateTime currentDateTime = LocalDateTime.now();
		
		String replaceGameTime = gameTime.replace(":", "");
		String year = String.valueOf(currentDateTime.getYear());
		String month = String.valueOf(currentDateTime.getMonthValue());
		if(month.length() < 4) {
			month = "0"+month;
		}
		String day = String.valueOf(currentDateTime.getDayOfMonth());
		//String hour = String.valueOf(currentDateTime.getHour());
		//String minute = String.valueOf(currentDateTime.getMinute());
		String seconds = String.valueOf(currentDateTime.getSecond());
		if(seconds.length()<2) {
			seconds = "0"+seconds;
		}
		String date = year+month+day+replaceGameTime+seconds;
		return date;
	}
	
	//사용자가 없는 url을 칠 시 실행함
	//예외처리를 해주어야 함
	//타일즈 뷰리졸버로 변환된다.
	@RequestMapping(value = "/*.do", method = {RequestMethod.POST, RequestMethod.GET})
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
