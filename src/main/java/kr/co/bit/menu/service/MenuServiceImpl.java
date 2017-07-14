package kr.co.bit.menu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.menu.dao.MenuDAO;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuDAO mdao;
}
