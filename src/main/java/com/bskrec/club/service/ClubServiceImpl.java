package com.bskrec.club.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bskrec.club.dao.ClubDAO;
import com.bskrec.club.vo.PlayerImageVO;
import com.bskrec.club.vo.TeamImageVO;

@Service
@Transactional
public class ClubServiceImpl implements ClubService{
	@Autowired
	private ClubDAO clubDAO;
	
	@Override
	public String teamNameDup(String team_name) throws Exception {
		String message = clubDAO.teamNameDup(team_name);
		return message;
	}
	@Override
	public void addNewPlayer(Map newPlayerMap) throws Exception {
		clubDAO.insertNewPlayer(newPlayerMap);
		ArrayList<PlayerImageVO> imageFileList = (ArrayList)newPlayerMap.get("imageFileList");
		clubDAO.insertPlayerImageFile(imageFileList);
	}
	
	@Override
	public void addNewTeam(Map newTeamMap) throws Exception {
		clubDAO.insertNewTeam(newTeamMap);
		ArrayList<TeamImageVO> imageFileList = (ArrayList)newTeamMap.get("imageFileList");
		clubDAO.insertTeamImageFile(imageFileList);
		clubDAO.insertNewTeamMember(newTeamMap);
	}
}
