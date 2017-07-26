package kr.co.bit.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.admin.dao.AdminDAO;
import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.board.vo.BoardVO;
import kr.co.bit.board.vo.QBoardVO;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.detail.dao.DetailDAO;
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
			approveVO = adao.getApprove(approveVO).get(0);
		}
		else
		{
			approveVO = null;
		}		
		return approveVO;
	}
	
	@Override
	public void quitPartner(ApproveVO approveVO) {
		if(adao.quitPartner(approveVO) == 1)
		{
			UserVO uVO = new UserVO();
			uVO.setNo(approveVO.getUserNo());
			uVO.setType("U");
			adao.updateUserType(uVO);
		}
		else
		{
			System.out.println("DB 오류");
		}
	}
	
	/*@Override
	public List<ApproveVO> getApprove() {
		System.out.println("Service");
		return adao.getApprove();
	}*/

	@Override
	public List<ApproveVO> getApprove(ApproveVO approveVO) {
		return adao.getApprove(approveVO);
	}

	/*@Override
	public List<ApproveVO> getApproveList(int no) {
		return adao.getApproveList(no);
	}
		
	@Override
	public ApproveVO getApproveOne(ApproveVO approveVO) {
		return adao.getApproveOne(approveVO);
	}*/
	
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
		if(adao.countCommentBlind(commentBlindVO) >= 1)
		{//userNo와 commentNo로 체크
			System.out.println("이미 신고함");
		}
		else
		{
			adao.addCommentBlind(commentBlindVO);
			int commentNo = commentBlindVO.getCommentNo();
			
			if(adao.countCommentBlind(new CommentBlindVO(commentNo, 0)) >= 2)
			{
				BoardVO bVO = new BoardVO();
				bVO.setNo(commentNo);
				bVO.setBlind_state("Y");
				adao.punishComment(bVO);
			}
		}		
	}

	/*@Override
	public List<CommentBlindVO> getCommentBlind() {
		return adao.getCommentBlind();
	}	*/
	
	@Override
	public List<CommentBlindVO> getCommentBlind(CommentBlindVO commentBlindVO) {
		return adao.getCommentBlind(commentBlindVO);
	}

	@Override
	public int countCommentBlind(CommentBlindVO commentBlindVO) {
		return adao.countCommentBlind(commentBlindVO);
	}
//댓글 신고 관련 끝
	
//업체 신고 관련 시작
	@Override
	public void addHouseBlind(HouseBlindVO houseBlindVO) {
		if(adao.countHouseBlind(houseBlindVO) >= 1)
		{//userNo와 houseNo로 체크
			System.out.println("이미 신고함");
		}
		else
		{
			adao.addHouseBlind(houseBlindVO);
			int houseNo = houseBlindVO.getHouseNo();
			
			if(adao.countHouseBlind(new HouseBlindVO(houseNo, 0)) >= 2)
			{
				HouseVO hVO = new HouseVO();
				hVO.setNo(houseNo);
				hVO.setBlindState("Y");
				adao.punishHouse(hVO);
			}
		}		
	}
	
	/*@Override
	public List<HouseBlindVO> getHouseBlind() {
		return adao.getHouseBlind();
	}	*/

	@Override
	public List<HouseBlindVO> getHouseBlind(HouseBlindVO houseBlindVO) {
		return adao.getHouseBlind(houseBlindVO);
	}

	@Override
	public int countHouseBlind(HouseBlindVO houseBlindVO) {
		return adao.countHouseBlind(houseBlindVO);
	}	
//업체 신고 관련 끝		
	
	public void updateBoard(QBoardVO board) {



		adao.updateBoard(board);

	}
	
	public QBoardVO selectByNoBoard(int no) {

		QBoardVO board = adao.selectByNoBoard(no);

		return board;

	}
	public List<QBoardVO> selectAllBoard() {

		List<QBoardVO> list = adao.selectAllBoard();

		return list;

	}

}
