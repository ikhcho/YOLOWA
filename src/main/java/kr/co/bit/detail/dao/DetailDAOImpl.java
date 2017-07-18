package kr.co.bit.detail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;

@Repository
public class DetailDAOImpl implements DetailDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 한 펜션의 모든 객실정보 페이지에 담을 데이터
	 */
	@Override
	public List<RoomVO> roomNameList(int no) {
		List<RoomVO> list = sqlSessionTemplate.selectList("busi.selectOneHouse", no);
		return list;
	}

	/*@Override
	public HouseVO houseDetail(int no) {
		return sqlSessionTemplate.selectOne("user.houseDetail", no);
	}*/
	
	
}
