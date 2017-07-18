package kr.co.bit.detail.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.detail.service.DetailService;


@Controller
@RequestMapping("/detail")
public class DetailController {
	
	@Autowired
	private DetailService detailService;
	
	/**
	 * 한 펜션의 모든 객실정보를 페이지에 띄우는 메소드
	 * @param request
	 * @param no
	 * @return
	 */
	@RequestMapping("/{no}/roomInfo.do")
	public String roomInfo(HttpServletRequest request, @PathVariable int no){
		List<RoomVO> list = detailService.roomNameList(no);
		//request.setAttribute("roomVO", roomVO);
		request.setAttribute("list", list);
		return "detail/roomInfo";
	}
	
	/**
	 * 펜션의 상세정보를 페이지에 띄우는 메소드
	 * @param no
	 * @return
	 */
	/*@RequestMapping("/{no}/houseDetail.do")
	public ModelAndView houseDetail(@PathVariable int no) {
		HouseVO house = detailService.houseDetail(no);
		
		ModelAndView mav = new ModelAndView("detail/houseDetail");
		mav.addObject(house);
		
		return mav;
	}*/
	
}
