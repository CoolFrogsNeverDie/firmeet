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
		
		List<ReplyVO> commentList = session.selectList("board.getComment",boardNo);
		
		return commentList;
	}
	
	public List<BoardVO> getBoardList(BoardVO boardVO){
		
		System.out.println("DAO까지 오는지 확인" + boardVO);
		List<BoardVO> boardList = session.selectList("board.getBoardList", boardVO);
		System.out.println("AJAX로 넘어온 리스트" + boardList);
		
		return boardList;
	}

	public void insertBoard(BoardVO boardVO) {
		
		System.out.println("넘어온 정보 확인" + boardVO);
		int row = session.insert("board.insertBoard", boardVO);
		
		
	}

	public BoardVO getBoard(BoardVO boardVO) {
			
		System.out.println("수정할 정보를 가져오기 위한 boardVO" + boardVO);
		BoardVO vo = session.selectOne("board.getBoard", boardVO);
		System.out.println("DB에서 가져온 board 정보  : " + vo);
		
		return vo;
	}

	public int updateBoard(BoardVO boardVO) {
		
		System.out.println("수정할 정보가 DAO까지 오는지 확인 " + boardVO);
		return session.update("board.updateBoard", boardVO);
	}

	public int deleteBoard(BoardVO boardVO) {
		
		System.out.println("DAO까지 오는지 확인!" + boardVO);
		
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
