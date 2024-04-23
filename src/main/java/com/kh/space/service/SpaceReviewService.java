package com.kh.space.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.space.model.dao.SpaceReviewDao;
import com.kh.space.model.vo.Review;

import static com.kh.common.JDBCTemplate.*;

public class SpaceReviewService {

	
	public ArrayList<Review> selectReviews(int spaceNum) {
	    Connection conn =getConnection();
	    ArrayList<Review> reviews =new SpaceReviewDao().selectReviews(conn,spaceNum);
	    
	    close(conn);
		return reviews ;
	}

	public int insertReviews(int userNo, int spaceNum,String content) {
	    Connection conn =getConnection();
	    int result =new SpaceReviewDao().insertReviews(conn,userNo,spaceNum,content);
	    if(result>0) {
	    	commit(conn);
	    } else {
	    	rollback(conn);
	    }
    	    		
	    return result;
	}

	public int deleteReview(int reviewNo, int userNo) {
		 Connection conn =getConnection();
		 int result=new SpaceReviewDao().deleteReviews(conn,reviewNo,userNo);
		 
		 if(result>0) {
		    commit(conn);
		 } else {
		    rollback(conn);
		 }
	      close(conn);	    		
		  return result;
	}
	

}
