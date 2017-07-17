package kr.co.bit.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.user.service.UserService;
import kr.co.bit.user.vo.HouseVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService uService;
	
	@RequestMapping("/houseDetail.do")
	public ModelAndView houseDetail(int no) {
		System.out.println("Controller : " + no);
		HouseVO house = uService.houseDetail(no);
		
		ModelAndView mav = new ModelAndView("detail/houseDetail");
		mav.addObject(house);
		
		return mav;
	}
	
	@RequestMapping("/houseReserve.do")
	public ModelAndView getPensionInfo() {
		System.out.println("reserve");
		return null;		
	}
}
