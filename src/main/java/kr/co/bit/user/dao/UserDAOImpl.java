package kr.co.bit.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.user.vo.HouseVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public HouseVO houseDetail(int no) {
		return template.selectOne("user.houseDetail", no);
	}
}
