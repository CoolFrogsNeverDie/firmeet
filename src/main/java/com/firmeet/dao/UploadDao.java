package com.firmeet.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.UploadVo;

@Repository
public class UploadDao {
 
	private SqlSession session;
	
	public void insert(UploadVo uploadVo) {
		session.insert(" upload.insertMainImg", uploadVo);
	}
}
