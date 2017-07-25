package kr.co.bit.admin.service;

import java.util.List;

import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.user.vo.UserVO;

public interface AdminService {
	
	ApproveVO joinPartner(ApproveVO approveVO);
	
	void quitPartner(ApproveVO approveVO);
	
	//List<ApproveVO> getApprove();

	List<ApproveVO> getApprove(ApproveVO approveVO);
	
	/*List<ApproveVO> getApproveList(int no);
	
	ApproveVO getApproveOne(ApproveVO approveVO);*/
	
	void updateApproveState(ApproveVO approveVO);	

	void addCommentBlind(CommentBlindVO commentBlindVO);

	//List<CommentBlindVO> getCommentBlind();
	
	List<CommentBlindVO> getCommentBlind(CommentBlindVO commentBlindVO);

	int countCommentBlind(CommentBlindVO commentBlindVO);

	void addHouseBlind(HouseBlindVO houseBlindVO);	

	//List<HouseBlindVO> getHouseBlind();
	
	List<HouseBlindVO> getHouseBlind(HouseBlindVO houseBlindVO);

	int countHouseBlind(HouseBlindVO houseBlindVO);
		
}
