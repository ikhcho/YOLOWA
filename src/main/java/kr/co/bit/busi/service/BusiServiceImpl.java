package kr.co.bit.busi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.busi.dao.BusiDAO;
import kr.co.bit.busi.vo.HouseVO;
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
	
	
	
	
}
