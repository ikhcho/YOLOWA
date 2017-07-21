package kr.co.bit.board.service;



import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;



import kr.co.bit.board.dao.QBoardDAO;


import kr.co.bit.board.vo.QBoardVO;



@Service

public class QBoardServiceImpl implements QBoardService {



	@Autowired

	private QBoardDAO dao;

	

	public List<QBoardVO> selectAllBoard() {

		List<QBoardVO> list = dao.selectAllBoard();

		return list;

	}



	public QBoardVO selectByNoBoard(int no) {

		QBoardVO board = dao.selectByNoBoard(no);

		return board;

	}



	public void insertBoard(QBoardVO board) {



		dao.insertBoard(board);

	}

	

	public void deleteBoard(QBoardVO board) {



		dao.deleteBoard(board);

	}



	public void updateBoard(QBoardVO board) {



		dao.updateBoard(board);

	}

	

}