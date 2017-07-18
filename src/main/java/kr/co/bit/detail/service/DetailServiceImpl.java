package kr.co.bit.detail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.detail.dao.DetailDAO;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailDAO detailDAO;

	@Override
	public List<RoomVO> roomNameList(int no) {
		return detailDAO.roomNameList(no);
	}

	/*@Override
	public RoomVO selectOneRoom(int no) {
		return detailDAO.selectOneRoom(no);
	}*/
	
	
	
}
