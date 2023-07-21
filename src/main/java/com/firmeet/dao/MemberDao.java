package com.firmeet.dao;

import java.util.List;

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
		sqlsession.insert("member.insertMemTag",tagVo);
	}
	
	public MemberVo selectMem(MemberVo memberVo) {
		MemberVo member = sqlsession.selectOne("member.selectMem", memberVo);
		return member;
	}
	
	public MemberVo selectMem(String id) {
		MemberVo memberVo = sqlsession.selectOne("member.selectMemId",id);
		return memberVo;
	}
	
	public List<TagVo> tagList() {
		
		List<TagVo> tagList = sqlsession.selectList("member.tagList");
		return tagList;
	}
	
	public List<CategoryVo> cateList() {
		List<CategoryVo> cateList = sqlsession.selectList("member.cateList");
		return cateList;
	}
}
