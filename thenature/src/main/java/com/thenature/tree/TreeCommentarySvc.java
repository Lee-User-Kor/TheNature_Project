package com.thenature.tree;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;

@Service
public class TreeCommentarySvc {

	@Autowired SqlSessionTemplate sqlSession;
	
	public List<TreeCommentaryVO> tcList(Paging pag) {
		return sqlSession.selectList("tcList", pag);
	}

	public int countContentsTc() {
		return sqlSession.selectOne("countContentsTc");
	}

	public TreeCommentaryVO getDetailCommentary(Object obj) {
		return sqlSession.selectOne("getDetailCommentary", obj);
	}

	public int countTreeCommentary() {
		return sqlSession.selectOne("countTreeCommentary");
	}

	public TreeCommentaryVO getRandomVO(Object obj) {
		return sqlSession.selectOne("getRandomVO", obj);
	}
	
	public void writeTc(TreeCommentaryVO tcVO) {
		sqlSession.insert("writeTc", tcVO);
	}

	public int findTcIdx() {
		return sqlSession.selectOne("findTcIdx");
	}

	public void writeTcWithoutAudio(TreeCommentaryVO tcVO) {
		sqlSession.insert("writeTcWithoutAudio", tcVO);
	}

	public void deleteCommentary(String check) {
		sqlSession.delete("deleteCommentary", check);
	}

	public int deleteCommentaryCnt(String check) {
		return sqlSession.selectOne("deleteCommentaryCnt", check);
	}

	public void updateTreeCommentaryNoFile(TreeCommentaryVO tcVO) {
		sqlSession.update("updateTreeCommentaryNoFile", tcVO);
	}

	public void updateTreeCommentaryWithThumbnail(TreeCommentaryVO tcVO) {
		sqlSession.update("updateTreeCommentaryWithThumbnail", tcVO);
	}

	public void updateTreeCommentaryWithAudio(TreeCommentaryVO tcVO) {
		sqlSession.update("updateTreeCommentaryWithAudio", tcVO);
	}

	public List<TreeCommentaryVO> commentaryList() {
		return sqlSession.selectList("commentaryList");
	}

	public void updateTreeCommentaryThumbnailAudio(TreeCommentaryVO tcVO) {
		sqlSession.update("updateTreeCommentaryThumbnailAudio", tcVO);
	}
}
