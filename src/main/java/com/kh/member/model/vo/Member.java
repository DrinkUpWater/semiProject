package com.kh.member.model.vo;

public class Member {
	private int userNo; //번호
	private String userId; //아이디
	private String userPwd; //비번
	private String userName; //이름
	private String nickname; //닉네임
	private String gender; //성별
	private String phone; //휴대폰번호
	private String birth; //새일
	private String email; //이메일
	private String status; //상태
	
	public Member() {
		super();
	}

	public Member(int userNo, String userId, String userPwd, String userName, String nickname, String gender,
			String phone, String birth, String email, String status) {
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
		this.status = status;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", nickname=" + nickname + ", gender=" + gender + ", phone=" + phone + ", birth=" + birth + ", email="
				+ email + ", status=" + status + "]";
	}
	
	
	
	
}
