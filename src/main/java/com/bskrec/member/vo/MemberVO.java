package com.bskrec.member.vo;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_gender;
	private String member_nickname;
	private String member_birth_y;
	private String member_birth_m;
	private String member_birth_d;
	private String hp1;
	private String hp2;
	private String email1;
	private String email2;
	private String zipcode;
	private String roadAddress;
	private String jibunAddress;
	private String namujiAddress;
	private String member_kind;//0:일반회원, 1:팀장, 2:선수
	private String joinDate;
	private String del_yn;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_birth_y() {
		return member_birth_y;
	}
	public void setMember_birth_y(String member_birth_y) {
		this.member_birth_y = member_birth_y;
	}
	public String getMember_birth_m() {
		return member_birth_m;
	}
	public void setMember_birth_m(String member_birth_m) {
		this.member_birth_m = member_birth_m;
	}
	public String getMember_birth_d() {
		return member_birth_d;
	}
	public void setMember_birth_d(String member_birth_d) {
		this.member_birth_d = member_birth_d;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		if(email1 != null) {
			this.email1 = email1;			
		}else {
			this.email1 = "";
		}
		
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getNamujiAddress() {
		return namujiAddress;
	}
	public void setNamujiAddress(String namujiAddress) {
		this.namujiAddress = namujiAddress;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getMember_kind() {
		return member_kind;
	}
	public void setMember_kind(String member_kind) {
		this.member_kind = member_kind;
	}
}
