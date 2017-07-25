package kr.co.bit.data.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.data.vo.CkReservationVO;
import kr.co.bit.data.vo.DataVO;
import kr.co.bit.data.vo.ScoreVO;

@Repository
public class DataDAOImpl implements DataDAO {

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<DataVO> rankPersonCnt(int houseNo) {
		List<DataVO> list = template.selectList("data.rankPersonCnt", houseNo);
		return list;
	}

	@Override
	public List<DataVO> rankReservationCnt(int houseNo) {
		List<DataVO> list = template.selectList("data.rankReservationCnt", houseNo);
		return list;
	}

	@Override
	public List<DataVO> rankTotalProfit(int houseNo) {
		List<DataVO> list = template.selectList("data.rankTotalProfit", houseNo);
		return list;
	}

	@Override
	public List<CkReservationVO> ckReservationHouse(int userNo) {
		List<CkReservationVO> list = template.selectList("data.ckOneBusiReservation", userNo);
		
		return list;
	}

	@Override
	public List<ScoreVO> avgScoreOfHouse(int userNo) {
		List<ScoreVO> list = template.selectList("data.avgScoreOfHouse", userNo);
		return list;
	}

	
	
	
}
