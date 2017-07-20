package kr.co.bit.menu.service;

import java.util.List;

import kr.co.bit.menu.vo.SearchVO;
import kr.co.bit.user.vo.HomeListVO;

public interface MenuService {
	public List<HomeListVO> selectHouseByName(String houseName);
	public List<HomeListVO> selectEmptyRoomHouse(SearchVO searchVO);
}
