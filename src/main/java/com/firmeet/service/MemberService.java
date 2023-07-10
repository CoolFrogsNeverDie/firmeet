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
	
}
