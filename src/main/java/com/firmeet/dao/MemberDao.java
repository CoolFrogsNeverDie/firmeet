package com.firmeet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.MemberVo;
import com.firmeet.vo.TagVo;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlsession;
	
	public void insert(MemberVo memberVo){
		System.out.println("MemberDao.insert()");
		System.out.println(memberVo);
		sqlsession.insert("member.insertMem",memberVo);
	
	}
	
	public void insert(CategoryVo cateVo) {
		sqlsession.insert("member.insertMemCate",cateVo);
	}
	
	public void insert(TagVo tagVo) {
		sqlsession.insert("member.insetMemTag",tagVo);
	}
	
	public MemberVo selectMem(MemberVo memberVo) {
		MemberVo member = sqlsession.selectOne("member.selectMem", memberVo);
		return member;
	}
	
	public MemberVo selectMem(String id) {
		MemberVo memberVo = sqlsession.selectOne("member.selectMemId",id);
		return memberVo;
	}
}
