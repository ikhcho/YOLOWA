package kr.co.bit.detail.dao;

import java.util.List;

import kr.co.bit.busi.vo.RoomVO;

public interface DetailDAO {
	List<RoomVO> roomNameList(int no);
	//RoomVO selectOneRoom(int no);	//본래는 정수형 파라미터 no 가 필요함
}
