package kh.spring.pisic.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.qna.domain.QnaBoard;

@Repository
public class QnaDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	//1:1문의 목록
	public List<QnaBoard> selectQnaList(){
			return sqlsession.selectList("QnaBoard.selectQnaList");
	}

	

}