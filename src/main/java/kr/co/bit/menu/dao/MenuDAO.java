package kr.co.bit.menu.dao;

import java.util.List;

import kr.co.bit.menu.vo.SearchVO;
import kr.co.bit.user.vo.HomeListVO;

public interface MenuDAO {
	public List<HomeListVO> selectHouseByName(String houseName);
	public List<HomeListVO> selectEmptyRoomHouse(SearchVO searchVO);
}
