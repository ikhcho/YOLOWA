package kr.co.bit.busi.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.busi.service.BusiService;
import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.busi.vo.RoomVO;
import kr.co.bit.user.vo.UserVO;

@Controller
@RequestMapping("/busi")
public class BusiController {

	@Autowired
	private BusiService bService;
	
	@Autowired
	ServletContext servletContext;
	
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
	public String regHouse(MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException{
		String uploadDir = servletContext.getRealPath("/upload/");
		System.out.println(uploadDir);
		HouseVO houseVO = new HouseVO();
		houseVO.setUserNo(Integer.parseInt(mRequest.getParameter("userNo")));
		houseVO.setHouseName(mRequest.getParameter("houseName"));
		houseVO.setAddr(mRequest.getParameter("addr"));
		houseVO.setTel(mRequest.getParameter("tel"));
		houseVO.setRoomCnt(Integer.parseInt(mRequest.getParameter("roomCnt")));
		houseVO.setBbq(mRequest.getParameter("bbq")!=null?"Y":"N");
		houseVO.setPool(mRequest.getParameter("pool")!=null?"Y":"N");
		houseVO.setSinging(mRequest.getParameter("singing")!=null?"Y":"N");
		houseVO.setFootball(mRequest.getParameter("football")!=null?"Y":"N");
		houseVO.setParking(mRequest.getParameter("parking")!=null?"Y":"N");
		houseVO.setPickup(mRequest.getParameter("pickup")!=null?"Y":"N");
		if(mRequest.getParameter("homepage")!=null){
			houseVO.setHomepage(mRequest.getParameter("homepage"));
		}
		if(mRequest.getParameter("hotStart")!=null){
			houseVO.setHotStart(mRequest.getParameter("hotStart"));
		}
		if(mRequest.getParameter("hotEnd")!=null){
			houseVO.setHotEnd(mRequest.getParameter("hotEnd"));
		}
		houseVO.setBlindState("N");
		houseVO.setCheckin(mRequest.getParameter("checkin"));
		houseVO.setCheckout(mRequest.getParameter("checkout"));
		houseVO.setContent(mRequest.getParameter("content"));
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);
			
			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			
			if(oriFileName != null && !oriFileName.equals("")) {
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치 
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}
				
				// 파일 사이즈
				long fileSize = mFile.getSize();
				
				// 고유한 파일명 만들기	
				String saveFileName = "mlec-" + UUID.randomUUID().toString() + ext;
				houseVO.setPhoto(saveFileName);
				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File(uploadDir + saveFileName));
			} 
		} 
		System.out.println(houseVO);
		bService.insertHouse(houseVO);
		
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
