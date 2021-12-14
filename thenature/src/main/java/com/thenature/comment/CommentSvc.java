package com.thenature.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;
import com.thenature.community.CommunityVO;
import com.thenature.webtoon.WebtoonDetailVO;

@Service
public class CommentSvc {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int communityDetailComment(CommentVO cmtVO) {
		return sqlSession.insert("communityDetailComment", cmtVO);
	}

	public CommentVO ajaxCommunityDetailComment(CommentVO cmtVO) {
		return sqlSession.selectOne("ajaxCommunityDetailComment", cmtVO);
	}

	public List<CommentVO> selectCommunityDetailCmt(Paging pag) {
		return sqlSession.selectList("selectCommunityDetailCmt", pag);
	}

	public int cmtModi(CommentVO cmtvo) {
		return sqlSession.update("cmtModi", cmtvo);
	}

	public int cmtDel(CommentVO cmtvo) {
		return sqlSession.delete("cmtDel", cmtvo);
	}

	public void plusViewCnt(CommunityVO cVO) {
		sqlSession.update("plusViewCnt", cVO);
	}

	public List<CommentVO> selectWebtoonDetailCmt(Paging pag) {
		return sqlSession.selectList("selectWebtoonDetailCmt", pag);
	}

	public List<CommentVO> selectRecentComment() {
		return sqlSession.selectList("selectRecentComment");
	}
	
	public int countContentsCmt() {
		return sqlSession.selectOne("countContentsCmt");
	}

	public List<CommentVO> allCommentList(Paging pag) {
		return sqlSession.selectList("allCommentList", pag);
	}

	public int countContentsWebtoonDetailComment(WebtoonDetailVO wdVO) {
		return sqlSession.selectOne("countContentsWebtoonDetailComment", wdVO);
	}

	public int countContentsCommunityComment(Object obj) {
		return sqlSession.selectOne("countContentsCommunityComment", obj);
	}
	
	public void commentDelete(String check) {
		sqlSession.delete("commentDelete", check);
	}

	public int commentDeleteCnt(String check) {
		return sqlSession.selectOne("commentDeleteCnt", check);
	}

	public void commentDeleteCommu(String check) {
		sqlSession.delete("commentDeleteCommu", check);
	}

	public void commentDeleteWebtoon(String check) {
		sqlSession.delete("commentDeleteWebtoon", check);
	}
	
	public int cntCommunityCmtForHome(CommunityVO cvo) {
		return sqlSession.selectOne("cntCommunityCmtForHome", cvo);
	}

	public int cntWebtoonDetailCmt(WebtoonDetailVO webtoonDetailVO) {
		return sqlSession.selectOne("cntWebtoonDetailCmt", webtoonDetailVO);
	}
	
	public void cmtDeleteAboutCommunity(String chkVal) {
		sqlSession.delete("cmtDeleteAboutCommunity", chkVal);
	}
}
