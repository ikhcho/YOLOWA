package kr.co.bit.reservation.dao;

import java.util.List;

import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.reservation.vo.ReservationVO;

public interface ReservationDAO {
	void insertReservation(ReservationVO reservationVO);
}
