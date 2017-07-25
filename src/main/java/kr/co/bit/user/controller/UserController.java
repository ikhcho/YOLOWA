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
	
	/*@RequestMapping("/houseDetail.do")
	public ModelAndView houseDetail(int no) {
		System.out.println("Controller : " + no);
		HouseVO house = uService.houseDetail(no);
		
		ModelAndView mav = new ModelAndView("detail/houseDetail");
		mav.addObject(house);
		
		return mav;
	}*/
	
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
			return "redirect:/data/home.do?userNo=" + userVO.getNo(); //move to business page
		}else if(userVO.getType().equals("A")){
			return "redirect:/admin/home.do";
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
	
	@RequestMapping("/mypage.do")
	public String mypage(Model model, HttpSession session){
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		List<HouseVO> zzimList = uService.getZzimHouseList(userVO.getNo());
		List<HomeListVO> houseList = uService.houseList();
		model.addAttribute("zzimList", zzimList);
		model.addAttribute("houseList", houseList);
		return "user/mypage";
	}
	
	@RequestMapping(value="/mypageupdate.do", method=RequestMethod.GET)
	public String updateForm(HttpSession session) {
		
		return "user/mypageupdate";
	}
	
	@RequestMapping(value="/mypageupdate.do", method=RequestMethod.POST)
	public String update(UserVO uvo, HttpSession session, Model model) {
		uService.updateUser(uvo);
		// 수정된 사용자의 정보 조회
		UserVO userVO = uService.selectById(uvo.getId());
		session.setAttribute("userVO", userVO);
		model.addAttribute("msg", "프로필이 수정 됐습니다.");
		return "redirect:/user/mypage.do";

	}
	@RequestMapping("/houseDetail.do")
	public ModelAndView houseDetail(int no) {
		System.out.println("Controller : " + no);
		HouseVO house = uService.houseDetail(no);
		
		ModelAndView mav = new ModelAndView("detail/houseDetail");
		mav.addObject(house);
		
		return mav;
	}
	
	//찜여부 확인
	@RequestMapping(value="/zzim.do", method=RequestMethod.GET)
	@ResponseBody
	public String zzimCheck(int houseNo,int userNo){
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("houseNo", houseNo);
		map.put("userNo", userNo);
		//찜한 기록 존재
		if(userNo != 0 && uService.selectZzim(map)){
			return "disable"; //이미 찜
		}else{
			return "able"; //찜 가능
		}
	}
	
	@RequestMapping(value="/zzim.do", method=RequestMethod.POST)
	@ResponseBody
	public String zzimReg(int houseNo,int userNo, String method){
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("houseNo", houseNo);
		map.put("userNo", userNo);
		if(method.equals("delete")){
			uService.deleteZzim(map);
			return "삭제되었습니다.";
		}else{
			uService.insertZzim(map);
			return "찜 *^-^*";
		}
		
	}
	
	@RequestMapping("/zzimList.do")
	public String zzimList(Model model, HttpSession session){
		
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		List<HouseVO> zzimList = uService.getZzimHouseList(userVO.getNo());
		model.addAttribute("zzimList", zzimList);
		
		return "user/zzim";
	}
}
