package kr.co.bit.busi.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomPhotoVO;
import kr.co.bit.busi.vo.RoomVO;

@Repository
public class BusiDAOImpl implements BusiDAO{

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<HouseVO> selectHouseList(int no) {
		return template.selectList("busi.selectHouseList", no);
	}

	@Override
	public List<RoomVO> selectRoomList(int no) {
		return template.selectList("busi.selectRoomList", no);
	}

	@Override
	public void insertHouse(HouseVO houseVO) {
		// TODO Auto-generated method stub
		template.insert("busi.insertHouse", houseVO);
	}

	@Override
	public void deleteHouse(int no) {
		// TODO Auto-generated method stub
		template.delete("busi.deleteHouse", no);
	}

	@Override
	public void insertRoom(RoomVO roomVO) {
		// TODO Auto-generated method stub
		template.insert("busi.insertRoom", roomVO);
	}

	@Override
	public RoomVO selectRoomByNo(int no) {
		// TODO Auto-generated method stub
		return template.selectOne("busi.selectRoomByNo", no);
	}

	@Override
	public void updateRoom(RoomVO roomVO) {
		// TODO Auto-generated method stub
		template.update("busi.updateRoom", roomVO);
	}

	@Override
	public void deleteRoom(int no) {
		// TODO Auto-generated method stub
		template.delete("busi.deleteRoom", no);
	}

	@Override
	public int findRoomNo(Map<String, String> map) {
		// TODO Auto-generated method stub
		return template.selectOne("busi.findRoomNo", map);
	}

	@Override
	public void insertRoomPhoto(RoomPhotoVO roomPhotoVO) {
		// TODO Auto-generated method stub
		template.insert("busi.insertRoomPhoto", roomPhotoVO);
	}

	@Override
	public List<RoomPhotoVO> selectRoomPhotoList(int no) {
		// TODO Auto-generated method stub
		return template.selectList("busi.selectRoomPhotoList", no);
	}
	
	
}
