package com.kh.member.service;

import java.sql.Connection;
import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.space.service.SpaceReservationService;

public class MemberService {

	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn,m);
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn,userId,userPwd);
		close(conn);
		return m;
	}

	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int result =new MemberDao().idCheck(conn,checkId);
		close(conn);
		return result;
	}

	public String findPwd(String userId, String phone, String email) {
		Connection conn = getConnection();
		String result = new MemberDao().findPwd(conn,userId,phone,email);
		close(conn);
		return result;
	}

	
	public Member updateMember(Member m) {
		Connection conn =getConnection();
		int result =new MemberDao().updateMember(conn, m);
		Member updateMem = null;
		if(result>0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		}
		else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public Member updatePwdMember(Member m, String oldPwd,String newPwd) {
		Connection conn = getConnection();
		int resultCk =new MemberDao().checkPwdMember(conn,m,oldPwd);
		Member updateMem= null;		
		if(resultCk==0) { //비밀번호가 동일하지않으면 바로 컷
			return updateMem;
		}
		
		int result = new MemberDao().updatePwdMember(conn,m,newPwd);
		if(result>0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		}
		else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public int deleteMember(String userId) {
		Connection conn =getConnection();
		int result = new MemberDao().deleteMember(conn,userId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int pwdCheck(String userId, String checkPwd) {
		Connection conn =getConnection();
		int count =new MemberDao().pwdCheck(conn,userId,checkPwd);
		if(count>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return count;
	}

	
	

}
