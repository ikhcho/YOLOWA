package kr.co.bit.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.reservation.vo.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertReservation(ReservationVO reservationVO) {
		sqlSessionTemplate.insert("busi.insertReservation", reservationVO);
	}
	
}
