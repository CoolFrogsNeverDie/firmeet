package com.firmeet.service;

import org.springframework.stereotype.Service;

import com.firmeet.vo.MemberVo;

@Service
public class MemberService {

	public void join(MemberVo memberVo) {
		System.out.println("MemberService.join()");
		System.out.println(memberVo);
	}
	
}
