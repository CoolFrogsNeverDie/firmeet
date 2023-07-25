package com.firmeet.service;

import java.util.List;

import javax.annotation.processing.SupportedSourceVersion;

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
	
	public void make(ClubVo clubVo , MemberVo memberVo) {
		System.out.println("ClubService.make()");
		System.out.println(clubVo);
		
		
		
		clubDao.insertClub(clubVo);
		
		System.out.println("클럽 아이디  확인 " + clubVo.getClubId());
		
		for(int i=0; i<clubVo.tagNo.length;i++) {
			TagVo tagVo = new TagVo();
			tagVo.setClubId( clubVo.getClubId());
			tagVo.setTagNo(clubVo.tagNo[i]);
			clubDao.insertClubTag(tagVo);
		}
		
		CategoryVo cateVo = new CategoryVo();
		cateVo.setClubId(clubVo.getClubId());
		cateVo.setCateNo(clubVo.getCateNo());
		clubDao.insertClubCate(cateVo);
		
		ClubMemVo clubMemVo = new ClubMemVo();
		clubMemVo.setClubId(clubVo.getClubId());
		clubMemVo.setMemberId(memberVo.getMemberId());
		System.out.println(clubMemVo);
		clubDao.insertAdmin(clubMemVo);
		
		
		
		/*
		 * cateVO.setClubId(clubVo.getClubId()); clubDao.insertCate(cateVO);
		 * 
		 * tagVo.setClubId(clubVo.getClubId()); clubDao.insertTag(tagVo);
		 * 
		 * clubMemVo.setClubId(clubVo.getClubId()); clubDao.insertAdmin(clubMemVo);
		 */
		}
	public List<ClubVo> clubList(int clubId) {
		List<ClubVo> clubVo = clubDao.clubList(clubId);
		return clubVo;
	}
	
	public void clubJoin(ClubVo clubVo , MemberVo memberVo ,ClubMemVo clubMemVo){
		clubDao.clubJoinMem(clubVo,memberVo);
	}

	public List<ClubVo> getMemClub(String memberId) {
		List<ClubVo> clubVos = clubDao.getMemClub(memberId);
		
		return clubVos;
	}
	
	public void adminMem(String id) {
		System.out.println("ClubService.adminMem");
	}

	public ClubVo getClubVo(int clubId) {
		ClubVo clubVo = clubDao.getClubVo(clubId);
		return clubVo;
	}
	
	public TagVo selectTag(int tagNo) {
		TagVo selectedTag = clubDao.selectTag(tagNo);
		
		return selectedTag;
	}
}

