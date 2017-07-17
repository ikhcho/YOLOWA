package kr.co.bit.busi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bit.busi.service.BusiService;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.user.vo.UserVO;

@Controller
@RequestMapping("/busi")
public class BusiController {

	@Autowired
	private BusiService bService;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(){
		
		return "busi/home";
	}
	
	@RequestMapping(value="/home.do", method=RequestMethod.POST)
	public String home(UserVO userVO){
		return "busi/home";
	}
	
	@RequestMapping(value="/contact.do", method=RequestMethod.POST)
	@ResponseBody
	public String contact(HttpSession session, String approvekey){
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		return "";
	}
	
	@RequestMapping("/pension/list.do")
	public String list(HttpSession session, Model model){
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		List<HouseVO> list = bService.selectHouseList(userVO.getNo());
		model.addAttribute("list", list);
		return "busi/list";
	}
	
	@RequestMapping("/pension/room.do")
	@ResponseBody
	public List<RoomVO> room(int no){
		List<RoomVO> list = bService.selectRoomList(no);
		return list;
	}
	
	@RequestMapping(value="/pension/regHouse.do", method=RequestMethod.GET)
	public String regHouse(){
		
		return "busi/regHouse";
	}
	
	@RequestMapping(value="/pension/regHouse.do", method=RequestMethod.POST)
	public String regHouse(UserVO userVO){
		return "busi/regHouse";
	}
	
	@RequestMapping(value="/pension/regRoom.do", method=RequestMethod.GET)
	public String regRoom(){
		
		return "busi/register";
	}
	
	@RequestMapping(value="/pension/regRoom.do", method=RequestMethod.POST)
	public String regRoom(UserVO userVO){
		return "busi/register";
	}
}
