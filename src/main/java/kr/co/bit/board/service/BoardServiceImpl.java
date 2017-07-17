package kr.co.bit.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.board.dao.BoardDAO;


@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO bdao;
	
	
}
