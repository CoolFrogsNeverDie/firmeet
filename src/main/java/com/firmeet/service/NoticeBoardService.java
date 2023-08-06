package com.firmeet.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.dao.AreplyDAO;
import com.firmeet.dao.NoticeBoardDAO;
import com.firmeet.dao.PayDAO;
import com.firmeet.vo.AreplyVO;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.PayresultVO;
import com.firmeet.vo.VoteResultVO;

@Service
public class NoticeBoardService {

	@Autowired
	private NoticeBoardDAO dao;
	@Autowired
	private AreplyDAO rdao;
	@Autowired
	private PayDAO pdao;
	
	public List<NoticeBoardVO> noticeList(String keyword) {
		System.out.println("notice noticeList 확인");
		return dao.noticelist(keyword);
	}
	
	public int editwrite(NoticeBoardVO vo) {
		
		System.out.println("getmeetNo"+vo.getMeetNo());
		System.out.println("---------------------------1");
		
		dao.editwrite(vo); //
		System.out.println("---------------------------2");
		System.out.println("service editinsert 확인"+vo);
		System.out.println("service editinsert getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service editinsert getMemberId 확인"+vo.getMemberId());
		
		
		int aboardNo = vo.getAboardNo();
		System.out.println("111service getAboardNo 확인"+vo.getAboardNo());
		System.out.println("---------------------------3");
		dao.editwritevote(vo);
		System.out.println("---------------------------4");
		System.out.println("service voteinsert 확인"+vo);
		System.out.println("service voteinsert getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service voteinsert getVoteNo 확인"+vo.getVoteNo());
		
		return aboardNo;
	}
	
	public NoticeBoardVO editlist(NoticeBoardVO vo) {
		System.out.println("notice editlist 확인");
		dao.hits(vo);
		vo.getMemberId();
		System.out.println("service editlist getMemberId 확인"+vo.getMemberId());
		System.out.println("---------------------------5");
		NoticeBoardVO vo1 = dao.editlist(vo);
		
		if(vo.getVoteResult() != 0) {
			VoteResultVO voteResultvo = dao.voteresult(vo);
			System.out.println("확인확인"+voteResultvo);
			System.out.println("vo.getVote1Cnt()"+voteResultvo.getVote1Cnt());
			
			vo1.setVote1Cnt(voteResultvo.getVote1Cnt());
			vo1.setVote2Cnt(voteResultvo.getVote2Cnt());
			vo1.setVote3Cnt(voteResultvo.getVote3Cnt());
			vo1.setVote4Cnt(voteResultvo.getVote4Cnt());
			vo1.setVote5Cnt(voteResultvo.getVote5Cnt());
		}
		
		System.out.println("ddddddddd"+vo1.getMemberId());
		//댓글 리스트
		System.out.println("---------------------------6");
		List<AreplyVO> vo11 = dao.getBoardComment(vo);
		vo1.setReplyList(vo11);
		System.out.println("---------------------------7");
		System.out.println(vo1);
		return vo1;
	}
	
	public int editgroupwrite(NoticeBoardVO vo) {
		System.out.println("service editgroupwrite getAboardNo 확인");
		
		dao.editgroupwrite(vo);
		
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getMeetNo());
		
