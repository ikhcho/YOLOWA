package kr.co.bit.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.user.dao.UserDAO;
import kr.co.bit.user.vo.HouseVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO udao;

	@Override
	public HouseVO houseDetail(int no) {
		return udao.houseDetail(no);
	}
}
