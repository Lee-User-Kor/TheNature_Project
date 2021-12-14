package com.thenature.webtoon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;
import com.thenature.member.MemberVO;

@Service
public class WebtoonSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void writeWebtoon(WebtoonVO wvo) {
		sqlSession.insert("writeWebtoon", wvo);
	}

	public List<WebtoonVO> adminWriteDetail() {
		return sqlSession.selectList("adminWriteDetail");
	}

	public List<WebtoonVO> producerWriteDetail(MemberVO mVO) {
		return sqlSession.selectList("producerWriteDetail", mVO);
	}

	public List<WebtoonVO> treeWebtoon(Paging pag) {
		return sqlSession.selectList("treeWebtoon", pag);
	}

	public WebtoonVO selectWebtoonList(String title) {
		return sqlSession.selectOne("selectWebtoonList", title);
	}

	public List<WebtoonVO> selectWebtoonForHome() {
		return sqlSession.selectList("webtoonVOList");
	}

	public int countContentsWebtoon() {
		return sqlSession.selectOne("countContentsWebtoon");
	}
	
	public List<WebtoonVO> selectTitleWebtoon() {
		return sqlSession.selectList("selectTitleWebtoon");
	}
}
