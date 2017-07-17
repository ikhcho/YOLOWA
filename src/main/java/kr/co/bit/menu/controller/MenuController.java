package kr.co.bit.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bit.menu.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuService mService;
	
	@RequestMapping("/header.do")
	public String header(){
		return "menu/header";
	}
	
}
