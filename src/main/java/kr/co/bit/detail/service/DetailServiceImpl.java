package kr.co.bit.detail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.detail.dao.DetailDAO;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailDAO detailDAO;

	/**
	 * 한 펜션의 모든 방 정보를 담은 데이터
	 */
	@Override
	public List<RoomVO> roomNameList(int no) {
		return detailDAO.roomNameList(no);
	}

	@Override
	public HouseVO houseDetail(int no) {
		return detailDAO.houseDetail(no);
	}	
	
}
