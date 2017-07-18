package kr.co.bit.detail.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.detail.service.DetailService;


@Controller
@RequestMapping("/detail")
public class DetailController {
	
	@Autowired
	private DetailService detailService;
	
	@RequestMapping("/{no}/roomInfo.do")
	public String roomInfo(HttpServletRequest request, @PathVariable int no){
		//RoomVO roomVO = detailService.selectOneRoom(no);
		List<RoomVO> list = detailService.roomNameList(no);
		//request.setAttribute("roomVO", roomVO);
		request.setAttribute("list", list);
		return "detail/roomInfo";
	}
	
}
