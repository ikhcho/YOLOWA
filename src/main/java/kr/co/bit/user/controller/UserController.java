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
	public String getHouseDetail(int no) {		
		HouseVO house = uService.getHouseDetail(no);
		
		return "detail/houseDetail";
	}
	
	@RequestMapping("/houseInfo.do")
	public ModelAndView getPensionInfo() {
		return null;		
	}
}
