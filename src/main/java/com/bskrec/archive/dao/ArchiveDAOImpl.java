package com.bskrec.archive.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bskrec.archive.vo.PlayerArchiveVO;
import com.bskrec.archive.vo.TeamArchiveVO;

@Repository("archiveDAO")
public class ArchiveDAOImpl implements ArchiveDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public void insertPlayerArchive(Map<String, Object> archiveMap) throws DataAccessException {
		session.insert("mapper.archive.insertPlayerArchive", archiveMap);
	}
	
	@Override
	public List<PlayerArchiveVO> selectGameData(Map<String,String> gameDataMap) throws DataAccessException {
		List<PlayerArchiveVO> archiveList = session.selectList("mapper.archive.selectGameData",gameDataMap); 
		return archiveList;
	}
	
	@Override
	public List<PlayerArchiveVO> selectPlayerList(String member_id) throws DataAccessException {
		List<PlayerArchiveVO> archiveList = session.selectList("mapper.archive.selectPlayerList",member_id);
		return archiveList;
	}
	@Override
	public String selectTeamName(String captain_id) throws DataAccessException {
		return session.selectOne("mapper.archive.selectTeamName",captain_id);
	}
	
	@Override
	public String selectAwayTeamName(String awayTeamName) throws DataAccessException {
		return session.selectOne("mapper.archive.selectAwayTeamName",awayTeamName);
	}
	@Override
	public String selectHomeTeamName(String member_id) throws DataAccessException {
		return session.selectOne("mapper.archive.selectHomeTeamName", member_id);
	}
	@Override
	public void insertTeamArchive(Map<String, Object> archiveMap) throws DataAccessException {
		session.insert("mapper.archive.insertTeamArchive", archiveMap);
	}
	@Override
	public List<PlayerArchiveVO> selectGameCode(Map<String, Object> gameDataMap) throws DataAccessException {
		return session.selectList("mapper.archive.selectGameCode",gameDataMap);
	}
	@Override
	public int updatePlayerArchive(Map<String, Object> gameDataMap) throws DataAccessException {
		return session.update("mapper.archive.updatePlayerArchive", gameDataMap);
	}
	@Override
	public List<TeamArchiveVO> selectTeamArchive(Map<String, Object> gameData) throws DataAccessException {
		List<TeamArchiveVO> teamArchiveList = session.selectList("mapper.archive.selectTeamArchive",gameData); 
		return teamArchiveList;
	}
	@Override
	public void updateTeamArchive(Map<String, Object> gameDataMap) throws DataAccessException {
		session.update("mapper.archive.updateTeamArchive", gameDataMap);
	}
}
