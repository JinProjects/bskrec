package com.bskrec.club.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bskrec.club.vo.PlayerImageVO;
import com.bskrec.club.vo.TeamImageVO;

public interface ClubDAO {
	public String teamNameDup(String team_name) throws DataAccessException;
	public void insertNewPlayer(Map newPlayerMap) throws DataAccessException;
	public void insertPlayerImageFile(ArrayList<PlayerImageVO> imageFileList) throws DataAccessException;
	public void insertNewTeam(Map newTeamMap) throws DataAccessException;
	public void insertTeamImageFile(ArrayList<TeamImageVO> imageFileList) throws DataAccessException;
	public void insertNewTeamMember(Map newTeamMap) throws DataAccessException;
}
