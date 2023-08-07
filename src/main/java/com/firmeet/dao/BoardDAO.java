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
	


	public List<ReplyVO> getBoardComment(int boardNo){
		
		return session.selectList("board.getComment",boardNo);
	}
	
	public List<BoardVO> getBoardList(BoardVO boardVO){
		
		return session.selectList("board.getBoardList", boardVO);
	}

	public int insertBoard(BoardVO boardVO) {
		
		return session.insert("board.insertBoard", boardVO);
	}

	public BoardVO getBoard(BoardVO boardVO) {
			
		return session.selectOne("board.getBoard", boardVO);
	}

	public int updateBoard(BoardVO boardVO) {
		
		return session.update("board.updateBoard", boardVO);
	}

	public int deleteBoard(BoardVO boardVO) {
		
		return 	session.delete("board.deleteBoard", boardVO);
	}

	public int  likeCancle(BoardVO boardVO) {
		return session.delete("board.deletelike",boardVO);
	}

	public void insertLike(BoardVO boardVO) {
		session.insert("board.insertLike",boardVO);
	}

	public BoardVO getLike(BoardVO boardVO) {
		return session.selectOne("board.getLike", boardVO);
	}
	
	
}
