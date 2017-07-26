package kr.co.bit.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.board.vo.BoardVO;
import kr.co.bit.board.vo.QBoardVO;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.data.vo.CkReservationVO;
import kr.co.bit.user.vo.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<String> countHouseByRegion() {
		return template.selectList("admin.countHouseByRegion");
	}	

	@Override
	public int countReservation() {
		return template.selectOne("admin.countReservation");
	}

	@Override
	public int calculateTotalProfit() {
		return template.selectOne("admin.calculateTotalProfit");
	}

	@Override
	public List<CkReservationVO> checkReservation() {
		return template.selectList("admin.checkReservation");
	}

	@Override
	public List<HouseVO> classifyByPrice() {
		return template.selectList("admin.classifyByPrice");
	}
	
	@Override
	public int joinPartner(ApproveVO approveVO) {
		return template.insert("admin.joinPartner", approveVO);
	}
	
	@Override
	public int quitPartner(ApproveVO approveVO) {
		return template.delete("admin.quitPartner", approveVO);
	}
	
	/*@Override
	public List<ApproveVO> getApprove() {
		System.out.println("DAO");
		return template.selectList("getApprove");
	}*/

	@Override
	public List<ApproveVO> getApprove(ApproveVO approveVO) {
		return template.selectList("admin.getApprove", approveVO);
	}

	/*@Override
	public List<ApproveVO> getApprove(ApproveVO approveVO) {
		return template.selectList("getApproveListByNo", approveVO);
	}	
	
	@Override
	public ApproveVO getApprove(ApproveVO approveVO) {
		return template.selectOne("getApproveOne", approveVO);
	}*/
	
	@Override
	public void updateApproveState(ApproveVO approveVO) {
		template.update("admin.updateApproveState", approveVO);
	}
	
	@Override
	public void updateUserType(UserVO uVO) {
		template.update("admin.updateUserType", uVO);
	}	

//댓글 신고 관련 시작
	@Override
	public void addCommentBlind(CommentBlindVO commentBlindVO) {
		template.insert("admin.addCommentBlind", commentBlindVO);
		System.out.println("DAO");
	}
	
	@Override
	public void punishComment(BoardVO bVO) {
		template.update("admin.updateBoardBlindState", bVO);
	}

	/*@Override
	public List<CommentBlindVO> getCommentBlind() {		
		return template.selectList("getCommentBlind");
	}	*/
	
	@Override
	public List<CommentBlindVO> getCommentBlind(CommentBlindVO commentBlindVO) {
		return template.selectList("admin.getCommentBlind", commentBlindVO);
	}

	@Override
	public int countCommentBlind(CommentBlindVO commentBlindVO) {
		return template.selectOne("admin.countCommentBlind", commentBlindVO);
	}
//댓글 신고 관련 끝
	
//업체 신고 관련 시작
	@Override
	public void addHouseBlind(HouseBlindVO houseBlindVO) {
		template.insert("admin.addHouseBlind", houseBlindVO);
		System.out.println("DAO");
	}	
	
	@Override
	public void punishHouse(HouseVO hVO) {
		template.update("admin.updateHouseBlindState", hVO);
	}

	/*@Override
	public List<HouseBlindVO> getHouseBlind() {
		return template.selectList("getHouseBlind");
	}*/
	
	@Override
	public List<HouseBlindVO> getHouseBlind(HouseBlindVO houseBlindVO) {
		return template.selectList("admin.getHouseBlind", houseBlindVO);
	}

	@Override
	public int countHouseBlind(HouseBlindVO houseBlindVO) {
		return template.selectOne("admin.countHouseBlind", houseBlindVO);
	}
//업체 신고 관련 끝	

	public void updateBoard(QBoardVO board) {
		template.update("admin.updateBoard", board);
	}
	
	public QBoardVO selectByNoBoard(int no) {
		QBoardVO board = template.selectOne("qboard.selectOneByNo", no);
		return board;
	}
	
	public List<QBoardVO> selectAllBoard() {
		List<QBoardVO> list = template.selectList("qboard.selectAllBoard");
		return list;
	}
}
