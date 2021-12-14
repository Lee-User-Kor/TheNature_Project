package com.thenature.tree;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;

@Service
public class TreeCardSvc {

	@Autowired SqlSessionTemplate sqlSession;
	
	public int countContentsCard() {
		return sqlSession.selectOne("countContentsCard");
	}

	public List<TreeCardVO> treeCardList() {
		return sqlSession.selectList("treeCardList");
	}

	public List<TreeCardVO> adminTreeCardList(Paging pag) {
		return sqlSession.selectList("adminTreeCardList", pag);
	}

	public void addTreeCard(TreeCardVO cardVO) {
		sqlSession.insert("addTreeCard", cardVO);
	}

	public TreeCardVO selectOneCard(String idx) {
		return sqlSession.selectOne("selectOneCard", idx);
	}

	public void modifyCardNoFile(TreeCardVO cardVO) {
		sqlSession.update("modifyCardNoFile", cardVO);
	}

	public void modifyCardWithImg(TreeCardVO cardVO) {
		sqlSession.update("modifyCardWithImg", cardVO);
	}

	public void deleteCard(String check) {
		sqlSession.delete("deleteCard", check);
	}

	public int deleteCardCnt(String check) {
		return sqlSession.selectOne("deleteCardCnt", check);
	}

	public List<String> findCategory(Paging pag) {
		return sqlSession.selectList("fineCategory", pag);
	}

	public List<TreeCardVO> findCategoryAllInfo(String string) {
		return sqlSession.selectList("findCategoryAllInfo", string);
	}

	public int countContentsCardCategory() {
		return sqlSession.selectOne("countContentsCardCategory");
	}

	public List<String> getCount() {
		return sqlSession.selectList("getCount");
	}

}
