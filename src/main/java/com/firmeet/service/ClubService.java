package com.firmeet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.ClubDao;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.TagVo;

@Service
public class ClubService {

	@Autowired
	private ClubDao clubDao;	
	
	public void make(ClubVo clubVo, CategoryVo cateVO, TagVo tagVo) {
		System.out.println("ClubService.make()");
		System.out.println(clubVo);
		clubDao.insertClub(clubVo);
		
		cateVO.setClubId(clubVo.getClubId());
		clubDao.insertCate(cateVO);
		
		tagVo.setClubId(clubVo.getClubId());
		clubDao.insertTag(tagVo);
		
		}
	
	public void clubJoin(ClubVo clubVo , MemberVo memberVo){
		clubDao.clubJoinMem(clubVo,memberVo);
	}

	public List<ClubVo> getMemClub(String memberId) {
		List<ClubVo> clubVos = clubDao.getMemClub(memberId);
		
		return clubVos;
	}
}

