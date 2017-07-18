package kr.co.bit.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.busi.vo.HouseVO;
import kr.co.bit.user.dao.UserDAO;
import kr.co.bit.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO udao;

	@Override
	public HouseVO houseDetail(int no) {
		return udao.houseDetail(no);
	}
	
	@Override
	public UserVO login(UserVO uvo) {
		return udao.login(uvo);
	}

	@Override
	public Boolean idCheck(String id) {
		return udao.idCheck(id) != null?true:false;
	}

	@Override
	public void register(UserVO uvo) {
		udao.register(uvo);
	}
}
