package com.firmeet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.MemberDao;
import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.TagVo;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	public void join(MemberVo memberVo,  CategoryVo cateVo, TagVo tagVo) {
		System.out.println("MemberService.join()");
		System.out.println(memberVo);
		memberDao.insert(memberVo);
		
		
		cateVo.setMemberId(memberVo.getMemberId()); 
		memberDao.insert(cateVo);
		
		tagVo.setMemberId(memberVo.getMemberId());
		memberDao.insert(tagVo);
	}
	
	public MemberVo login(MemberVo memberVo) {
		System.out.println("MemberService.login()");
		System.out.println(memberVo);
		MemberVo member = memberDao.selectMem(memberVo);
		return member;
		
	}
	
	public boolean idcheck(String id) {
		System.out.println("MemberService.idcheck()");
		MemberVo memberVo = memberDao.selectMem(id);
		
		if(memberVo == null) {
			return true;
		}else {
			return false;
		}
	}
	
}
