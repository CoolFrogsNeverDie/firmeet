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
import com.firmeet.vo.AreplyVO;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.VoteResultVO;

@Service
public class NoticeBoardService {

	@Autowired
	private NoticeBoardDAO dao;
	@Autowired
	private AreplyDAO rdao;

	public List<NoticeBoardVO> noticeList() {
		System.out.println("notice noticeList 확인");
		return dao.noticelist();
	}

	public int editwrite(NoticeBoardVO vo) {
		dao.editwrite(vo);
		System.out.println("service editinsert 확인"+vo);
		System.out.println("service editinsert getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service editinsert getMemberId 확인"+vo.getMemberId());
		
		int aboardNo = vo.getAboardNo();
		System.out.println("111service getAboardNo 확인"+vo.getAboardNo());
		//여기서 안들어감
		dao.editwritevote(vo);
		System.out.println("service voteinsert 확인"+vo);
		System.out.println("service voteinsert getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service voteinsert getVoteNo 확인"+vo.getVoteNo());
		
		return aboardNo;
	}
	
	public NoticeBoardVO editlist(NoticeBoardVO vo) {
		System.out.println("notice editlist 확인");
		dao.hits(vo);
		
		NoticeBoardVO vo1 = dao.editlist(vo);
		List<AreplyVO> vo11 = dao.getBoardComment(vo);
		vo1.setReplyList(vo11);
//		System.out.println("확확확확확"+dao.getBoardComment(vo));
		System.out.println(vo1);
//		return null;
		return vo1;
	}
	
	public int editgroupwrite(NoticeBoardVO vo) {
		dao.editwrite(vo);
		System.out.println("service editgroupwrite 확인"+vo);
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getAboardNo());
		
		int aboardNo = vo.getAboardNo();
		System.out.println("111service getAboardNo 확인"+vo.getAboardNo());

		dao.editgroupwrite(vo);
		System.out.println("service editgroupwrite 확인"+vo);
		System.out.println("service editgroupwrite getAboardNo 확인"+vo.getAboardNo());
		System.out.println("service editgroupwrite getMeetNo 확인"+vo.getMeetNo());
		
		return aboardNo;		
	}

	public NoticeBoardVO editlistgroup(NoticeBoardVO vo) {
		System.out.println("notice editlistgroup 확인");
		dao.hits(vo);
		return dao.editlistgroup(vo);
	}
	
	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("notice voteinsert 확인");
		dao.voteinsert(vo);
	}

	public NoticeBoardVO voteResult(NoticeBoardVO vo) {
		System.out.println("notice voteResult 확인");
		
		NoticeBoardVO vo1 = dao.editlist(vo);
		
		System.out.println("보트넘버확인"+vo.getVoteNo());
		
		int voteNo = vo.getVoteNo();
		VoteResultVO voteResultvo = dao.voteresult(vo);
		System.out.println("확인확인"+voteResultvo);
		System.out.println("vo.getVote1Cnt()"+voteResultvo.getVote1Cnt());
		
		vo.setVote1Cnt(voteResultvo.getVote1Cnt());
		vo.setVote2Cnt(voteResultvo.getVote2Cnt());
		vo.setVote3Cnt(voteResultvo.getVote3Cnt());
		vo.setVote4Cnt(voteResultvo.getVote4Cnt());
		vo.setVote5Cnt(voteResultvo.getVote5Cnt());
		
		return vo1;
	}
	

	public String imgup(MultipartFile file) {
	
		System.out.println("noticeBoardService.imgup()");

		String saveDir = "C:\\firmeet\\upload";

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

	public void payinsert(NoticeBoardVO vo) {
		System.out.println("notice payinsert 확인");
		dao.payinsert(vo);
	}
	
	public NoticeBoardVO payresult(NoticeBoardVO noticeBoardVO) {
		System.out.println("notice payresult 확인");
		NoticeBoardVO nVo = dao.payresult(noticeBoardVO);
		dao.paycount(noticeBoardVO);
		return nVo;
	}

	public int insertHeart(NoticeBoardVO vo) {
		System.out.println("notice insertHeart 확인");
		
		int result = 0;
		
		NoticeBoardVO find = dao.findHeart(vo);
		
		if(find == null) {
			result = dao.insertHeart(vo);
		}else {
			dao.deleteHeart(vo);
		}
		return result;
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

}