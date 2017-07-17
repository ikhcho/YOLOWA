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
import org.springframework.web.servlet.ModelAndView;

import kr.co.bit.board.service.BoardService;
import kr.co.bit.board.vo.BoardVO;

@Controller 
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		
		List<BoardVO> list = service.selectAllBoard();
		ModelAndView mav = new ModelAndView("board/list");
		mav.addObject("list", list);
		
		return mav;
	}
	
	// /board/detail.do?no=12
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("no") int no, Model model) {
		BoardVO board = service.selectByNoBoard(no);
		model.addAttribute("board", board);
		
		return "board/detail";
	}
	
	//	/board/12/deatil.do
	@RequestMapping("/{no}/detail.do")
	public ModelAndView detailNo(@PathVariable int no) {
		
		BoardVO board = service.selectByNoBoard(no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/detail");
		mav.addObject("board", board);
		
		return mav;
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String writeForm(Model model) {
		
		System.out.println("get...");
		model.addAttribute("boardVO", new BoardVO());
		
		return "board/writeForm";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write(BoardVO board) {
		
		
		
		System.out.println("posst : " + board);
		
		service.insertBoard(board);
		
		return "redirect:/board/list.do";
	}
	
	// board/delete.do?no=3
		@RequestMapping("/delete.do")
		public void delete(@RequestParam("no") int no) {
			BoardVO board = new BoardVO();
			board.setNo(no);
			
			service.deleteBoard(board);
		}
		
		@RequestMapping(value="/update.do", method=RequestMethod.GET)
		public String updateForm(@RequestParam("no") int no, Model model) {
			
			BoardVO board = service.selectByNoBoard(no);
			model.addAttribute("board", board);
			
			return "board/updateForm";
		}
		
		@RequestMapping(value="/update.do", method=RequestMethod.POST)
		public String update(BoardVO board, Model model) {
			
			service.updateBoard(board);
			model.addAttribute("no", board.getNo());
			return "redirect:/board/detail.do";
		}
		
		
}