		dao.galleryinsert(vo); //갤러리 넣기
		System.out.println("service editgroupwrite 확인"+vo);
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getAboardNo());
		
		int meetNo = vo.getMeetNo(); //meetno 확인
		System.out.println("111service getAboardNo 확인"+vo.getAboardNo());
		
		dao.editwrite(vo); //aboard
		System.out.println("확인확화과ㅣㅇㄴㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ"+vo.getMeetNo());
		dao.aupdate(vo); //
		dao.mupdate(vo); //
	
		System.out.println("service editgroupwrite 확인"+vo);
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service editgroupwrite getMeetNo 확인"+vo.getMeetNo());
		
		return meetNo;		
	}

	public NoticeBoardVO editlistgroup(NoticeBoardVO vo) {
		System.out.println("notice editlistgroup 확인");
		dao.hits(vo);
		//
		NoticeBoardVO vo1 = dao.editlistgroup(vo);
		//댓글 리스트
		List<AreplyVO> vo11 = dao.getBoardComment(vo);
		vo1.setReplyList(vo11);
		System.out.println("jsdflsadfjsdfjlskdfjsdkfsdflksd"+vo1);
		
		
		PayresultVO pvo = pdao.paycnt(vo1);
		System.out.println(pvo);
		
		vo1.setPaycount(pvo.getPaycount());
		vo1.setPayresultNo(pvo.getPayresultNo());

		System.out.println("확화고하닝런이ㅏ러밍널;ㅣㅏ머리ㅓㅇㅁㄴ"+vo11);
		return vo1;
	}
	
	public int editgroupwriteG(NoticeBoardVO vo) {
		System.out.println("------service editgroupwrite 확인"+vo);
		
		dao.editgroupwrite(vo); //meet_name insert
		
		System.out.println("갤러리확인");
		dao.galleryinsert(vo); //갤러리 넣기
		System.out.println("갤러리확인"+vo);
		
		System.out.println("service editgroupwrite 확인"+vo);
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getMeetNo());
		
		int meetNo = vo.getMeetNo(); //meetno 확인
		System.out.println("111service getAboardNo 확인"+vo.getAboardNo());
		
		dao.editwrite(vo); //aboard

		dao.aupdate(vo); //
		dao.mupdate(vo); //
		
		System.out.println("service editgroupwrite 확인"+vo);
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service editgroupwrite getMeetNo 확인"+vo.getMeetNo());
		
		return meetNo;		
	}

	public NoticeBoardVO editlistgroupG(NoticeBoardVO vo) {
		System.out.println("notice editlistgroup 확인");
		dao.hits(vo);
		//
		NoticeBoardVO vo1 = dao.editlistgroup(vo);
		//댓글 리스트
		List<AreplyVO> vo11 = dao.getBoardComment(vo);
		vo1.setReplyList(vo11);
		System.out.println("jsdflsadfjsdfjlskdfjsdkfsdflksd"+vo1);
		
		System.out.println("vo1확인"+vo1);
		
		return vo1;
	}
	
	public NoticeBoardVO editlistgroupR(NoticeBoardVO vo) {
		System.out.println("notice editlistgroup 확인");
		dao.hits(vo);
		
		dao.valup(vo);
		
		dao.auto(vo);
		//
		NoticeBoardVO vo1 = dao.editlistgroup(vo);
		//댓글 리스트
		List<AreplyVO> vo11 = dao.getBoardComment(vo);
		vo1.setReplyList(vo11);
		System.out.println("jsdflsadfjsdfjlskdfjsdkfsdflksd"+vo1);
		
		
		System.out.println("vo1확인"+vo1);
		
		return vo1;
	}
	
	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("notice voteinsert 확인");
		dao.voteinsert(vo);
	}

	public NoticeBoardVO voteResult(NoticeBoardVO vo) {
		System.out.println("notice voteResult 확인");
		
		NoticeBoardVO vo1 = dao.editlist(vo);
		
		System.out.println("보트넘버확인"+vo.getVoteNo());
		
		VoteResultVO voteResultvo = dao.voteresult(vo);
		System.out.println("확인확인"+voteResultvo);
		System.out.println("vo.getVote1Cnt()"+voteResultvo.getVote1Cnt());
		
		vo1.setVote1Cnt(voteResultvo.getVote1Cnt());
		vo1.setVote2Cnt(voteResultvo.getVote2Cnt());
		vo1.setVote3Cnt(voteResultvo.getVote3Cnt());
		vo1.setVote4Cnt(voteResultvo.getVote4Cnt());
		vo1.setVote5Cnt(voteResultvo.getVote5Cnt());
		
		List<AreplyVO> vo11 = dao.getBoardComment(vo);
		vo1.setReplyList(vo11);
		System.out.println(vo1);
		
		return vo1;
	}
	

	public String imgup(MultipartFile file) {
	
		System.out.println("noticeBoardService.imgup()");

		String saveDir = "C:\\firmeet\\upload\\aboard";

		//원파일 이름
		String poriginname = file.getOriginalFilename();
		System.out.println("poriginname : " + poriginname);
		
		//확장자
		String exName = poriginname.substring(poriginname.lastIndexOf("."));
		System.out.println(exName);
		
		//저장파일 이름
		String psaveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("psaveName: " + psaveName);
		
		//파일패스
		String filePath = saveDir +"\\"+psaveName;
		System.out.println("filePath: " + filePath);
		
		//File targetFile = new File(saveDir+psaveName);

		//파일 사이즈
		 long fileSize =file.getSize(); 
		 System.out.println("fileSize: " + fileSize);
		 
		// 파일 업로드
		
		try {
			byte[] fileData = file.getBytes();
			OutputStream out  = new FileOutputStream(filePath);
			BufferedOutputStream bout=  new BufferedOutputStream(out);
			bout.write(fileData);
			bout.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return psaveName;
	
	}
	
	public PayresultVO pay(PayresultVO vo) {
		System.out.println("notice payinsert 확인"+vo);
		pdao.payinsert(vo);
		System.out.println("업데이트 확인 전"+vo);
		pdao.payupdate(vo);
		System.out.println("getPaycount"+vo.getPaycount());
		System.out.println("업데이트 확인 후"+vo);
		return vo;
	}

	//-----------------------------------------------------------------------------------------------------------------------
	
	public AreplyVO addReply(AreplyVO vo) {
		System.out.println("insert 후 정보 확인 " + vo);
		rdao.insertReply(vo);
		
		AreplyVO returnVO = rdao.getReply(vo);
		
		System.out.println("넘어온 댓글 객체 확인 : " + returnVO);
		
		return returnVO;
	}
	
	public AreplyVO addReply2(AreplyVO vo) {
		
		rdao.insertReply(vo);
		AreplyVO returnVO = rdao.getReply(vo);
		return returnVO;
	}
	
	/*댓글 삭제*/
	public boolean deleteReply(AreplyVO vo) {
		boolean result = false;
		
		/* cnt 0 이면 지울수 있다 */ /* cnt 0이 아니면 지울수 없다 */ 
		int checkCnt = (vo.getDeep() == 1)?rdao.checkReply(vo):0;
		System.out.println(checkCnt  +"deep 확인 결과는");
		//딸린 자식들이 있다는 뜻
		
		if(checkCnt>0) {
			System.out.println("삭제X");
			rdao.updateReplyStat(vo);
		}else {
			rdao.deleteReply(vo);
			result =true;
			System.out.println("딸린 자식 없는 아이 삭제");
		}
			
		return result;
	}
	
	public NoticeBoardVO likeCnt(NoticeBoardVO vo) {
		NoticeBoardVO result = null;
		var like = vo.getLikeNo();
		if(like == 0) {
		//좋아요 기능 수행
			System.out.println("들어가");
			dao.insertLike(vo);
			System.out.println("나와라");
			result = dao.getLike(vo);
			System.out.println("나와라");
			
		}else {
		//좋아요 취소 기능 수행
			dao.likeCancle(vo);
		}
		
		return result;
	}

	public NoticeBoardVO gmodifyform(int meetNo) {
		System.out.println("service gmodify확인"+meetNo);
		return dao.gmodifyform(meetNo);
		
	}

	public void gmodify(NoticeBoardVO vo) {
		System.out.println("service gmodify확인"+vo);
		dao.gmodify(vo);
		dao.amodify(vo);
	}
	
	public NoticeBoardVO elmodifyform(int aboardNo) {
		System.out.println("service gmodify확인"+aboardNo);
		return dao.elmodifyform(aboardNo);
		
	}

	public void elmodify(NoticeBoardVO vo) {
		System.out.println("service elmodify확인"+vo);
		dao.elmodify(vo);
		dao.amodify(vo);
	}

	public void gdelete(int aboardNo) {
		dao.gdelete(aboardNo);
	}

	public void eldelete(NoticeBoardVO vo) {
		dao.voteresultdelete(vo);
		dao.votedelete(vo);
		dao.aboarddelete(vo);
	}

	public void pmodify(NoticeBoardVO vo) {
		System.out.println("service gmodify확인"+vo);
		dao.pmodify(vo);
		dao.amodify(vo);
		
	}

}