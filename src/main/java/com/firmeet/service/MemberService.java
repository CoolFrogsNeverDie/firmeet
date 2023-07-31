package com.firmeet.service;

import java.util.List;

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
	
	public void join(MemberVo memberVo) {
		System.out.println("MemberService.join()");
		System.out.println(memberVo);
		memberDao.insert(memberVo);
		
		for(int i=0; i<memberVo.tagNo.length;i++) {
			TagVo tagVo =new TagVo();
			tagVo.setMemberId(memberVo.getMemberId());
			tagVo.setTagNo(memberVo.tagNo[i]);
			memberDao.insertMemTag(tagVo);
			
		}
		
		CategoryVo cateVo = new CategoryVo();
		cateVo.setMemberId(memberVo.getMemberId());
		cateVo.setCateNo(memberVo.getCateNo());
		memberDao.insertMemCate(cateVo);
		
		/*
		 * cateVo.setMemberId(memberVo.getMemberId()); memberDao.insert(cateVo);
		 * 
		 * tagVo.setMemberId(memberVo.getMemberId()); memberDao.insert(tagVo);
		 */
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
	
	public List<TagVo> tagList() {
		System.out.println("MemberService.tagList()");
		 	List<TagVo> tagList = memberDao.tagList();
		 	return tagList;
		
	}
	
	public List<CategoryVo> cateList() {
		
		List<CategoryVo> cateList = memberDao.cateList();
		return cateList;
	}

	public List<MemberVo> requestMemList(MemberVo memberVO) {
		
		List<MemberVo> list = memberDao.requestMemList(memberVO); 
		
		/*
		 * for(int i =0; i< list.size(); i++) { MemberVo vo = list.get(i);
		 * List<CategoryVo> cateList = memberDao.getCateList(vo);
		 * list.get(i).setCateList(); }
		 */
		
		
		return list;
	}
	
	
}
