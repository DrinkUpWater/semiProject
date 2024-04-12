package com.kh.member.service;

import java.sql.Connection;
import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

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
		return result;
	}

}
