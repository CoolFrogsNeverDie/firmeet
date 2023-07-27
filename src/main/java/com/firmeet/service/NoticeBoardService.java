package com.firmeet.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.firmeet.dao.NoticeBoardDAO;
import com.firmeet.vo.NoticeBoardVO;
import com.firmeet.vo.VoteResultVO;

@Service
public class NoticeBoardService {

	@Autowired
	private NoticeBoardDAO dao;

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
	
	public NoticeBoardVO editlist(int aboardNo ) {
		System.out.println("notice editlist 확인");
		dao.hits(aboardNo);
		NoticeBoardVO vo = dao.editlist(aboardNo);
		return vo;
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

	public NoticeBoardVO editlistgroup(int aboardNo) {
		System.out.println("notice editlistgroup 확인");
		dao.hits(aboardNo);
		return dao.editlistgroup(aboardNo);
	}
	
	public void voteinsert(NoticeBoardVO vo) {
		System.out.println("notice voteinsert 확인");
		dao.voteinsert(vo);
	}

	public NoticeBoardVO voteResult(int aboardNo) {
		System.out.println("notice voteResult 확인");
		
		NoticeBoardVO vo = dao.editlist(aboardNo);
		
		System.out.println("보트넘버확인"+vo.getVoteNo());
		
		int voteNo = vo.getVoteNo();
		VoteResultVO voteResultvo = dao.voteresult(voteNo);
		System.out.println("확인확인"+voteResultvo);
		System.out.println("vo.getVote1Cnt()"+voteResultvo.getVote1Cnt());
		
		vo.setVote1Cnt(voteResultvo.getVote1Cnt());
		vo.setVote2Cnt(voteResultvo.getVote2Cnt());
		vo.setVote3Cnt(voteResultvo.getVote3Cnt());
		vo.setVote4Cnt(voteResultvo.getVote4Cnt());
		vo.setVote5Cnt(voteResultvo.getVote5Cnt());
		
		return vo;
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
/*	
	public NoticeBoardVO findHeart(int aboardNo, String memberId) {
		System.out.println("notice findHeart 확인");
		// 2개의 parameter를 보내기 위해 Map 선언 및 Map에 데이터 삽입
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aboardNo", aboardNo);
		map.put("memberId", memberId);
		return dao.findHeart(map);
	}
*/
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

}