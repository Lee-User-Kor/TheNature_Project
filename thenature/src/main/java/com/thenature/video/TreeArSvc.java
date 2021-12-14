package com.thenature.video;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;

@Service
public class TreeArSvc {

	@Autowired SqlSessionTemplate sqlSession;
	
	public int countContentsTa() {
		return sqlSession.selectOne("countContentsTa");
	}

	public List<TreeArVO> treeArList(Paging pag) {
		return sqlSession.selectList("treeArList", pag);
	}
	
	public void taWrite(TreeArVO taVO) {
		sqlSession.insert("taWrite", taVO);
	}

	public TreeArVO selectOneAr(Object obj) {
		return sqlSession.selectOne("selectOneAr", obj);
	}

	public void deleteAr(String check) {
		sqlSession.delete("deleteAr", check);
	}

	public int deleteArCnt(String check) {
		return sqlSession.selectOne("deleteArCnt", check);
	}

	public void updateArByModi(TreeArVO taVO) {
		sqlSession.update("updateArByModi", taVO);
	}

	public void updateArWithPath(TreeArVO taVO) {
		sqlSession.update("updateArWithPath", taVO);
	}
	
}
