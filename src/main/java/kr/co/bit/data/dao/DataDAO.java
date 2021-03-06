package kr.co.bit.data.dao;

import java.util.List;

import kr.co.bit.data.vo.CkReservationVO;
import kr.co.bit.data.vo.CountOfMonthVO;
import kr.co.bit.data.vo.DataVO;
import kr.co.bit.data.vo.ScoreVO;

public interface DataDAO {
	public List<DataVO> rankPersonCnt(int houseNo);
	public List<DataVO> rankReservationCnt(int houseNo);
	public List<DataVO> rankTotalProfit(int houseNo);
	public List<CkReservationVO> ckReservationHouse(int userNo);
	public List<ScoreVO> avgScoreOfHouse(int userNo);
	public List<CountOfMonthVO> countOfMonth(int userNo);
}
