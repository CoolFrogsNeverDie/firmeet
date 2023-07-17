package com.firmeet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.ClubDao;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.TagVo;

@Service
public class ClubService {

	@Autowired
	private ClubDao clubDao;	
	
	public void make(ClubVo clubVo, CategoryVo cateVO) {
		System.out.println("ClubService.make()");
		System.out.println(clubVo);
		clubDao.insertClub(clubVo);
		cateVO.setClubId(clubVo.getClubId());
		
		}
	
	public void make( int cateNo) {
		System.out.println("ClubService.make()");
		CategoryVo cateVo = clubDao.selectCate(cateNo);
		clubDao.insertClub(cateVo);		
		}
	public void make(
			TagVo tagVo) {
		System.out.println("ClubService.make()");
		clubDao.selectTag(tagVo);
		clubDao.insertClub(tagVo);
		
		}
}
