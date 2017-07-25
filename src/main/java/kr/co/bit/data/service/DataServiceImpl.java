package kr.co.bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.data.dao.DataDAO;
import kr.co.bit.data.vo.CkReservationVO;
import kr.co.bit.data.vo.DataVO;
import kr.co.bit.data.vo.ScoreVO;

@Service
public class DataServiceImpl implements DataService{

	@Autowired
	private DataDAO dDao;

	@Override
	public List<DataVO> rankPersonCnt(int houseNo) {
		List<DataVO> list = dDao.rankPersonCnt(houseNo);
		return list;
	}

	@Override
	public List<DataVO> rankReservationCnt(int houseNo) {
		List<DataVO> list = dDao.rankReservationCnt(houseNo);
		return list;
	}

	@Override
	public List<DataVO> rankTotalProfit(int houseNo) {
		List<DataVO> list = dDao.rankTotalProfit(houseNo);
		return list;
	}

	@Override
	public List<CkReservationVO> ckReservationHouse(int userNo) {
		List<CkReservationVO> list = dDao.ckReservationHouse(userNo);
				
		return list;
	}

	@Override
	public List<ScoreVO> avgScoreOfHouse(int userNo) {
		List<ScoreVO> list = dDao.avgScoreOfHouse(userNo);
		return list;
	}

	
	
	
}
