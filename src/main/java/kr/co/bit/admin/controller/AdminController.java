package kr.co.bit.admin.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.bit.admin.service.AdminService;
import kr.co.bit.admin.vo.ApproveVO;
import kr.co.bit.admin.vo.CommentBlindVO;
import kr.co.bit.admin.vo.HouseBlindVO;
import kr.co.bit.board.vo.QBoardVO;
import kr.co.bit.user.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public ModelAndView home() throws JsonProcessingException {
		ModelAndView mav = new ModelAndView("admin/home");
		//지역별 숙소 개수		
		mav.addObject("locationMap", new ObjectMapper().writeValueAsString(aService.countHouseByRegion()));
		mav.addObject("locationMap", aService.countHouseByRegion());
		//총 수익
		mav.addObject("totalProfit", aService.calculateTotalProfit());
		//예약 건수
		mav.addObject("reservationCount", aService.countReservation());
		//예약 현황
		mav.addObject("reservationState", aService.checkReservation());
		//가격별 조회
		mav.addObject("houseByPrice", aService.classifyByPrice());
		
		return mav;
	}
	
	@RequestMapping(value="/locationMap.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Integer> locationMap() {
		//지역별 숙소 개수		
		//mav.addObject("locationMap", new ObjectMapper().writeValueAsString(aService.countHouseByRegion()));
		Map<String, Integer> map = aService.countHouseByRegion();
		
		return map;
	}
	
	@RequestMapping(value="/home.do", method=RequestMethod.POST)
	public String home(UserVO userVO){
		return "busi/home";
	}

	//가맹 신청 양식으로
	@RequestMapping(value="/joinPartner.do", method=RequestMethod.GET)
	public String joinPartnerForm() {
		return "admin/joinPartnerForm";
	}

	//가맹 신청 완료로
	@RequestMapping(value="/joinPartner.do", method=RequestMethod.POST)
	public ModelAndView joinPartner(ApproveVO approveVO) {
		ModelAndView mav = new ModelAndView("redirect:/user/home.do");
		mav.addObject("approveVO", aService.joinPartner(approveVO));
		return mav;
	}
	
	//가맹 해지 신청
	@RequestMapping(value="/quitPartner.do")
	public String quitPartner(ApproveVO approveVO) {
		aService.quitPartner(approveVO);
		return "admin/quitPartner";
	}

	/*//가맹 신청 목록 전체
	@RequestMapping(value="/getApprove.do")
	public ModelAndView getApprove() {
		ModelAndView mav = new ModelAndView("admin/approve");
		mav.addObject("approve", aService.getApprove());
		return mav;
	}*/

	//가맹 신청 상태별 목록
	@RequestMapping(value="/getApprove.do")
	public ModelAndView getApprove(ApproveVO approveVO) {
		System.out.println(approveVO.getUserNo());
		System.out.println(approveVO.getApproveKey());
		ModelAndView mav = new ModelAndView("admin/approve");
		mav.addObject("approve", aService.getApprove(approveVO));
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
		if(approveVO.getApproveState().equals("A")){
			approveVO.setApproveState("승인");
		}else{
			approveVO.setApproveState("거부");
		}
		aService.updateApproveState(approveVO);
		return "redirect:/admin/getApprove.do";
	}

	//유저가 댓글 신고
	@RequestMapping("/addCommentBlind.do")
	public String addCommentBlind(int no, HttpSession session) {
		aService.addCommentBlind(new CommentBlindVO(no, 
				((UserVO)session.getAttribute("userVO")).getNo()));
		return "redirect:/board/list.do?no="+no;
	}

	/*//댓글 신고 전체 리스트 확인
	@RequestMapping("/getCommentBlind.do")
	public ModelAndView getCommentBlind() {
		ModelAndView mav = new ModelAndView("admin/commentBlind");
		mav.addObject("commentBlind", aService.getCommentBlind());
		return mav;
	}*/

	//댓글 신고 리스트 확인
	@RequestMapping(value="/getCommentBlind.do")
	public ModelAndView getCommentBlind(CommentBlindVO commentBlindVO) {
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
	public String addHouseBlind(int no, HttpSession session) {
		aService.addHouseBlind(new HouseBlindVO(no, 
				((UserVO)session.getAttribute("userVO")).getNo()));
		return "redirect:/user/home.do";
	}

	/*//업체 신고 전체 리스트 확인
	@RequestMapping("/getHouseBlind.do")
	public ModelAndView getHouseBlind() {
		ModelAndView mav = new ModelAndView("admin/houseBlind");
		mav.addObject("houseBlind", aService.getHouseBlind());
		return mav;
	}*/

	//한 업체의 신고 리스트 확인
	@RequestMapping(value="/getHouseBlind.do")
	public ModelAndView getHouseBlind(HouseBlindVO houseBlindVO) {
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
	
	@RequestMapping(value="/cupdate.do", method=RequestMethod.GET)

	public String updateForm(@RequestParam("no") int no, Model model) {
		QBoardVO board = aService.selectByNoBoard(no);
		model.addAttribute("board", board);
		return "admin/qnapdate";
	}

	

	@RequestMapping(value="/cupdate.do", method=RequestMethod.POST)

	public String update(QBoardVO board, Model model) {
		aService.updateBoard(board);
		model.addAttribute("no", board.getNo());
		return "redirect:/admin/clist.do";
	}
	
	@RequestMapping("/clist.do")

	public ModelAndView list() {
		List<QBoardVO> list = aService.selectAllBoard();
		ModelAndView mav = new ModelAndView("admin/qnaList");
		mav.addObject("list", list);
		return mav;
	}
}
