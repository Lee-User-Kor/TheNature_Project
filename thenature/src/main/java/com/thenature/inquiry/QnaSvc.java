package com.thenature.inquiry;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;

@Service
public class QnaSvc {

	@Autowired SqlSessionTemplate sqlSession;
	
	public int countContentsQna() {
		return sqlSession.selectOne("countContentsQna");
	}

	public List<QnaVO> getAllQna(Paging pag) {
		return sqlSession.selectList("getAllQna", pag);
	}

	public int countContentsBySearchQna(String search_keyword) {
		return sqlSession.selectOne("countContentsBySearchQna", search_keyword);
	}

	public List<QnaVO> getSearchQna(Paging pag) {
		return sqlSession.selectList("getSearchQna", pag);
	}

	public QnaVO getDetailQna(Object obj) {
		return sqlSession.selectOne("getDetailQna", obj);
	}

	public List<QnaVO> selectRecentQna() {
		return sqlSession.selectList("selectRecentQna");
	}

	public int addQna(QnaVO qVO) {
		return sqlSession.insert("addQna", qVO);
	}

	public int modifyQna(QnaVO qVO) {
		return sqlSession.update("modifyQna", qVO);
	}

	public int deleteQna(Object obj) {
		return sqlSession.delete("deleteQna", obj);
	}
	
	public int addApply(QnaVO qVO) {
		return sqlSession.update("addApply", qVO);
	}
	
	public void qnaDelete(String check) {
		sqlSession.delete("qnaDelete", check);
	}

	public int qnaDeleteCnt(String check) {
		return sqlSession.selectOne("qnaDeleteCnt", check);
	}

	public int qnaDeleteApply(String check) {
		return sqlSession.update("qnaDeleteApply", check);
	}

	public int qnaDeleteApplyCnt(String check) {
		return sqlSession.selectOne("qnaDeleteApplyCnt", check);
	}

	public void qnaApplyModify(QnaVO qVO) {
		sqlSession.update("qnaApplyModify", qVO);
	}

}
