package com.thenature.liketable;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.community.CommunityVO;
import com.thenature.member.MemberVO;
import com.thenature.webtoon.WebtoonVO;

@Service
public class LikeTableSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int addLikeTable(LikeTableVO ltVO) {
		return sqlSession.insert("addLikeTable", ltVO);
	}

	public int deleteLikeTable(LikeTableVO ltVO) {
		return sqlSession.delete("deleteLikeTable", ltVO);
	}

	public List<LikeTableVO> findLikeForHomeCommunity(MemberVO mVO) {
		return sqlSession.selectList("findLikeForHomeCommunity", mVO);
	}

	public int addLikeTableWebtoon(LikeTableVO ltVO) {
		return sqlSession.insert("ajax_like_activate_webtoon", ltVO);
	}

	public int deleteLikeTableWebtoon(LikeTableVO ltVO) {
		return sqlSession.delete("deleteLikeTableWebtoon", ltVO);
	}

	public List<LikeTableVO> findLikeForHomeWebtoon(MemberVO mVO) {
		return sqlSession.selectList("findLikeForHomeWebtoon", mVO);
	}

	public int countLikeWebtoon(WebtoonVO webtoonVO) {
		return sqlSession.selectOne("countLikeWebtoon", webtoonVO);
	}

	public List<LikeTableVO> findLikeCommuDetail(MemberVO mVO) {
		return sqlSession.selectList("findLikeCommuDetail", mVO);
	}

	public int addLikeTableCommunity(LikeTableVO ltVO) {
		return sqlSession.insert("addLikeTableCommunity", ltVO);
	}

	public int deleteLikeTableCommunity(LikeTableVO ltVO) {
		return sqlSession.delete("deleteLikeTableCommunity", ltVO);
	}

	public LikeTableVO find_like(LikeTableVO likevo) {
		return sqlSession.selectOne("find_like", likevo);
	}
}
