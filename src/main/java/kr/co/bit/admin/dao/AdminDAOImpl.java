package kr.co.bit.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
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
	public List<ApproveVO> getApproveList() {
		return template.selectList("getApproveList");
	}

	@Override
	public List<ApproveVO> getApproveList(String approveState) {
		return template.selectList("getApproveListByState", approveState);
	}

	@Override
	public List<ApproveVO> getApproveList(int no) {
		return template.selectList("getApproveListByNo", no);
	}	
	
	@Override
	public ApproveVO getApproveOne(ApproveVO approveVO) {
		return template.selectOne("getApproveOne", approveVO);
	}
	
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
	public List<CommentBlindVO> getCommentBlindList() {		
		return template.selectList("getCommentBlindList");
	}	
	
	@Override
	public List<CommentBlindVO> getCommentBlindList(int commentNo) {
		return template.selectList("getCommentBlindOne", commentNo);
	}

	@Override
	public int getCommentBlindCount(int commentNo) {
		return template.selectOne("getCommentBlindCount", commentNo);
	}
//댓글 신고 관련 끝
	
//업체 신고 관련 시작
	@Override
	public void addHouseBlind(HouseBlindVO houseBlindVO) {
		template.insert("addHouseBlind", houseBlindVO);
		System.out.println("DAO");
	}	

	@Override
	public List<HouseBlindVO> getHouseBlindList() {
		return template.selectList("getHouseBlindList");
	}
	
	@Override
	public List<HouseBlindVO> getHouseBlindList(int houseNo) {
		return template.selectList("getHouseBlindOne", houseNo);
	}

	@Override
	public int countHouseBlind(HouseBlindVO houseBlindVO) {
		return template.selectOne("countHouseBlind", houseBlindVO);
	}
//업체 신고 관련 끝	

}
