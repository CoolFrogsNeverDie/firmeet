package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.GalleryVo;
import com.firmeet.vo.ScheduleVO;

@Repository
public class GalleryDao {
	
	@Autowired
	private SqlSession session;

	// 갤러리 등록된 미팅 정보 조회
	public List<ScheduleVO> getMeet(int clubId) {
		System.out.println("GalleryDao getMeet 확인");
		System.out.println(clubId);
		
	    List<ScheduleVO> sList = session.selectList("accountbook.meetList", clubId);
	    
	    System.out.println("돌아온 아이 " + sList);
		
		return sList;
	}

	// 갤러리 번호 조회
	public int getGalleryNo(int meet) {
	    System.out.println("GalleryDao getGalleryNo 확인");
	    System.out.println(meet);
	    
	    Integer galleryNo = session.selectOne("gallery.getGalleryNo", meet);
	    System.out.println(galleryNo);
	    int galleryNoValue = galleryNo != null ? galleryNo.intValue() : 0;
	    System.out.println(galleryNoValue);
	    return galleryNoValue;
	}

	// 갤러리 이미지 등록
	public void upload(GalleryImgVo gImgVo) {
		System.out.println("GalleryDao upload 확인");
		session.insert("gallery.insertGalleryImage", gImgVo);
	}

	// 갤러리 이미지 목록 조회
	public List<GalleryImgVo> getGalleryImg(int GalleryNo) {
		System.out.println("GalleryDao getGalleryImg 확인");
		System.out.println("GalleryNo : "+GalleryNo);
		List<GalleryImgVo> gImgVos = session.selectList("gallery.getGalleryImg", GalleryNo);
		System.out.println(gImgVos);
		
		return null;
	}

	// 갤러리 목록 조회
	public List<GalleryVo> getGalleryList(int clubId) {
		System.out.println("GalleryDao getGalleryList 확인");
		System.out.println("clubId : "+clubId);
		
		List<GalleryVo> galleryVos = session.selectList("gallery.getGalleryList",clubId);
		System.out.println(galleryVos);
		
		return galleryVos;
	}
}
