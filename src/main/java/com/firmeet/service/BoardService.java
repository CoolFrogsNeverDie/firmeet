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
	
	public List<BoardVO> getClubBoard(BoardVO boardVO){
		//받아온 정보로 boardList 가져올 거임
		
		List<BoardVO> boardList = boardDAO.getBoardList(boardVO);
		System.out.println(boardList + "clubBoard 넘어오는가요?!!!");
		for(int i = 0; i<boardList.size(); i++) {
			boardList.get(i).setReplyList(boardDAO.getBoardComment(boardList.get(i).getBoardNo()));
		}
		
		return boardList;
	}

	
	//board 정보를 불러오는 메서드
	//필요한 정보 : 내가 가입한 동호회 목록, 내가 선택한 동호회의 이름
	public Map<String, Object> getPerBoardInfo(BoardVO boardVO){
		Map<String, Object> boardInfoList = new HashMap<>();
		
		//동호회 목록
		List<ClubVo> joinList = clubDAO.getMemClub(boardVO.getMemberId());
		System.out.println("받아온 club 가입 리스트" + joinList);
		
		//내가 선택한 동호회 이름(카테고리명)
		String category = (boardVO.getClubId() == -99 )? "전체보기" : clubDAO.getClubName(boardVO);
		
				
		boardInfoList.put("joinList", joinList);
		boardInfoList.put("category", category);
		
		return boardInfoList;
	}
	
	public List<BoardVO> getPerBoard(BoardVO boardVO){
		//받아온 정보로 boardList 가져올 거임
		
		List<BoardVO> boardList = boardDAO.getBoardList(boardVO);
		for(int i = 0; i<boardList.size(); i++) {
			boardList.get(i).setReplyList(boardDAO.getBoardComment(boardList.get(i).getBoardNo()));
		}
		
		return boardList;
	}
	
	
	public ReplyVO addReply(ReplyVO replyVO) {
		
		replyDAO.insertReply(replyVO);
		System.out.println("insert 후 정보 확인 " + replyVO);
		
		ReplyVO returnVO = replyDAO.getReply(replyVO);
		
		System.out.println("넘어온 댓글 객체 확인 : " + returnVO);
		
		return returnVO;
	}
	
	public ReplyVO addReply2(ReplyVO replyVo) {
		
		replyDAO.insertReply(replyVo);
		ReplyVO returnVO = replyDAO.getReply(replyVo);
		return returnVO;
	}
	
	public boolean deleteReply(ReplyVO replyVO) {
		boolean result = false;
		
		/* cnt 0 이면 지울수 있다 */ /* cnt 0이 아니면 지울수 없다 */ 
		int checkCnt = (replyVO.getDeep() == 1)?replyDAO.checkReply(replyVO):0;
		System.out.println(checkCnt  +"deep 확인 결과는");
		//딸린 자식들이 있다는 뜻
		
		if(checkCnt>0) {
			System.out.println("삭제X");
			replyDAO.updateReplyStat(replyVO);
		}else {
			replyDAO.deleteReply(replyVO);
			result =true;
			System.out.println("딸린 자식 없는 아이 삭제");
		}
			
		return result;
	}
	
}
