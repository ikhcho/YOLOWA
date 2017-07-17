package kr.co.bit.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.data.dao.DataDAO;

@Service
public class DataServiceImpl implements DataService{

	@Autowired
	private DataDAO dDao;
	
	
}
