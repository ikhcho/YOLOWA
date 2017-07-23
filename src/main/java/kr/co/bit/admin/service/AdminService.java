package kr.co.bit.admin.service;

import java.util.List;

import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;

public interface AdminService {
	
	ApproveVO joinPartner(ApproveVO approveVO);
	
	List<ApproveVO> getApproveList();
	
	List<ApproveVO> getApproveList(String approveState);
	
	List<ApproveVO> getApproveList(int no);
	
	ApproveVO getApproveOne(ApproveVO approveVO);
	
	void updateApproveState(ApproveVO approveVO);

	void addCommentBlind(CommentBlindVO commentBlindVO);

	List<CommentBlindVO> getCommentBlindList();

	List<CommentBlindVO> getCommentBlindList(int commentNo);

	int getCommentBlindCount(int commentNo);

	void addHouseBlind(HouseBlindVO houseBlindVO);	

	List<HouseBlindVO> getHouseBlindList();

	List<HouseBlindVO> getHouseBlindList(int houseNo);

	int countHouseBlind(HouseBlindVO houseBlindVO);

}
