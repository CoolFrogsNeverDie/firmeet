package com.firmeet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.ClubDao;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubMemVo;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.TagVo;

@Service
public class ClubService {

	@Autowired
	private ClubDao clubDao;	
	
	public void make(ClubVo clubVo, CategoryVo cateVO, TagVo tagVo, ClubMemVo clubMemVo) {
		System.out.println("ClubService.make()");
		System.out.println(clubVo);
		clubDao.insertClub(clubVo);
		
		cateVO.setClubId(clubVo.getClubId());
		clubDao.insertCate(cateVO);
		
		tagVo.setClubId(clubVo.getClubId());
		clubDao.insertTag(tagVo);
		
		clubMemVo.setClubId(clubVo.getClubId());
		clubDao.insertAdmin(clubMemVo);
		
		}
	
	public void clubJoin(ClubVo clubVo , MemberVo memberVo ,ClubMemVo clubMemVo){
		clubDao.clubJoinMem(clubVo,memberVo);
	}

	public List<ClubVo> getMemClub(String memberId) {
		List<ClubVo> clubVos = clubDao.getMemClub(memberId);
		
		return clubVos;
	}
}

