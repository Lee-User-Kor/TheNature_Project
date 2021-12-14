package com.thenature.webtoon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.comment.CommentVO;
import com.thenature.common.Paging;

@Service
public class WebtoonDetailSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<WebtoonDetailVO> adminWebtoonList(Paging pag) {
		return sqlSession.selectList("adminWebtoonList", pag);
	}

	public void writeWebtoonDetail(WebtoonDetailVO wdvo) {
		sqlSession.insert("writeWebtoonDetail", wdvo);
	}

	public List<WebtoonDetailVO> selectRecentWebtoonDetail() {
		return sqlSession.selectList("selectRecentWebtoonDetail");
	}

	public List<WebtoonDetailVO> selectWebtoonDetailList(Paging pag) {
		return sqlSession.selectList("selectWebtoonDetailList", pag);
	}

	public WebtoonDetailVO selectWebtoonDetail(WebtoonDetailVO wdVO) {
		return sqlSession.selectOne("selectWebtoonDetail", wdVO);
	}

	public int maxRound(WebtoonDetailVO wdVO) {
		return sqlSession.selectOne("maxRound", wdVO);
	}

	public void plusViewCntWebtoonDetail(WebtoonDetailVO wdVO) {
		sqlSession.update("plusViewCntWebtoonDetail", wdVO);
	}

	public int countContentsWebtoonDetail() {
		return sqlSession.selectOne("countContentsWebtoonDetail");
	}

	public void webtoonDelete(String check) {
		sqlSession.delete("webtoonDelete", check);
	}

	public int webtoonDeleteCnt(String check) {
		return sqlSession.selectOne("webtoonDeleteCnt", check);
	}
	
	public List<WebtoonDetailVO> selectByEachWebtoonForHome(WebtoonVO webtoonVO) {
		return sqlSession.selectList("selectByEachWebtoonForHome", webtoonVO);
	}

	public WebtoonDetailVO findWebtoonDetailByCmt(CommentVO cmtVO) {
		return sqlSession.selectOne("findWebtoonDetailByCmt", cmtVO);
	}

	public List<WebtoonDetailVO> selectTitleWebtoonDetail() {
		return sqlSession.selectList("selectTitleWebtoonDetail");
	}

	public WebtoonDetailVO findWebtoonByIdx(String webtoon_detail_idx) {
		return sqlSession.selectOne("findWebtoonByIdx", webtoon_detail_idx);
	}

	public void updateWebtoonNoFile(WebtoonDetailVO wdVO) {
		sqlSession.update("updateWebtoonNoFile", wdVO);
	}

	public void updateWebtoonWithThumbnail(WebtoonDetailVO wdVO) {
		sqlSession.update("updateWebtoonWithThumbnail", wdVO);
	}

	public void updateWebtoonWithContent(WebtoonDetailVO wdVO) {
		sqlSession.update("updateWebtoonWithContent", wdVO);
	}

	public void updateWebtoonWithFiles(WebtoonDetailVO wdVO) {
		sqlSession.update("updateWebtoonWithFiles", wdVO);
	}

}
