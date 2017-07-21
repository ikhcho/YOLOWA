package kr.co.bit.menu.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.menu.vo.AbleRoomVO;
import kr.co.bit.menu.vo.SearchVO;
import kr.co.bit.user.vo.HomeListVO;

@Repository
public class MenuDAOImpl implements MenuDAO{

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<HomeListVO> selectHouseByName(String houseName) {
		// TODO Auto-generated method stub
		return template.selectList("menu.selectHouseByName", houseName);
	}

	@Override
	public List<HomeListVO> selectEmptyRoomHouse(SearchVO searchVO) {
		return template.selectList("menu.selectEmptyRoomHouse", searchVO);
	}

	public List<AbleRoomVO> ableRoom(AbleRoomVO ableRoomVO){
		return template.selectList("menu.ableRoom", ableRoomVO);
	}

	@Override
	public AbleRoomVO reservable(AbleRoomVO ableRoomVO) {
		return template.selectOne("menu.reservable", ableRoomVO);
	}
	
	
}
