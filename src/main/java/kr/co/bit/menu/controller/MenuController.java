package kr.co.bit.menu.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.bit.menu.service.MenuService;
import kr.co.bit.menu.vo.SearchVO;
import kr.co.bit.user.vo.HomeListVO;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuService mService;
	
	@RequestMapping("/header.do")
	public String header(){
		return "menu/header";
	}
	
	@RequestMapping(value="/searchHouse.do", method=RequestMethod.POST)
	public String searchHouse(String houseName, Model model){
		System.out.println(houseName);
		List<HomeListVO> list = mService.selectHouseByName(houseName);
		model.addAttribute("list", list);
		System.out.println(list.toString());
		return "user/home";
	}
	
	@RequestMapping(value="/searchRoom.do", method=RequestMethod.POST)
	public String searchRoom(Date resDate, String country, String state, Model model){
		SearchVO searchVO = new SearchVO();
		searchVO.setResDate(resDate);
		if(!country.equals("전체")){
			searchVO.setCountry(country.substring(0, 2));
		}
		if(!state.equals("전체")){
			searchVO.setState(state.substring(0, 2));
		}
		System.out.println(searchVO);
		List<HomeListVO> list = mService.selectEmptyRoomHouse(searchVO);
		model.addAttribute("list", list);
		System.out.println(list.toString());
		return "user/home";
	}
	
}
