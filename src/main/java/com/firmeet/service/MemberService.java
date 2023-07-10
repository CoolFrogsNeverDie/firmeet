package com.firmeet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.MemberDao;
import com.firmeet.vo.MemberVo;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	public void join(MemberVo memberVo) {
		System.out.println("MemberService.join()");
		System.out.println(memberVo);
		memberDao.insert(memberVo);
		
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
