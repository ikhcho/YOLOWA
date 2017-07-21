package kr.co.bit.board.dao;



import java.util.List;



import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;




import kr.co.bit.board.vo.QBoardVO;



@Repository

public class QBoardDAOImpl implements QBoardDAO {



	@Autowired

	private SqlSessionTemplate sqlSessionTemplate;

	

	

	public List<QBoardVO> selectAllBoard() {

		

		List<QBoardVO> list 

			= sqlSessionTemplate.selectList("qboard.selectAllBoard");

		

		return list;

	}



	public QBoardVO selectByNoBoard(int no) {

		

		QBoardVO board 

			= sqlSessionTemplate.selectOne("qboard.selectOneByNo", no);

		

		return board;

	}



	public void insertBoard(QBoardVO board) {



		sqlSessionTemplate.insert("qboard.insertBoard", board);

		

	}

	

	public void deleteBoard(QBoardVO board){

		sqlSessionTemplate.delete("qboard.deleteBoard", board);

	}

	

	public void updateBoard(QBoardVO board) {



		sqlSessionTemplate.update("qboard.updateBoard", board);

		

	}

	





}
