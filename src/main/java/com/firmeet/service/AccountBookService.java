package com.firmeet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.AccountBookDao;
import com.firmeet.vo.AccountBookVo;

@Service
public class AccountBookService {

	@Autowired
	private AccountBookDao accountBookDao;

	public List<AccountBookVo> getList(int clubId) {
		System.out.println("AccountBookService getList 확인");
		List<AccountBookVo> aList = accountBookDao.getList(clubId);
		
		return aList;
	}
	
}
