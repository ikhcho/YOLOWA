package kr.co.bit.busi.dao;

import java.util.List;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;

public interface BusiDAO {

	public List<HouseVO> selectHouseList(int no);
	public List<RoomVO> selectRoomList(int no);
	public void insertHouse(HouseVO houseVO);
}
