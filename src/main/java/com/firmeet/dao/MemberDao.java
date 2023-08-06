package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.CategoryVo;
import com.firmeet.vo.ClubMemVo;
import com.firmeet.vo.ClubVo;
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
	
	public void insertMemCate(CategoryVo cateVo) {
		sqlsession.insert("member.insertMemCate",cateVo);
	}
	
	public void insertMemTag(TagVo tagVo) {
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

	public List<MemberVo> requestMemList(MemberVo memberVO) {
		
		List<MemberVo> memberList = sqlsession.selectList("member.requestMemList", memberVO);
		System.out.println("받아온 정보"  + memberList + "h확인ㅇ나ㅓㅇ니멍") ;
		return memberList;
	}

	public List<TagVo> getTagList(MemberVo vo) {
		
		List<TagVo> tagList = sqlsession.selectList("member.getMemTagList",vo);
		
		return tagList;
	}

	public int updateMemLevel(ClubVo clubVO) {
		int row = sqlsession.update("member.updateMemLevel", clubVO);
		return row;
	}

	public int deleteClubMem(ClubVo clubVO) {
		
		int row = sqlsession.delete("member.deleteClubMem", clubVO);
		
		return row;
	}

	public List<MemberVo> getClubMemList(MemberVo memberVO) {
		
		List<MemberVo> memberList = sqlsession.selectList("member.clubMemList", memberVO);
		return memberList;
	}

	public int updateMemGrade(MemberVo memberVO) {
		System.out.println("여기까지 오는지 확인 업데이트용" + memberVO);
		int row = sqlsession.update("member.changeMemLevel", memberVO);
		System.out.println("업데이트 여부 확인 " + row);
		return row;
	}

	public int plusClubPreNum(ClubVo clubVO) {
		int row =  sqlsession.update("member.plusClubPreNum", clubVO);
		System.out.println("가입여부 확인");
		return row;
	}

	public int  minusClubPreNum(ClubVo clubVO) {
		int rwo = sqlsession.update("member.minusClubPreNum", clubVO);
		System.out.println("넘어오는 값" + clubVO);
		return rwo;
	}

	public int myClubDel(ClubMemVo clubVO) {
		int row =sqlsession.delete("member.myClubDel",clubVO);
		System.out.println("넘어오는 값" + row);
		
		return row;
	}


}
