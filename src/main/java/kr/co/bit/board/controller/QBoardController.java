package kr.co.bit.board.controller;



import java.util.List;



import javax.validation.Valid;



import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



import kr.co.bit.board.service.QBoardService;


import kr.co.bit.board.vo.QBoardVO;



@Controller 

@RequestMapping("/board")

public class QBoardController {

	@Autowired
	private QBoardService Qservice;

	@RequestMapping("/qlist.do")
	public ModelAndView list() {
		List<QBoardVO> list = Qservice.selectAllBoard();
		ModelAndView mav = new ModelAndView("board/Qlist");
		mav.addObject("list", list);
		return mav;

	}

	

	// /board/detail.do?no=12
	@RequestMapping("/qdetail.do")
	public String detail(@RequestParam("no") int no, Model model) {
		QBoardVO board = Qservice.selectByNoBoard(no);
		model.addAttribute("board", board);
		return "board/Qdetail";
	}

	

	//	/board/12/deatil.do
	@RequestMapping("/{no}/qdetail.do")
	public ModelAndView detailNo(@PathVariable int no) {
		QBoardVO board = Qservice.selectByNoBoard(no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/Qdetail");
		mav.addObject("board", board);
		return mav;

	}

	

	@RequestMapping(value="/qwrite.do", method=RequestMethod.GET)

	public String writeForm(Model model) {

		System.out.println("get...");
		model.addAttribute("QboardVO", new QBoardVO());
		return "board/QwriteForm";
	}

	@RequestMapping(value="/qwrite.do", method=RequestMethod.POST)
	/*@ResponseBody*/
	public String write(QBoardVO board, Model model) {
		System.out.println("post : " + board);
		Qservice.insertBoard(board);
		model.addAttribute("msg", "문의가 접수 되었습니다 ^__^");  
		return "redirect:/user/mypage.do";
 
	}

	

	// board/delete.do?no=3

		@RequestMapping("/qdelete.do")

		public String delete(@RequestParam("no") int no) {

			QBoardVO board = new QBoardVO();

			board.setNo(no);

			
			Qservice.deleteBoard(board);
			
			return "redirect:/board/qlist.do";

		}

		

		@RequestMapping(value="/qupdate.do", method=RequestMethod.GET)

		public String updateForm(@RequestParam("no") int no, Model model) {
			QBoardVO board = Qservice.selectByNoBoard(no);
			model.addAttribute("board", board);
			return "board/QupdateForm";

		}

		

		@RequestMapping(value="/qupdate.do", method=RequestMethod.POST)
		public String update(QBoardVO board, Model model) {
			Qservice.updateBoard(board);
			model.addAttribute("no", board.getNo());
			return "redirect:/board/qdetail.do";
		}

}