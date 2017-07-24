package kr.co.bit.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.board.vo.BoardVO;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.user.vo.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public int joinPartner(ApproveVO approveVO) {
		return template.insert("joinPartner", approveVO);
	}
	
	@Override
	public int quitPartner(ApproveVO approveVO) {
		return template.delete("quitPartner", approveVO);
	}
	
	@Override
	public List<ApproveVO> getApprove() {
		System.out.println("DAO");
		return template.selectList("getApprove");
	}

	@Override
	public List<ApproveVO> getApprove(ApproveVO approveVO) {
		return template.selectList("getApprove", approveVO);
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
		template.update("updateApproveState", approveVO);
	}
	
	@Override
	public void updateUserType(UserVO uVO) {
		template.update("updateUserType", uVO);
	}	

//댓글 신고 관련 시작
	@Override
	public void addCommentBlind(CommentBlindVO commentBlindVO) {
		template.insert("addCommentBlind", commentBlindVO);
		System.out.println("DAO");
	}
	
	@Override
	public void punishComment(BoardVO bVO) {
		template.update("updateBoardBlindState", bVO);
	}

	@Override
	public List<CommentBlindVO> getCommentBlind() {		
		return template.selectList("getCommentBlind");
	}	
	
	@Override
	public List<CommentBlindVO> getCommentBlind(CommentBlindVO commentBlindVO) {
		return template.selectList("getCommentBlind", commentBlindVO);
	}

	@Override
	public int countCommentBlind(CommentBlindVO commentBlindVO) {
		return template.selectOne("countCommentBlind", commentBlindVO);
	}
//댓글 신고 관련 끝
	
//업체 신고 관련 시작
	@Override
	public void addHouseBlind(HouseBlindVO houseBlindVO) {
		template.insert("addHouseBlind", houseBlindVO);
		System.out.println("DAO");
	}	
	
	@Override
	public void punishHouse(HouseVO hVO) {
		template.update("updateHouseBlindState", hVO);
	}

	@Override
	public List<HouseBlindVO> getHouseBlind() {
		return template.selectList("getHouseBlind");
	}
	
	@Override
	public List<HouseBlindVO> getHouseBlind(HouseBlindVO houseBlindVO) {
		return template.selectList("getHouseBlind", houseBlindVO);
	}

	@Override
	public int countHouseBlind(HouseBlindVO houseBlindVO) {
		return template.selectOne("countHouseBlind", houseBlindVO);
	}
//업체 신고 관련 끝	

}
