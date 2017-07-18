package kr.co.bit.busi.dao;

import java.util.List;
import java.util.Map;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomPhotoVO;
import kr.co.bit.busi.vo.RoomVO;

public interface BusiDAO {

	public List<HouseVO> selectHouseList(int no);
	public List<RoomVO> selectRoomList(int no);
	public void insertHouse(HouseVO houseVO);
	public void deleteHouse(int no);
	public void insertRoom(RoomVO roomVO);
	public RoomVO selectRoomByNo(int no);
	public void updateRoom(RoomVO roomVO);
	public void deleteRoom(int no);
	public int findRoomNo(Map<String, String> map);
	public void insertRoomPhoto(RoomPhotoVO roomPhotoVO);
	public List<RoomPhotoVO> selectRoomPhotoList(int no);
}
