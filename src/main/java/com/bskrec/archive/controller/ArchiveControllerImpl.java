package com.bskrec.archive.controller;

import java.net.Authenticator.RequestorType;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bskrec.archive.service.ArchiveService;
import com.bskrec.archive.vo.PlayerArchiveVO;
import com.bskrec.archive.vo.TeamArchiveVO;
import com.bskrec.common.base.BaseController;
import com.bskrec.member.vo.MemberVO;

@Controller("archiveController")
@RequestMapping(value = "/archive")
public class ArchiveControllerImpl extends BaseController implements ArchiveController {
	@Autowired
	private ArchiveService archiveService;

	// 경기조회는 팀기록을 조회하여 게임코드를 불러오게 한다
	// 수정하기를 따로 만들어 전 코드를 재사용
	@Override
	@RequestMapping(value = "/addPlayerArchive.do", method = RequestMethod.POST)
	public ResponseEntity addPlayerArchive(Map<String, Object> archiveMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		ResponseEntity resEntity = null;
		String message = null;

		// 날짜를 구해오자
		// gameDate 없애고 t_bskrec_result에서 gameCode 조회 후 바인딩
		// String gameDate = getCurrentDateTime();
		// archiveMap.put("gameDate", gameDate);
		// String gameCode = archiveService.

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		// 날짜로 게임코드들을 조회
		try {
			archiveService.addPlayerArchive(archiveMap);
			message = "<script>";
			message += " alert('기록입력이 완료되었습니다.')";
			message += " location.href='" + request.getContextPath() + "/archive/playerArchiveDetail.do'";
			message += " </script>";
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.')";
			message += " location.href='" + request.getContextPath() + "/archive/playerArchiveDetail.do'";
			message += " </script>";
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

//	gameDate,captain_id,team_name,member_id
	@Override
	@RequestMapping(value = "/playerArchiveImport.do", method = RequestMethod.POST)
	public ResponseEntity playerArchiveImport(@RequestBody Map<String, String> gameDataMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		// 날짜,아이디,팀장아이디
		List gameDataList = null;
		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=UTF-8");
		try {
			gameDataList = archiveService.findGameData(gameDataMap);
			resEntity = new ResponseEntity(gameDataList, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.')";
			message += " </script>";
			resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/playerList.do", method = RequestMethod.POST)
	public ResponseEntity playerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		List playerList = archiveService.findPlayerList(member_id);

		resEntity = new ResponseEntity(playerList, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/gameCodePopup.do", method = RequestMethod.GET)
	public ModelAndView gameCodePopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = request.getParameter("member_id");
		String captain_id = memberVO.getMember_id();

		String team_name = archiveService.findTeamName(captain_id);

		Map gameDataMap = new HashMap();
		gameDataMap.put("member_id", member_id);
		gameDataMap.put("captain_id", captain_id);
		gameDataMap.put("team_name", team_name);

		ModelAndView mav = new ModelAndView();
		mav.addObject("gameDataMap", gameDataMap);
		mav.setViewName("/archive/gameCodePopup");
		return mav;
	}

	@Override
	@RequestMapping(value = "/awayTeamSearch.do", method = RequestMethod.GET)
	public ResponseEntity awayTeamSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String awayTeamName = request.getParameter("teamName");
		int isTeamName = Integer.parseInt(archiveService.findAwayTeamName(awayTeamName));
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=UTF-8");

		resEntity = new ResponseEntity(isTeamName, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/homeTeamSearch.do", method = RequestMethod.POST)
	public ResponseEntity homeTeamSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String member_id = request.getParameter("member_id");
		ResponseEntity resEntity = null;
		String homeTeamName = archiveService.homeTeamSearch(member_id);
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=UTF-8");
		resEntity = new ResponseEntity(homeTeamName, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/teamArchiveSubmit.do", method = RequestMethod.POST)
	public ResponseEntity teamArchiveSubmit(@RequestParam Map<String, Object> archiveMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=UTF-8");
		// 16:23
		//
		String homeTeamName = (String) archiveMap.get("homeTeamName");
		String startTime = (String) archiveMap.get("gameStartTime");
		String endTime = (String) archiveMap.get("gameEndTime");

		String gameStartTime = getGameTime(startTime);
		String gameEndTime = getGameTime(endTime);

		archiveMap.put("gameStartTime", gameStartTime);
		archiveMap.put("gameEndTime", gameEndTime);

		String gameCode = getGameCode(homeTeamName, gameStartTime);
		// 스코어 합계 자바스크립에서 할지 서버에서 할지 선택
		// String score = totalScore
		// 게임코드 = 날짜+팀명
		// 1.db 게임코드 타입이 안맞아서 값이 안들어가는 듯 함 타입변경
		// 2.gameStartTime과 gameEndTime에 년월일시간

		archiveMap.put("gameCode", gameCode);

		archiveService.addTeamArchive(archiveMap);
		try {
			message = " <script>";
			message += " alert('입력되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/archive/teamArchiveForm.do';";
			message += " </script>";
		} catch (Exception e) {
			message = " <script>";
			message += " alert('에러가 발생했습니다.')";
			message += " </script>";
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/gameCodeSearch.do", method = RequestMethod.POST)
	public ResponseEntity gameCodeSearch(@RequestBody Map<String, Object> gameDataMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		List gameCodeList = null;
		String message = null;

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=UTF-8");
		try {
			gameCodeList = archiveService.findGameCode(gameDataMap);
			resEntity = new ResponseEntity(gameCodeList, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다.');";
			message += " </script>";
			resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/modPlayerArchive.do", method = RequestMethod.POST)
	public ModelAndView modPlayerArchive(@RequestParam Map<String, Object> gameDataMap, HttpServletRequest reqeust,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		int modResult = archiveService.modPlayerArchive(gameDataMap);
		mav.addObject("modResult", modResult);
		mav.setViewName("/archive/playerArchiveForm");
		return mav;
	}

	@Override
	@RequestMapping(value = "/teamArchivePopup.do", method = RequestMethod.GET)
	public ModelAndView teamArchivePopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String awayTeamName = request.getParameter("awayTeamName");
		String gameDate = request.getParameter("gameDate");

		Map<String, Object> gameDataMap = new HashMap<String, Object>();
		gameDataMap.put("awayTeamName", awayTeamName);
		gameDataMap.put("gameDate", gameDate);

		mav.addObject("gameDataMap", gameDataMap);

		return mav;
	}

	@Override
	@RequestMapping(value = "/teamArchiveGameDate.do", method = RequestMethod.POST)
	public ResponseEntity teamArchiveGameDate(@RequestBody Map<String, Object> gameData, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String message = null;
		List<TeamArchiveVO> gameDataList = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		try {
			gameDataList = archiveService.findTeamArchive(gameData);
			resEntity = new ResponseEntity(gameDataList, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			message = " <script>";
			message += " alert('오류가 발생했습니다.');";
			message += " </script>";
			resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/modTeamArchive.do",method = RequestMethod.POST)
	public ResponseEntity modTeamArchive(@RequestParam Map<String, Object> gameDataMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		ResponseEntity resEntity = null;
		String message = null;
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		
		gameDataMap.put("member_id", member_id);
		try {
			archiveService.modTeamArchive(gameDataMap);
			message = " <script>";
			message += " alert('수정되었습니다.');";
			message += " location.href='"+request.getContextPath()+"/archive/teamArchiveForm.do';";
			message += " </script>";
		} catch (Exception e) {
			e.printStackTrace();
			message = " <script>";
			message += " alert('에러가 발생했습니다.');";
			message += " </script>";
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
}
