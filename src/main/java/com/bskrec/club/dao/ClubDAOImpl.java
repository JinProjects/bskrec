package com.bskrec.club.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bskrec.club.vo.PlayerImageVO;
import com.bskrec.club.vo.TeamImageVO;

@Repository
public class ClubDAOImpl implements ClubDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public String teamNameDup(String team_name) throws DataAccessException {
		return session.selectOne("mapper.club.teamNameDup",team_name);
	}
	
	@Override
	public void insertNewPlayer(Map newPlayerMap) throws DataAccessException {
		session.insert("mapper.club.insertNewPlayer", newPlayerMap);
	}
	
	@Override
	public void insertPlayerImageFile(ArrayList<PlayerImageVO> imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size(); i++) {
			PlayerImageVO playerImageVO = imageFileList.get(i);
			session.insert("mapper.club.insertPlayerImageFile",playerImageVO);
		}
	}
	
	@Override
	public void insertNewTeam(Map newTeamMap) throws DataAccessException {
		session.insert("mapper.club.insertNewTeam",newTeamMap);
		
	}
	@Override
	public void insertNewTeamMember(Map newTeamMap) throws DataAccessException {
		session.insert("mapper.club.insertNewTeamMember",newTeamMap);
	}
	
	@Override
	public void insertTeamImageFile(ArrayList<TeamImageVO> imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size(); i++) {
			TeamImageVO teamImageVO = imageFileList.get(i);
			session.insert("mapper.club.insertTeamImageFile",teamImageVO);
		}
	}
}
