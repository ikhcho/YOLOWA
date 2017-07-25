package kr.co.bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.data.service.DataService;
import kr.co.bit.data.vo.CkReservationVO;
import kr.co.bit.data.vo.DataVO;
import kr.co.bit.data.vo.ScoreVO;

@Controller
@RequestMapping("/data")
public class DataController {

	@Autowired
	private DataService dService;
	
	@RequestMapping("/home.do")
	public ModelAndView houseStatistic(@RequestParam int userNo){
		ModelAndView mav = new ModelAndView("busi/home");
		List<DataVO> rankPersonCnt = dService.rankPersonCnt(userNo);
		List<DataVO> rankReservationCnt = dService.rankReservationCnt(userNo);
		List<DataVO> rankTotalProfit = dService.rankTotalProfit(userNo);
		List<CkReservationVO> ckReservationList = dService.ckReservationHouse(userNo);
		List<ScoreVO> avgScoreList = dService.avgScoreOfHouse(userNo);
		
		mav.addObject("listP", rankPersonCnt);
		mav.addObject("listR", rankReservationCnt);
		mav.addObject("listT", rankTotalProfit);
		mav.addObject("ckList", ckReservationList);
		mav.addObject("listS", avgScoreList);
		
		return mav;
	}
	
}
