package com.thenature.image;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.community.CommunityVO;


@Service
public class ImageSvc {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void writeCommunityImage(ImageVO iVO) {
		sqlSession.insert("writeCommunityImage", iVO);
	}

	public ImageVO selectCommunityDetailImage(Object obj) {
		return sqlSession.selectOne("selectCommunityDetailImage", obj);
	}
	
	public List<ImageVO> selectCommentaryDetailImage(Object obj) {
		return sqlSession.selectList("selectCommentaryDetailImage", obj);
	}

	public ImageVO selectCommunityImgForHome(CommunityVO cvo) {
		return sqlSession.selectOne("selectCommunityImgForHome", cvo);
	}
	
	public void addTcImage(ImageVO iVO) {
		sqlSession.insert("addTcImage", iVO);
	}

	public ImageVO findCommunityImageForModi(String community_idx) {
		return sqlSession.selectOne("findCommunityImageForModi", community_idx);
	}

	public void updateCommunityImage(ImageVO iVO) {
		sqlSession.update("updateCommunityImage", iVO);
	}

	public List<ImageVO> imageList() {
		return sqlSession.selectList("imageList");
	}

	public void updateTreeCommentaryWithImage(ImageVO iVO) {
		sqlSession.update("updateTreeCommentaryWithImage", iVO);
	}

	public List<ImageVO> selectOneIdx(int updateIdx) {
		return sqlSession.selectList("selectOneIdx", updateIdx);
	}

	public List<ImageVO> findCommuImageList(int idx) {
		return sqlSession.selectList("findCommuImageList", idx);
	}
}
