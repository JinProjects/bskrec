package com.bskrec.archive.service;

import java.util.List;
import java.util.Map;

import com.bskrec.archive.vo.PlayerArchiveVO;
import com.bskrec.archive.vo.TeamArchiveVO;

public interface ArchiveService {
	public void addPlayerArchive(Map<String, Object> archiveMap) throws Exception;
	public List<PlayerArchiveVO> findGameData(Map<String,String> gameDataMap) throws Exception;
	public List findPlayerList(String member_id) throws Exception;
	public String findTeamName(String captain_id) throws Exception;
	public String findAwayTeamName(String awayTeamName) throws Exception;
	public String homeTeamSearch(String member_id) throws Exception;
	public void addTeamArchive(Map<String, Object> archiveMap) throws Exception;
	public List<PlayerArchiveVO> findGameCode(Map<String, Object> gameDataMap) throws Exception;
	public int modPlayerArchive(Map<String, Object> gameDataMap) throws Exception;
	public List<TeamArchiveVO> findTeamArchive(Map<String, Object> gameData) throws Exception;
	public void modTeamArchive(Map<String, Object> gameDataMap) throws Exception;

}
