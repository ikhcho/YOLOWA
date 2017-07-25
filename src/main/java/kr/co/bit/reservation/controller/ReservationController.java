package kr.co.bit.reservation.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.detail.service.DetailService;
import kr.co.bit.reservation.service.ReservationService;
import kr.co.bit.reservation.vo.ReservationVO;
import kr.co.bit.user.service.UserService;
import kr.co.bit.user.vo.UserVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	@Autowired
	private DetailService detailService;

	@RequestMapping(value="/houseReservation.do")
	public ModelAndView showAllRooms(@RequestParam("houseNo") int houseNo,
			@RequestParam("selectDate") Date selectDate) {
		ModelAndView mav = new ModelAndView();
		List<RoomVO> list = detailService.roomNameList(houseNo);
		HouseVO houseVO = detailService.houseDetail(houseNo);

		for(RoomVO vo : list){
			if(reservationService.ckWeekend(houseVO, selectDate)){		//주말일 때
				if(reservationService.ckHot(houseVO, selectDate)) vo.setPrice(vo.gethWeekendPrice());
				else vo.setPrice(vo.getnWeekendPrice());
			} else {								//평일일 때
				if(reservationService.ckHot(houseVO, selectDate)) vo.setPrice(vo.gethWeekPrice());
				else vo.setPrice(vo.getnWeekPrice());
			}
		}
		
		mav.setViewName("reservation/houseReservation");
		mav.addObject("houseVO", houseVO);
		mav.addObject("list", list);
		return mav; 
	}

	@RequestMapping(value = "/reservation.do", method = RequestMethod.POST)
	public String insertReservation(@RequestParam int houseNo, @RequestParam int[] roomNo, @RequestParam int[] day, int userNo,
			@RequestParam int[] personCnt, @RequestParam int[] totalPrice, @RequestParam Date resStart, Date resEnd, Model model) {
		//reservationService.insertReservation(reservationVO);
		// TODO 2. insert 할 때 datatype을 무엇으로 할 지 정해야함
		// return "redirect:/reservation/houseReservation.do";
		
		List<ReservationVO> resList = new ArrayList<ReservationVO>();
		List<String> resInfo =  new ArrayList<String>();
		resInfo.add(detailService.houseDetail(houseNo).getHouseName());
		List<RoomVO> roomList = detailService.roomNameList(houseNo);
		for(int i =0; i<roomNo.length; i++){
			ReservationVO resVO = new ReservationVO();
			resEnd.setDate(resStart.getDate()+day[i]);
			System.out.print("houseNo : " + houseNo + " ");
			System.out.print("userNo : " + userNo + " ");
			System.out.print("roomNo[" + i + "] : " + roomNo[i] + " ");
			System.out.print("day[" + i + "] : " + day[i] + " ");
			System.out.print("personCnt[" + i + "] : " + personCnt[i] + " ");
			System.out.print("resStart : " + resStart + " ");
			System.out.print("resEnd : " + resEnd + " ");
			System.out.println("totalPrice[" + i + "] : " + totalPrice[i]);
			
			resVO.setHouseNo(houseNo);
			resVO.setRoomNo(roomNo[i]);
			resVO.setUserNo(userNo);
			resVO.setResStart(resStart);
			resVO.setResEnd(resEnd);
			resVO.setPersonCnt(personCnt[i]);
			resVO.setTotalPrice(totalPrice[i]);
			resVO.setContent("예약 테스트");
			
			reservationService.insertReservation(resVO);
			resList.add(resVO);
			for(int j=0; j<roomList.size(); j++){
				if(roomList.get(j).getNo() == roomNo[i])
					resInfo.add(roomList.get(j).getRoomName());
			}
		}
		model.addAttribute("msg", "예약되었습니다.");
		model.addAttribute("resList", resList);
		model.addAttribute("resInfo", resInfo);
		return "reservation/resConfirm";
	}
	
}
