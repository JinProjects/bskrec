package com.bskrec.archive.vo;

import org.springframework.stereotype.Component;

@Component("archiveVO")
public class PlayerArchiveVO {
	private String gameCode;
	private String member_id;
	private String team_name;
	private int twoPointCnt;
	private int twoPoint;
	private int threePointCnt;
	private int threePoint;
	private int freedrawCnt;
	private int freedraw;
	private int faintzoneCnt;
	private int faintzone;
	private int assist;
	private int offenseRebound;
	private int defenseRebound;
	private int block;
	private int steal;
	private int foul;
	private int turnover;
	private String gameStartTime;
	private String gameEndTime;
	private String creDate;
	
	public String getGameCode() {
		return gameCode;
	}
	public void setGameCode(String gameCode) {
		this.gameCode = gameCode;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public int getTwoPointCnt() {
		return twoPointCnt;
	}
	public void setTwoPointCnt(int twoPointCnt) {
		this.twoPointCnt = twoPointCnt;
	}
	public int getTwoPoint() {
		return twoPoint;
	}
	public void setTwoPoint(int twoPoint) {
		this.twoPoint = twoPoint;
	}
	public int getThreePointCnt() {
		return threePointCnt;
	}
	public void setThreePointCnt(int threePointCnt) {
		this.threePointCnt = threePointCnt;
	}
	public int getThreePoint() {
		return threePoint;
	}
	public void setThreePoint(int threePoint) {
		this.threePoint = threePoint;
	}
	public int getFreedrawCnt() {
		return freedrawCnt;
	}
	public void setFreedrawCnt(int freedrawCnt) {
		this.freedrawCnt = freedrawCnt;
	}
	public int getFreedraw() {
		return freedraw;
	}
	public void setFreedraw(int freedraw) {
		this.freedraw = freedraw;
	}
	public int getAssist() {
		return assist;
	}
	public void setAssist(int assist) {
		this.assist = assist;
	}
	public int getBlock() {
		return block;
	}
	public void setBlock(int block) {
		this.block = block;
	}
	public int getSteal() {
		return steal;
	}
	public void setSteal(int steal) {
		this.steal = steal;
	}
	public int getFoul() {
		return foul;
	}
	public void setFoul(int foul) {
		this.foul = foul;
	}
	
	public String getGameStartTime() {
		return gameStartTime;
	}
	public void setGameStartTime(String gameStartTime) {
		this.gameStartTime = gameStartTime;
	}
	public String getGameEndTime() {
		return gameEndTime;
	}
	public void setGameEndTIme(String gameEndTime) {
		this.gameEndTime = gameEndTime;
	}
	public String getCreDate() {
		return creDate;
	}
	public void setCreDate(String creDate) {
		this.creDate = creDate;
	}
	public int getFaintzoneCnt() {
		return faintzoneCnt;
	}
	public void setFaintzoneCnt(int faintzoneCnt) {
		this.faintzoneCnt = faintzoneCnt;
	}
	public int getFaintzone() {
		return faintzone;
	}
	public void setFaintzone(int faintzone) {
		this.faintzone = faintzone;
	}
	public int getOffenseRebound() {
		return offenseRebound;
	}
	public void setOffenseRebound(int offenseRebound) {
		this.offenseRebound = offenseRebound;
	}
	public int getDefenseRebound() {
		return defenseRebound;
	}
	public void setDefenseRebound(int defenseRebound) {
		this.defenseRebound = defenseRebound;
	}
	public int getTurnover() {
		return turnover;
	}
	public void setTurnover(int turnover) {
		this.turnover = turnover;
	}
	
}
