package com.bskrec.archive.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bskrec.archive.vo.PlayerArchiveVO;
import com.bskrec.archive.vo.TeamArchiveVO;

public interface ArchiveDAO {
	public void insertPlayerArchive(Map<String, Object> archiveMap) throws DataAccessException;
	public List<PlayerArchiveVO> selectGameData(Map<String,String> gameDataMap) throws DataAccessException;
	public List selectPlayerList(String member_id) throws DataAccessException;
	public String selectTeamName(String captain_id) throws DataAccessException;
	public String selectAwayTeamName(String awayTeamName) throws DataAccessException;
	public String selectHomeTeamName(String member_id) throws DataAccessException;
	public void insertTeamArchive(Map<String, Object> archiveMap) throws DataAccessException;
	public List<PlayerArchiveVO> selectGameCode(Map<String, Object> gameDataMap) throws DataAccessException;
	public int updatePlayerArchive(Map<String, Object> gameDataMap) throws DataAccessException;
	public List<TeamArchiveVO> selectTeamArchive(Map<String, Object> gameData) throws DataAccessException;
	public void updateTeamArchive(Map<String, Object> gameDataMap) throws DataAccessException;
}
