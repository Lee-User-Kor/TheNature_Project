package com.thenature.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PresentSvc {

	@Autowired SqlSessionTemplate sqlSession;
	
	public List<PresentVO> selectMyPresent(MemberVO mVO) {
		return sqlSession.selectList("selectMyPresent", mVO);
	}

	public int addPresent(int idx) {
		return sqlSession.insert("addPresent", idx);
	}
}
