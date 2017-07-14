package kr.co.bit.busi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bit.busi.service.BusiService;

@Controller
@RequestMapping("/busi")
public class BusiController {

	@Autowired
	private BusiService bService;
	
	
}
