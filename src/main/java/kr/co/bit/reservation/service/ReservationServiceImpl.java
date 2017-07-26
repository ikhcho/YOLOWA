package kr.co.bit.reservation.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.reservation.dao.ReservationDAO;
import kr.co.bit.reservation.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Override
	public void insertReservation(ReservationVO reservationVO) {
		reservationDAO.insertReservation(reservationVO);
		
	}
	
	/**
	 * 평일, 주말 구분
	 * @param houseVO
	 * @param selectDate
	 * @return
	 */
	@Override
	public boolean ckWeekend(HouseVO houseVO, Date selectDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date hStart;
		Date hEnd;
		Date selectionDate;
		Calendar cal = Calendar.getInstance();
		boolean weekend = false;
		
		try {
			int nWeek = selectDate.getDay();
			if(nWeek == 5 || nWeek == 6) weekend = true;
			else weekend = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return weekend;
	}
	
	/**
	 * 성수기, 비성수기를 구분
	 * @param houseVO
	 * @param selectDate
	 * @return
	 */
	@Override
	public boolean ckHot(HouseVO houseVO, Date selectDate) {
		
		Date hStart;
		Date hEnd;
		boolean hot = false;
		
		try {
			
			hStart = Date.valueOf(houseVO.getHotStart());
			hEnd = Date.valueOf(houseVO.getHotEnd());

			long[] diff = new long[4];
			diff[0] = hStart.getTime() - selectDate.getTime();
			diff[1] = hEnd.getTime() - selectDate.getTime();
			diff[2] = diff[0] / (24 * 60 * 60 * 1000);
			diff[3] = diff[1] / (24 * 60 * 60 * 1000);

			if(diff[2] <= 0 && diff[3] >= 0) hot = true;
			else hot = false;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return hot;
	}

	@Override
	public void resDelete(int no) {
		// TODO Auto-generated method stub
		reservationDAO.resDelete(no);
	}
	
	
}
