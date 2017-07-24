package kr.co.bit.admin.dao;

import java.util.List;

import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.user.vo.UserVO;

public interface AdminDAO {
	
	int joinPartner(ApproveVO approveVO);
	
	int quitPartner(ApproveVO approveVO);
	
	List<ApproveVO> getApprove();

	List<ApproveVO> getApprove(ApproveVO approveVO);
	
	/*List<ApproveVO> getApproveList(int no);
	
	ApproveVO getApproveOne(ApproveVO approveVO);*/
	
	void updateApproveState(ApproveVO approveVO);
	
	void updateUserType(UserVO uVO);

	void addCommentBlind(CommentBlindVO commentBlindVO);
	
	List<CommentBlindVO> getCommentBlind();
	
	List<CommentBlindVO> getCommentBlind(CommentBlindVO commentBlindVO);
	
	int countCommentBlind(CommentBlindVO commentBlindVO);

	void addHouseBlind(HouseBlindVO houseBlindVO);	

	List<HouseBlindVO> getHouseBlind();
	
	List<HouseBlindVO> getHouseBlind(HouseBlindVO houseBlindVO);
	
	int countHouseBlind(HouseBlindVO houseBlindVO);

}
