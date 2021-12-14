package com.thenature.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointSvc {

	@Autowired SqlSessionTemplate sqlSession;
	
	public List<PointVO> selectMyPoint(MemberVO mVO) {
		return sqlSession.selectList("selectMyPoint", mVO);
	}

	public int addPoint(PointVO pVO) {
		return sqlSession.insert("addPoint", pVO);
	}

	public List<PointVO> findPlusByMember(MemberVO memberVO) {
		return sqlSession.selectList("findPlusByMember", memberVO);
	}

	public List<PointVO> findMinusByMember(MemberVO memberVO) {
		return sqlSession.selectList("findMinusByMember", memberVO);
	}
}
