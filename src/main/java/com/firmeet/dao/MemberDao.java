package com.firmeet.dao;

import org.springframework.stereotype.Repository;

import com.firmeet.vo.MemberVo;

@Repository
public class MemberDao {

	public void insert(MemberVo memberVo){
		System.out.println("MemberDao.insert()");
		System.out.println(memberVo);
	}
}
