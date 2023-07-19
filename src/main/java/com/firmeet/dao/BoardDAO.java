package com.firmeet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.firmeet.vo.BoardVO;
import com.firmeet.vo.ReplyVO;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession session;
	
	public List<BoardVO> getPerBList(BoardVO boardVO){
		
		List<BoardVO> boardList = session.selectList("board.getPerBoard",boardVO);
		System.out.println("DAO까찌 오는지 확인" + boardList);
		return boardList;
	}

	public List<ReplyVO> getBoardComment(int boardNo){
		
		List<ReplyVO> commentList = session.selectList("board.getComment",boardNo);
		
		return commentList;
	}
	
	public List<BoardVO> getBoardList(BoardVO boardVO){
		
		System.out.println("DAO까지 오는지 확인" + boardVO);
		List<BoardVO> boardList = session.selectList("board.getBoard", boardVO);
		System.out.println("AJAX로 넘어온 리스트" + boardList);
		
		return boardList;
	}
	
	
}
