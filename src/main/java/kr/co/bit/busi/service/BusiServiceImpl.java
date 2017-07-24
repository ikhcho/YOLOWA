package kr.co.bit.busi.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.busi.dao.BusiDAO;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomPhotoVO;
import kr.co.bit.busi.vo.RoomVO;

@Service
public class BusiServiceImpl implements BusiService{
	
	@Autowired
	private BusiDAO bdao;

	@Override
	public List<HouseVO> selectHouseList(int no) {
		// TODO Auto-generated method stub
		return bdao.selectHouseList(no);
	}

	@Override
	public List<RoomVO> selectRoomList(int no) {
		// TODO Auto-generated method stub
		return bdao.selectRoomList(no);
	}

	@Override
	public void insertHouse(HouseVO houseVO) {
		// TODO Auto-generated method stub
		bdao.insertHouse(houseVO);
	}

	@Override
	public void deleteHouse(int no) {
		// TODO Auto-generated method stub
		bdao.deleteHouse(no);
	}

	@Override
	public void insertRoom(RoomVO roomVO) {
		// TODO Auto-generated method stub
		bdao.insertRoom(roomVO);
	}

	
	@Override
	public RoomVO selectRoomByNo(int no) {
		// TODO Auto-generated method stub
		return bdao.selectRoomByNo(no);
	}

	@Override
	public void updateRoom(RoomVO roomVO) {
		// TODO Auto-generated method stub
		bdao.updateRoom(roomVO);
	}

	@Override
	public void deleteRoom(int no) {
		// TODO Auto-generated method stub
		bdao.deleteRoom(no);
	}

	@Override
	public int findRoomNo(Map<String, String> map) {
		return bdao.findRoomNo(map);
	}

	@Override
	public void insertRoomPhoto(RoomPhotoVO roomPhotoVO) {
		// TODO Auto-generated method stub
		bdao.insertRoomPhoto(roomPhotoVO);
	}

	@Override
	public List<RoomPhotoVO> selectRoomPhotoList(int no) {
		// TODO Auto-generated method stub
		return bdao.selectRoomPhotoList(no);
	}

	@Override
	public void deleteRoomPhoto(int roomNo) {
		// TODO Auto-generated method stub
		bdao.deleteRoomPhoto(roomNo);
	}

	
	
}
