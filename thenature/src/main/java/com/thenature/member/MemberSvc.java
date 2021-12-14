package com.thenature.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;

@Service
public class MemberSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberVO checkId(String id) {
		return sqlSession.selectOne("checkId", id);
	}

	public void joinMemberAgreeAll(MemberVO mvo) {
		sqlSession.insert("joinMemberAgreeAll", mvo);
	}

	public void joinMemberAgreeSns(MemberVO mvo) {
		sqlSession.insert("joinMemberAgreeSns", mvo);
	}

	public void joinMemberAgreeEmail(MemberVO mvo) {
		sqlSession.insert("joinMemberAgreeEmail", mvo);
	}

	public void joinMemberAgreeNecessary(MemberVO mvo) {
		sqlSession.insert("joinMemberAgreeNecessary", mvo);
	}

	public MemberVO loginNormal(MemberVO mvo) {
		return sqlSession.selectOne("loginNormal", mvo);
	}

	public MemberVO loginProducer(MemberVO mvo) {
		return sqlSession.selectOne("loginProducer", mvo);
	}

	public void changeInfo(MemberVO mvo) {
		sqlSession.update("changeInfo", mvo);
	}

	public MemberVO selectUser(MemberVO mvo) {
		return sqlSession.selectOne("selectUser", mvo);
	}

	public void changePw(MemberVO mVO) {
		sqlSession.update("changePw", mVO);
	}
	
	public MemberVO findId(FindIdVO vo) {
		return sqlSession.selectOne("findId", vo);
	}

	public MemberVO findPw(FindPwVO vo) {
		return sqlSession.selectOne("findPw", vo);
	}

	public List<MemberVO> allMember() {
		return sqlSession.selectList("allMember");
	}

	public int countCommunity(MemberVO memberVO) {
		return sqlSession.selectOne("countCommunity", memberVO);
	}

	public int presentCheckCntByMember(MemberVO memberVO) {
		return sqlSession.selectOne("presentCheckCntByMember", memberVO);
	}

	public List<MemberVO> selectAllForAdmin(Paging pag) {
		return sqlSession.selectList("selectAllForAdmin", pag);
	}

	public void joinMemberAgreeNecessaryProducer(MemberVO mvo) {
		sqlSession.insert("joinMemberAgreeNecessaryProducer", mvo);
	}

	public void joinMemberAgreeSnsProducer(MemberVO mvo) {
		sqlSession.insert("joinMemberAgreeSnsProducer", mvo);
	}

	public void joinMemberAgreeEmailProducer(MemberVO mvo) {
		sqlSession.insert("joinMemberAgreeEmailProducer", mvo);
	}

	public void joinMemberAgreeAllProducer(MemberVO mvo) {
		sqlSession.insert("joinMemberAgreeAllProducer", mvo);
	}

	public int countContentsMember() {
		return sqlSession.selectOne("countContentsMember");
	}

	public void gradeUp(String chkVal) {
		sqlSession.update("gradeUp", chkVal);
	}

	public MemberVO checkAdmin(String chkVal) {
		return sqlSession.selectOne("checkAdmin", chkVal);
	}

	public void gradeDown(String chkVal) {
		sqlSession.update("gradeDown", chkVal);
	}

	public void dropMember(int memberIdx) {
		sqlSession.update("dropMember", memberIdx);
	}
	
	
}
