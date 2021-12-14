package com.thenature.video;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thenature.common.Paging;

@Service
public class TreeVideoSvc {

	@Autowired SqlSessionTemplate sqlSession;
	
	public List<TreeVideoVO> treeVideoList(Paging pag) {
		return sqlSession.selectList("treeVideoList", pag);
	}

	public int countContentsTv() {
		return sqlSession.selectOne("countContentsTv");
	}

	public List<TreeVideoVO> selectTreeVideoForHome() {
		return sqlSession.selectList("selectTreeVideoForHome");
	}
	
	public void tvWrite(TreeVideoVO tvVO) {
		sqlSession.insert("tvWrite", tvVO);
	}

	public TreeVideoVO selectOneVideo(Object obj) {
		return sqlSession.selectOne("selectOneVideo", obj);
	}

	public void deleteVideo(String check) {
		sqlSession.delete("deleteVideo", check);
	}

	public int deleteVideoCnt(String check) {
		return sqlSession.selectOne("deleteVideoCnt", check);
	}

	public void tvWriteNoThumbnail(TreeVideoVO tvVO) {
		sqlSession.insert("tvWriteNoThumbnail", tvVO);
	}

	public void updateVideoNoFile(TreeVideoVO tvVO) {
		sqlSession.update("updateVideoNoFile", tvVO);
	}

	public void updateVideoWithThumbnail(TreeVideoVO tvVO) {
		sqlSession.update("updateVideoWithThumbnail", tvVO);
	}

	public void updateVideoWithVideo(TreeVideoVO tvVO) {
		sqlSession.update("updateVideoWithVideo", tvVO);
	}

	public void updateVideoWithFiles(TreeVideoVO tvVO) {
		sqlSession.update("updateVideoWithFiles", tvVO);
	}
	
}
