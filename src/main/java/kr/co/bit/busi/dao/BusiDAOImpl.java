package kr.co.bit.busi.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.busi.vo.HouseVO;
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
	
	
}
