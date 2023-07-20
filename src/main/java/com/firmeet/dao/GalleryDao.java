package com.firmeet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.GalleryImgVo;
import com.firmeet.vo.GalleryVo;
import com.firmeet.vo.MeetVo;
import com.firmeet.vo.ScheduleVO;

@Repository
public class GalleryDao {
	
	@Autowired
	private SqlSession session;

	// 갤러리 등록된 미팅 정보 조회
	public List<MeetVo> getMeet(int meetMon) {
		System.out.println("GalleryDao getMeet 확인");
		System.out.println(meetMon);
		
	    List<MeetVo> sList = session.selectList("gallery.meetList", meetMon);
	    
	    System.out.println("getMeet " + sList);
		
		return sList;
	}
	
	public List<MeetVo> getMeetMon(int clubId) {
		System.out.println("GalleryDao getMeetMon 확인");
		
		List<MeetVo> sList = session.selectList("gallery.meetMon", clubId);
		
		System.out.println("getMeetMon " + sList);
		
		return sList;
	}

	// 갤러리 번호 조회
	public int getGalleryNo(int meet) {
	    System.out.println("GalleryDao getGalleryNo 확인");
	    System.out.println(meet);
	    
	    Integer galleryNo = session.selectOne("gallery.getGalleryNo", meet);
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
		
		return gImgVos;
	}

	// 갤러리 목록 조회
	public List<GalleryVo> getGalleryList(int clubId) {
		System.out.println("GalleryDao getGalleryList 확인");
		System.out.println("clubId : "+clubId);
		
		List<GalleryVo> galleryVos = session.selectList("gallery.getGalleryList",clubId);
		System.out.println(galleryVos);
		
		return galleryVos;
	}

	public List<MeetVo> getMeetA(int clubId) {
		System.out.println("GalleryDao getMeetA 확인");
		
		List<MeetVo> sList = session.selectList("accountbook.meetList", clubId);
		
		return sList;
	}

	public List<MeetVo> getMeetName(int year, int month) {
		System.out.println("GalleryDao getMeetName 확인");
		
        Map<String, Integer> variableMap = new HashMap<>();
        variableMap.put("year", year);
        variableMap.put("month", month);
		
		List<MeetVo> galleryVos = session.selectList("gallery.getMeetName",variableMap);
		System.out.println(month+"GalleryDao getMeetName 확인: "+galleryVos);
		
		return galleryVos;
	}


}
