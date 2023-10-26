package com.bskrec.archive.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bskrec.archive.dao.ArchiveDAO;
import com.bskrec.archive.vo.PlayerArchiveVO;
import com.bskrec.archive.vo.TeamArchiveVO;

@Service("archiveService")
public class ArchiveServiceImpl implements ArchiveService{
	@Autowired
	private ArchiveDAO archiveDAO;
	//멤버기록추가하기
	@Override
	public void addPlayerArchive(Map<String, Object> archiveMap) throws Exception {
		archiveDAO.insertPlayerArchive(archiveMap);
	}
	//게임날짜 찾기
	@Override
	public List<PlayerArchiveVO> findGameData(Map<String,String> gameDataMap) throws Exception {
		return archiveDAO.selectGameData(gameDataMap);
	}
	
	@Override
	public List<PlayerArchiveVO> findPlayerList(String member_id) throws Exception {
		return archiveDAO.selectPlayerList(member_id);
	}
	@Override
	public String findTeamName(String captain_id) throws Exception {
		return archiveDAO.selectTeamName(captain_id);
	}
	@Override
	public String findAwayTeamName(String awayTeamName) throws Exception {
		return archiveDAO.selectAwayTeamName(awayTeamName);
	}
	@Override
	public String homeTeamSearch(String member_id) throws Exception {
		return archiveDAO.selectHomeTeamName(member_id);
	}
	@Override
	public void addTeamArchive(Map<String, Object> archiveMap) throws Exception {
		archiveDAO.insertTeamArchive(archiveMap);
	}
	@Override
	public List<PlayerArchiveVO> findGameCode(Map<String, Object> gameDataMap) throws Exception {
		return archiveDAO.selectGameCode(gameDataMap);
	}
	@Override
	public int modPlayerArchive(Map<String, Object> gameDataMap) throws Exception {
		return archiveDAO.updatePlayerArchive(gameDataMap);
	}
	@Override
	public List<TeamArchiveVO> findTeamArchive(Map<String, Object> gameData) throws Exception {
		return archiveDAO.selectTeamArchive(gameData);
	}
	@Override
	public void modTeamArchive(Map<String, Object> gameDataMap) throws Exception {
		archiveDAO.updateTeamArchive(gameDataMap);
	}
}
