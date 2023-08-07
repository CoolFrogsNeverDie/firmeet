package com.firmeet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.BoardDAO;
import com.firmeet.dao.ClubDao;
import com.firmeet.dao.ReplyDAO;
import com.firmeet.vo.BoardVO;
import com.firmeet.vo.ClubVo;
import com.firmeet.vo.ReplyVO;

@Service
public class BoardService {

	@Autowired
	ClubDao clubDAO;
	@Autowired
	BoardDAO boardDAO;
	@Autowired
	ReplyDAO replyDAO; 
	
	/*동호회 게시물 가져오기*/
	public List<BoardVO> getClubBoard(BoardVO boardVO){
		System.out.println("getClubBoard()");
		
		List<BoardVO> boardList = boardDAO.getBoardList(boardVO);
		for(int i = 0; i<boardList.size(); i++) {
			boardList.get(i).setReplyList(boardDAO.getBoardComment(boardList.get(i).getBoardNo()));
		}
		
		return boardList;
	}

	
	/*마이다이어리 유저 boardInfo 받아오는 게시글*/
	public Map<String, Object> getPerBoardInfo(BoardVO boardVO){
		System.out.println("getPerBoardInfo()");
		Map<String, Object> boardInfoList = new HashMap<>();
		
		//동호회 목록
		List<ClubVo> joinList = clubDAO.getMemClub(boardVO.getMemberId());
		
		//내가 선택한 동호회 이름(카테고리명)
		String category = (boardVO.getClubId() == -99 )? "전체보기" : clubDAO.getClubName(boardVO);
		
				
		boardInfoList.put("joinList", joinList);
		boardInfoList.put("category", category);
		
		return boardInfoList;
	}
	
	/*개인 게시판 게시물 받아오기*/
	public List<BoardVO> getPerBoard(BoardVO boardVO){
		System.out.println("getPerBoard()");
		
		List<BoardVO> boardList = boardDAO.getBoardList(boardVO);
		for(int i = 0; i<boardList.size(); i++) {
			boardList.get(i).setReplyList(boardDAO.getBoardComment(boardList.get(i).getBoardNo()));
		}
		
		return boardList;
	}
	
	/*댓글 달기*/
	public ReplyVO addReply(ReplyVO replyVO) {
		System.out.println("addReply()");
		
		
		replyDAO.insertReply(replyVO);
		ReplyVO returnVO = replyDAO.getReply(replyVO);
		
		
		return returnVO;
	}
	
	/*리댓글 달기*/
	public ReplyVO addReply2(ReplyVO replyVo) {
		System.out.println("addReply2()");
		
		replyDAO.insertReply(replyVo);
		ReplyVO returnVO = replyDAO.getReply(replyVo);
		return returnVO;
	}
	
	/*댓글 삭제*/
	public boolean deleteReply(ReplyVO replyVO) {
		System.out.println("deleteReply()");
		
		boolean result = false;
		
		/* cnt 0 이면 지울수 있다 */ /* cnt 0이 아니면 지울수 없다 */ 
		int checkCnt = (replyVO.getDeep() == 1)?replyDAO.checkReply(replyVO):0;
		//딸린 자식들이 있다는 뜻
		
		if(checkCnt>0) {
			replyDAO.updateReplyStat(replyVO);
		}else {
			replyDAO.deleteReply(replyVO);
			result =true;
		}
		return result;
	}

	/*게시글 작성*/
	public void boardwrite(BoardVO boardVO) {
		System.out.println("boardwrite()");
		boardDAO.insertBoard(boardVO);
	}

	/*board 정보 가져오기*/
	public BoardVO getBoard(BoardVO boardVO) {
		System.out.println("getBoard()");
		return boardDAO.getBoard(boardVO);
	}

	/*게시물 수정*/
	public int editBoard(BoardVO boardVO) {
		System.out.println("editBoard()");
		return boardDAO.updateBoard(boardVO);
	}

	/*게시물 삭제*/
	public int deleteBoard(BoardVO boardVO) {
		System.out.println("deleteBoard()");
		return boardDAO.deleteBoard(boardVO);
	}
	
	/*게시물 좋아요 누르기*/
	public BoardVO likeCnt(BoardVO boardVO) {
		System.out.println("likeCnt()");
		
		BoardVO result = null;
		var like = boardVO.getLikeNo();
		if(like == 0) {
		//좋아요 기능 수행	
			boardDAO.insertLike(boardVO);
			result = boardDAO.getLike(boardVO);
			
		}else {
		//좋아요 취소 기능 수행
			boardDAO.likeCancle(boardVO);
		}
		
		return result;
	}
	
}
