package com.thenature.community;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;
import com.thenature.member.MemberVO;

@Service
public class CommunitySvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<CommunityVO> selectMyPosting(MemberVO mVO) {
		return sqlSession.selectList("selectMyPosting", mVO);
	}

	public List<CommunityVO> selectCommunity(Paging pag) {
		return sqlSession.selectList("selectCommunity", pag);
	}

	public void writeCommunity(CommunityVO cvo) {
		sqlSession.insert("writeCommunity", cvo);
	}

	public CommunityVO findIdxForCommunity(CommunityVO cvo) {
		return sqlSession.selectOne("findIdxForCommunity", cvo);
	}

	public List<CommunityVO> selectRecentCommunity() {
		return sqlSession.selectList("selectRecentCommunity");
	}

	public CommunityVO selectCommunityDetail(Object obj) {
		return sqlSession.selectOne("selectCommunityDetail", obj);
	}

	public List<CommunityVO> selectCommunityForHome() {
		return sqlSession.selectList("selectCommunityForHome", sqlSession);
	}

	public int countContentsCommunity() {
		return sqlSession.selectOne("countContentsCommunity");
	}
	
	public int countContentsCommu() {
		return sqlSession.selectOne("countContentsCommu");
	}

	public void deleteCommunity(String check) {
		sqlSession.delete("deleteCommunity", check);
	}

	public int deleteCommunityCnt(String check) {
		return sqlSession.selectOne("deleteCommunityCnt", check);
	}

	public List<CommunityVO> selectTitleCommu() {
		return sqlSession.selectList("selectTitleCommu");
	}

	public int countContentsCommunityBySearch(String search_keyword) {
		return sqlSession.selectOne("countContentsCommunityBySearch", search_keyword);
	}

	public List<CommunityVO> selectSearchCommunity(Paging pag) {
		return sqlSession.selectList("selectSearchCommunity", pag);
	}

	public CommunityVO findCommunityByIdx(String community_idx) {
		return sqlSession.selectOne("findCommunityByIdx", community_idx);
	}

	public void updateCommunityByModi(CommunityVO cvo) {
		sqlSession.update("updateCommunityByModi", cvo);
	}
	
	public List<CommunityVO> selectMyPostingWithPag(Paging pag) {
		return sqlSession.selectList("selectMyPostingWithPag", pag);
	}

	public List<CommunityVO> selectCommunityList() {
		return sqlSession.selectList("selectCommunityList");
	}
	
}
