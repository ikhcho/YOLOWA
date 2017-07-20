package kr.co.bit.menu.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.menu.dao.MenuDAO;
import kr.co.bit.menu.vo.SearchVO;
import kr.co.bit.user.vo.HomeListVO;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuDAO mdao;

	@Override
	public List<HomeListVO> selectHouseByName(String houseName) {
		return mdao.selectHouseByName(houseName);
	}

	@Override
	public List<HomeListVO> selectEmptyRoomHouse(SearchVO searchVO) {
		return mdao.selectEmptyRoomHouse(searchVO);
	}

	
	
	
}
