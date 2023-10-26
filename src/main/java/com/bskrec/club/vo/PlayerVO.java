package com.bskrec.club.vo;

import org.springframework.stereotype.Component;

@Component("playerVO")
public class PlayerVO {
	private String member_id;
	private String team_name;
	private String member_position;
	private String height;
	private String weight;
	private String footSize;
	private String wingspan;
	private String sergeant;
	
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
	public String getMember_position() {
		return member_position;
	}
	public void setMember_position(String member_position) {
		this.member_position = member_position;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getFootSize() {
		return footSize;
	}
	public void setFootSize(String footSize) {
		this.footSize = footSize;
	}
	public String getWingspan() {
		return wingspan;
	}
	public void setWingspan(String wingspan) {
		this.wingspan = wingspan;
	}
	public String getSergeant() {
		return sergeant;
	}
	public void setSergeant(String sergeant) {
		this.sergeant = sergeant;
	}
	
}
