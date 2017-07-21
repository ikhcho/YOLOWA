package kr.co.bit.reservation.service;

import java.sql.Date;
import java.util.List;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.reservation.vo.ReservationVO;

public interface ReservationService {
	void insertReservation(ReservationVO reservationVO);
	public boolean ckHot(HouseVO houseVO, Date selectDate);
	public boolean ckWeekend(HouseVO houseVO, Date selectDate);
}
