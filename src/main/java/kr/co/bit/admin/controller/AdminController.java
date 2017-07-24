package kr.co.bit.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.admin.service.AdminService;
import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.user.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService aService;

	//가맹 신청 양식으로
	@RequestMapping(value="/joinPartner.do", method=RequestMethod.GET)
	public String joinPartnerForm() {
		return "admin/joinPartnerForm";
	}

	//가맹 신청 완료로
	@RequestMapping(value="/joinPartner.do", method=RequestMethod.POST)
	public ModelAndView joinPartner(ApproveVO approveVO) {
		ModelAndView mav = new ModelAndView("admin/joinPartner");
		mav.addObject("approveVO", aService.joinPartner(approveVO));
		return mav;
	}
	
	//가맹 해지 신청
	@RequestMapping(value="/quitPartner.do")
	public String quitPartner(ApproveVO approveVO) {
		aService.quitPartner(approveVO);
		return "admin/quitPartner";
	}

	//가맹 신청 목록 전체
	@RequestMapping(value="/getApprove.do")
	public ModelAndView getApprove() {
		ModelAndView mav = new ModelAndView("admin/approve");
		mav.addObject("approveList", aService.getApprove());
		return mav;
	}

	//가맹 신청 상태별 목록
	@RequestMapping(value="/getApprove.do", params={"approveVO"})
	public ModelAndView getApprove(@RequestParam ApproveVO approveVO) {
		ModelAndView mav = new ModelAndView("admin/approve");
		mav.addObject("approveList", aService.getApprove(approveVO));
		return mav;
	}

	/*//가맹 신청 사용자 번호에 따른 목록
	@RequestMapping(value="/getApproveList.do", params={"no"})
	public ModelAndView getApproveList(@RequestParam int no) {
		ModelAndView mav = new ModelAndView("admin/approveList");
		mav.addObject("approveList", aService.getApproveList(no));
		return mav;
	}

	//가맹 신청 한 개 조회
	@RequestMapping("/getApproveOne.do")
	public ModelAndView getApproveOne(ApproveVO approveVO) {
		ModelAndView mav = new ModelAndView("admin/approveOne");
		mav.addObject("approveVO", aService.getApproveOne(approveVO));
		return mav;
	}*/
	
	//승인 상태 변경
	@RequestMapping("/updateApproveState.do")
	public String updateApproveState(ApproveVO approveVO) {
		aService.updateApproveState(approveVO);
		return "redirect:/admin/approveList.do";
	}

	//유저가 댓글 신고
	@RequestMapping("/addCommentBlind.do")
	public void addCommentBlind(int no, HttpSession session) {
		aService.addCommentBlind(new CommentBlindVO(no, 
				((UserVO)session.getAttribute("userVO")).getNo()));
		//return "";
	}

	//댓글 신고 전체 리스트 확인
	@RequestMapping("/getCommentBlind.do")
	public ModelAndView getCommentBlind() {
		ModelAndView mav = new ModelAndView("admin/commentBlind");
		mav.addObject("commentBlind", aService.getCommentBlind());
		return mav;
	}

	//댓글 신고 리스트 확인
	@RequestMapping(value="/getCommentBlind.do", params={"commentBlindVO"})
	public ModelAndView getCommentBlind(@RequestParam CommentBlindVO commentBlindVO) {
		ModelAndView mav = new ModelAndView("admin/commentBlind");
		mav.addObject("commentBlind", aService.getCommentBlind(commentBlindVO));
		return mav;
	}

	//댓글의 신고 개수 확인
	@RequestMapping(value="/countCommentBlind.do", params={"commentBlindVO"})
	public ModelAndView countCommentBlind(@RequestParam CommentBlindVO commentBlindVO) {
		ModelAndView mav = new ModelAndView("admin/commentBlind");
		mav.addObject("commentBlindCount", aService.countCommentBlind(commentBlindVO));
		return mav;
	}

	//유저가 업체 신고
	@RequestMapping("/addHouseBlind.do")
	public void addHouseBlind(int no, HttpSession session) {
		aService.addHouseBlind(new HouseBlindVO(no, 
				((UserVO)session.getAttribute("userVO")).getNo()));
		//return "";
	}

	//업체 신고 전체 리스트 확인
	@RequestMapping("/getHouseBlind.do")
	public ModelAndView getHouseBlind() {
		ModelAndView mav = new ModelAndView("admin/houseBlind");
		mav.addObject("houseBlind", aService.getHouseBlind());
		return mav;
	}

	//한 업체의 신고 리스트 확인
	@RequestMapping(value="/getHouseBlind.do", params={"houseBlindVO"})
	public ModelAndView getHouseBlind(@RequestParam HouseBlindVO houseBlindVO) {
		ModelAndView mav = new ModelAndView("admin/houseBlind");
		mav.addObject("houseBlind", aService.getHouseBlind(houseBlindVO));
		return mav;
	}

	//한 업체의 신고 개수 확인
	@RequestMapping(value="/countHouseBlind.do")
	public ModelAndView countHouseBlind(HouseBlindVO houseBlindVO) {
		ModelAndView mav = new ModelAndView("admin/houseBlind");
		mav.addObject("houseBlindCount", aService.countHouseBlind(houseBlindVO));
		return mav;
	}
}
