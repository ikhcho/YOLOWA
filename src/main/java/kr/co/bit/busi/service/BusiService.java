package kr.co.bit.busi.service;

import java.util.List;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;

public interface BusiService {

	public List<HouseVO> selectHouseList(int no);
	public List<RoomVO> selectRoomList(int no);
	public void insertHouse(HouseVO houseVO);
}
