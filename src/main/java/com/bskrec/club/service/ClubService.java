package com.bskrec.club.service;

import java.util.Map;

public interface ClubService {
	public String teamNameDup(String team_name) throws Exception;
	public void addNewPlayer(Map newPlayerMap) throws Exception;
	public void addNewTeam(Map newTeamMap) throws Exception;
}
