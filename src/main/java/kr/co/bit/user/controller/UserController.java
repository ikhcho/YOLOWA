package kr.co.bit.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.user.service.UserService;
import kr.co.bit.user.vo.HomeListVO;
import kr.co.bit.user.vo.UserVO;


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
	
	@RequestMapping(value="/home.do", method = RequestMethod.GET)
	public String home(Model model){
		List<HomeListVO> list = uService.houseList();
		model.addAttribute("list", list);
		System.out.println(list.toString());
		return "user/home";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login(){
		
		return "user/home";//move to main page
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String login(UserVO uvo, HttpSession session){
		UserVO userVO = uService.login(uvo);
		session.setAttribute("userVO", userVO);
		if(userVO.getType().equals("B")){
			return "redirect:/busi/home.do"; //move to business page
		}
		return "redirect:/user/home.do"; //move to main page
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/user/home.do"; //move to main page
	}
	
	@RequestMapping(value="/loginAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> loginAjax(UserVO uvo){
		UserVO userVO = uService.login(uvo);
		Map<String, String> map = new HashMap<>();
		if(userVO == null){
			map.put("success", "F");
			map.put("msg", "아이디 또는 패스워드가 잘못되었습니다.");
		}else{
			map.put("success", "T");
			map.put("msg", userVO.getName() + "님 환영합니다.");
		}
		return map;
	}
	
	@RequestMapping(value="/register.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> register(UserVO uvo){
		uService.register(uvo);
		Map<String, String> map = new HashMap<>();
		map.put("msg", "가입 되었습니다.");
		return map;
	}
	
	@RequestMapping(value="/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> idCheck(String id){
		Map<String, String> map = new HashMap<>();
		//id가 존재하면 true 아니면 false
		if(uService.idCheck(id)){
			map.put("success", "N");
			map.put("msg", "이미 존재하는 아이디입니다.");
		}else{
			map.put("success", "Y");
			map.put("msg", "가입이 가능한 아이디입니다.");
		}
		return map;
	}
	
}
