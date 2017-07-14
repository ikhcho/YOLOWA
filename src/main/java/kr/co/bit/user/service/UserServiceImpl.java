package kr.co.bit.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO udao;
}
