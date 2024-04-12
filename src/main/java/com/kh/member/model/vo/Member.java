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
	private Date modifyDate; //탈퇴일
	private String status; // 탈퇴상태
	private String host; // 호스트
	private String admin; //관리자
	
	public Member() {
		super();
	}

	public Member(int userNo, String userId, String userPwd, String userName, String nickname, String gender,
			String phone, String birth, String email, Date joinDate, Date modifyDate, String status, String host,
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
		this.modifyDate = modifyDate;
		this.status = status;
		this.host = host;
		this.admin = admin;
	}
	
	
	
	

	
	
	
	
	
	
}
