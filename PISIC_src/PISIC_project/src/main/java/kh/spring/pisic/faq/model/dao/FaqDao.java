package kh.spring.pisic.faq.model.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.pisic.faq.domain.FaqBoard;
import kh.spring.pisic.faq.model.service.FaqServiceImpl;
import kh.spring.pisic.faq.domain.FaqBoard;

@Repository

public class FaqDao {
	@Autowired
	private SqlSession sqlSession;

	//자주묻는질문 목록
	public List<FaqBoard> selectFaqList() {
			return sqlSession.selectList("FaqBoard.selectFaqList");
	}
//	public FaqBoard selectFaq(String faq_num) {
//		return sqlSession.selectOne("FaqBoard.selectFaq", faq_num);
//	}
}