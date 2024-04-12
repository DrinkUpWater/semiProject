package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo; //번호
	private String userId; //아이디
	private String userPwd; //비번
	private String userName; //이름
	private String nickname; //닉네임
	private String gender; //성별
	private String phone; //휴대폰번호
	private String birth; //생일
	private String email; //이메일
	private Date joinDate; //가입일
	private Date outerDate; //탈퇴일
	private String outerStatus; // 탈퇴상태
	private String host; // 호스트
	private String admin; //관리자
	
	public Member() {
		super();
	}
	

	public Member(int userNo, String userId, String userPwd, String userName, String nickname, String gender,
			String phone, String birth, String email) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.gender = gender;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
	}




	public Member(int userNo, String userId, String userPwd, String userName, String nickname, String gender,
			String phone, String birth, String email, Date joinDate, Date outerDate, String outerStatus, String host,
			String admin) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.gender = gender;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.joinDate = joinDate;
		this.outerDate = outerDate;
		this.outerStatus = outerStatus;
		this.host = host;
		this.admin = admin;
	}

	


	public Member(String userId, String userPwd, String userName, String nickname, String gender, String phone,
			String birth, String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.gender = gender;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
	}


	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getOuterDate() {
		return outerDate;
	}

	public void setOuterDate(Date outerDate) {
		this.outerDate = outerDate;
	}

	public String getOuterStatus() {
		return outerStatus;
	}

	public void setOuterStatus(String outerStatus) {
		this.outerStatus = outerStatus;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", nickname=" + nickname + ", gender=" + gender + ", phone=" + phone + ", birth=" + birth + ", email="
				+ email + ", joinDate=" + joinDate + ", outerDate=" + outerDate + ", outerStatus=" + outerStatus
				+ ", host=" + host + ", admin=" + admin + "]";
	}
	
	
	
	
	
}
