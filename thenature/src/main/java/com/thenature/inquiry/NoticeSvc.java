package com.thenature.inquiry;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;

@Service
public class NoticeSvc {

	@Autowired SqlSessionTemplate sqlSession;

	public int countContents() {
		return sqlSession.selectOne("countContents");
	}

	public List<NoticeVO> getAllNotice(Paging pag) {
		return sqlSession.selectList("getAllNotice", pag);
	}

	public int countContentsBySearch(String search_keyword) {
		return sqlSession.selectOne("countContentsBySearch", search_keyword);
	}

	public List<NoticeVO> getSearchNotice(Paging pag) {
		return sqlSession.selectList("getSearchNotice", pag);
	}

	public NoticeVO getDetailNotice(Object obj) {
		return sqlSession.selectOne("getDetailNotice", obj);
	}

	public int plusDetailNoticeCount(NoticeVO nVO) {
		return sqlSession.update("plusDetailNoticeCount", nVO);
	}

	public int getLastIdx() {
		return sqlSession.selectOne("getLastIdx");
	}
	
	public int addNotice(NoticeVO nVO) {
		return sqlSession.insert("addNotice", nVO);
	}

	public int modifyNotice(NoticeVO nVO) {
		return sqlSession.update("modifyNotice", nVO);
	}

	public void deleteNotice(String check) {
		sqlSession.delete("deleteNotice", check);
	}

	public int deleteNoticeCnt(String check) {
		return sqlSession.selectOne("deleteNoticeCnt", check);
	}
}
