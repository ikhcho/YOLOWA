package kr.co.bit.detail.dao;

import java.util.List;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;

public interface DetailDAO {
	HouseVO houseDetail(int no);
	List<RoomVO> roomNameList(int no);
}
