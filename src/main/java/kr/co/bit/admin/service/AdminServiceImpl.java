package kr.co.bit.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.admin.dao.AdminDAO;
import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.user.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adao;
	
	@Override
	public ApproveVO joinPartner(ApproveVO approveVO) {		
		if(adao.joinPartner(approveVO) == 1)
		{
			System.out.println("개수 1");
			approveVO = adao.getApproveOne(approveVO);
		}
		else
		{
			approveVO = null;
		}		
		return approveVO;
	}
	
	@Override
	public List<ApproveVO> getApproveList() {
		return adao.getApproveList();
	}

	@Override
	public List<ApproveVO> getApproveList(String approveState) {
		return adao.getApproveList(approveState);
	}

	@Override
	public List<ApproveVO> getApproveList(int no) {
		return adao.getApproveList(no);
	}
		
	@Override
	public ApproveVO getApproveOne(ApproveVO approveVO) {
		return adao.getApproveOne(approveVO);
	}
	
	@Override
	public void updateApproveState(ApproveVO approveVO) {
		adao.updateApproveState(approveVO);
		
		UserVO uVO = new UserVO();
		uVO.setNo(approveVO.getUserNo());
		uVO.setType("B");
		adao.updateUserType(uVO);
	}

//댓글 신고 관련 시작
	@Override
	public void addCommentBlind(CommentBlindVO commentBlindVO) {
		adao.addCommentBlind(commentBlindVO);
	}

	@Override
	public List<CommentBlindVO> getCommentBlindList() {
		return adao.getCommentBlindList();
	}	
	
	@Override
	public List<CommentBlindVO> getCommentBlindList(int commentNo) {
		return adao.getCommentBlindList(commentNo);
	}

	@Override
	public int getCommentBlindCount(int commentNo) {
		return adao.getCommentBlindCount(commentNo);
	}
//댓글 신고 관련 끝
	
//업체 신고 관련 시작
	@Override
	public void addHouseBlind(HouseBlindVO houseBlindVO) {
		//if(adao.checkHouseBlind(houseBlindVO))
		adao.addHouseBlind(houseBlindVO);
	}
	
	@Override
	public List<HouseBlindVO> getHouseBlindList() {
		return adao.getHouseBlindList();
	}	

	@Override
	public List<HouseBlindVO> getHouseBlindList(int houseNo) {
		return adao.getHouseBlindList(houseNo);
	}

	@Override
	public int getHouseBlindCount(int houseNo) {
		return adao.getHouseBlindCount(houseNo);
	}	
//업체 신고 관련 끝		

}
