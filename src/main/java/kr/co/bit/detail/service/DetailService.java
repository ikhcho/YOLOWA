package kr.co.bit.detail.service;

import java.util.List;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;

public interface DetailService {
	//HouseVO houseDetail(int no);
	List<RoomVO> roomNameList(int no);
}
