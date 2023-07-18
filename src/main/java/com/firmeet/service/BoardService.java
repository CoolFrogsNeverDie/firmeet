package com.firmeet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firmeet.dao.BoardDAO;
import com.firmeet.dao.ClubDao;
import com.firmeet.vo.BoardVO;
import com.firmeet.vo.ClubVo;

@Service
public class BoardService {

	@Autowired
	ClubDao clubDAO;
	@Autowired
	BoardDAO boardDAO;
	
	//board 정보를 불러오는 메서드
	//필요한 정보 : 내가 가입한 동호회 목록 , 그 동호회에서 내가 작성한 글
	public Map<String, Object> getPerBoardInfo(BoardVO boardVO){
		Map<String, Object> boardInfoList = new HashMap<>();
		
		List<ClubVo> joinList = clubDAO.getMemClub(boardVO.getMemberId());
		System.out.println("받아온 club 가입 리스트" + joinList);
		List<BoardVO> boardList = boardDAO.getPerBList(boardVO);
		for(int i = 0; i<boardList.size(); i++) {
			boardList.get(i).setReplyList(boardDAO.getBoardComment(boardList.get(i).getBoardNo()));
		}
		
		String category = boardVO.getClubId()==-99?"전체보기":boardList.get(0).getClubName();
				
		boardInfoList.put("joinList", joinList);
		boardInfoList.put("boardList", boardList);
		boardInfoList.put("category", category);
		
		return boardInfoList;
	}
	
	
}
