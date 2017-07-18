package kr.co.bit.detail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.busi.vo.RoomVO;

@Repository
public class DetailDAOImpl implements DetailDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<RoomVO> roomNameList(int no) {
		List<RoomVO> list = sqlSessionTemplate.selectList("busi.selectOneHouse", no);
		return list;
	}

	/*@Override
	public RoomVO selectOneRoom(int no) {
		//no = 1;
		RoomVO roomVO = new RoomVO();
		roomVO = sqlSessionTemplate.selectOne("busi.selectOneRoom", no);
		return roomVO;
	}*/
	
	
	
}
