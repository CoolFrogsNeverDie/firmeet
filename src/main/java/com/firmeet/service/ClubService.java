package com.firmeet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.ClubDao;
import com.firmeet.vo.ClubVo;

@Service
public class ClubService {

	
	private ClubDao clubDao;	
	
	public void make(ClubVo clubVo) {
		System.out.println("ClubService.make()");
		System.out.println(clubVo);
			
		}
}
