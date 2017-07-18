package kr.co.bit.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bit.data.service.DataService;

@Controller
@RequestMapping("/data")
public class DataController {

	@Autowired
	private DataService dService;
	
}
