package kr.co.bit.detail.service;

import java.util.List;

import kr.co.bit.busi.vo.RoomVO;

public interface DetailService {
	//RoomVO selectOneRoom(int no);	//본래는 정수형 파라미터 no가 필요함
	List<RoomVO> roomNameList(int no);
}
