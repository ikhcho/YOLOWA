package kr.co.bit.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.user.vo.HomeListVO;
import kr.co.bit.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public UserVO login(UserVO uvo) {
		return template.selectOne("user.login", uvo);
	}

	@Override
	public UserVO idCheck(String id) {
		return template.selectOne("user.idCheck", id);
	}

	@Override
	public void register(UserVO uvo) {
		template.insert("user.register", uvo);
	}
	
	@Override
	public HouseVO houseDetail(int no) {
		return template.selectOne("user.houseDetail", no);
	}

	@Override
	public List<HomeListVO> houseList() {
		// TODO Auto-generated method stub
		return template.selectList("user.houseList");
	}
	
	@Override
	public void updateUser(UserVO uvo) {
		
		template.update("user.updateUser", uvo);
	}
	
}
