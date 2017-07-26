package kr.co.bit.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.board.vo.QBoardVO;
import kr.co.bit.user.vo.UserVO;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.data.vo.CkReservationVO;

public interface AdminService {
	
	public ApproveVO joinPartner(ApproveVO approveVO);
	Map<String, Integer> countHouseByRegion();
	
	int countReservation();
	
	int calculateTotalProfit();

	List<CkReservationVO> checkReservation();

	Map<HouseVO, Integer> classifyByPrice();
	
	public void quitPartner(ApproveVO approveVO);
	
	//List<ApproveVO> getApprove();

	public List<ApproveVO> getApprove(ApproveVO approveVO);
	
	/*List<ApproveVO> getApproveList(int no);
	
	ApproveVO getApproveOne(ApproveVO approveVO);*/
	
	public void updateApproveState(ApproveVO approveVO);	

	public void addCommentBlind(CommentBlindVO commentBlindVO);

	//List<CommentBlindVO> getCommentBlind();
	
	public List<CommentBlindVO> getCommentBlind(CommentBlindVO commentBlindVO);

	public int countCommentBlind(CommentBlindVO commentBlindVO);

	public void addHouseBlind(HouseBlindVO houseBlindVO);	

	//List<HouseBlindVO> getHouseBlind();
	
	public List<HouseBlindVO> getHouseBlind(HouseBlindVO houseBlindVO);

	public int countHouseBlind(HouseBlindVO houseBlindVO);
	
	public void updateBoard(QBoardVO board);
	
	public QBoardVO selectByNoBoard(int no);
	
	public List<QBoardVO> selectAllBoard();
		
}
