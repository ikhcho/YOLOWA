package kr.co.bit.busi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.busi.dao.BusiDAO;

@Service
public class BusiServiceImpl implements BusiService{
	
	@Autowired
	private BusiDAO bdao;
	
	
}
