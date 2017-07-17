package kr.co.bit.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.admin.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adao;
	
	
}
